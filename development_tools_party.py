#!/usr/bin/env /opt/homebrew/opt/python@3.10/bin/python3.10
#!/usr/bin/env /usr/bin/python3

# Run this to generate bash auto complete script: Tools -- --completion

import os, re
from auto_everything.python import Python
from auto_everything.terminal import Terminal
from auto_everything.disk import Disk
from auto_everything.develop import GRPC
from auto_everything.io import IO

from pprint import pprint

from regex import F

py = Python()
t = Terminal(debug=True)
disk = Disk()
grpc = GRPC()
io_ = IO()

def itIsWindows():
    if os.name == 'nt':
        return True
    return False

class Tools():
    def __init__(self) -> None:
        self.project_root_folder = disk.get_directory_name(os.path.realpath(os.path.abspath(__file__))) 
        self.protobuff_protocols_folder = disk.join_paths(self.project_root_folder, "party_protocols", "protocols")

    def help(self):
        print(help(Tools))
    
    def hi(self):
        self.help()

    def start(self):
        t.run("code we_love_party")
    
    def protocol_pre_process(self):
        protocol_folder = disk.join_paths(self.project_root_folder, "party_protocols/protocols")
        files = disk.get_files(protocol_folder, type_limiter=[".proto"])

        data_model_file_path = disk.join_paths(protocol_folder, "data_model.proto")
        data_model_content = io_.read(data_model_file_path)
        proto_string = data_model_content
        found = re.findall(r"(message\s+\w+\s+\{(\s*.*?\s*)+\})", proto_string, re.DOTALL)

        all_message_models = [one[0] for one in found]
        text_that_need_to_get_added = "\n\n".join(all_message_models)

        seperator = "\n\n//-------yingshaoxo-------\n\n"
        for file in files:
            if "data_model.proto" not in file:
                content = io_.read(file)
                if seperator not in content:
                    content += seperator + text_that_need_to_get_added
                else:
                    splits = content.split(sep=seperator)
                    content = splits[0] + seperator + text_that_need_to_get_added
                io_.write(file_path=file, content=content)
                print(f"{file} got processed.")

        print(f"\nprotocol pre_process has been done, sir.")

    def build_protocols(self):
        pass
    
    def build_python_protocols(self):
        pass

    def build_management_system_golang_backend_service_protocols(self):
        management_system_folder = disk.join_paths(self.project_root_folder, "management_system")
        golang_backend_service_folder = disk.join_paths(management_system_folder, "golang_backend_service")
        the_generated_grpc_folder = disk.join_paths(golang_backend_service_folder, "generated_grpc")

        grpc.generate_golang_code(
            input_folder=self.protobuff_protocols_folder, 
            input_files=["management_service.proto"],
            output_folder=the_generated_grpc_folder,
        )

py.make_it_global_runnable(executable_name="development_tools_party")
py.fire(Tools)
