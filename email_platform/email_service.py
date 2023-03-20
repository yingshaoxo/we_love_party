from typing import Any
from aiosmtpd.controller import Controller

from email.parser import Parser
from email.policy import default

class CustomHandler:
    async def handle_DATA(self, server: Any, session: Any, envelope: Any):
        mail_from = envelope.mail_from
        data = envelope.content         

        try:
            headers = Parser(policy=default).parsestr(data.decode(encoding="utf-8"))
            content = headers['subject']
            print(f"mail_from: {mail_from}")
            print(content)
        except Exception as e:
            print(e)
            return '500 Could not process your message'

        return '250 OK'

if __name__ == '__main__':
    handler = CustomHandler()
    controller = Controller(handler, hostname='0.0.0.0', port=25)
    controller.start()
    input('SMTP server running. (Press Return to stop server and exit.\n\n')
    controller.stop()





# import smtpd
# import asyncore
# from typing import Any

# class CustomSMTPServer(smtpd.SMTPServer):
#     def process_message(self, peer: Any, mailfrom: Any, rcpttos: Any, data: Any, mail_options: Any = None,rcpt_options: Any = None):
#         print ('Receiving message from:', peer)
#         print ('Message addressed from:', mailfrom)
#         print ('Message addressed to  :', rcpttos)
#         print ('Message length        :', len(data))
#         print(data)
#         return None

# server = CustomSMTPServer(('0.0.0.0', 25), None) #type: ignore

# asyncore.loop()
