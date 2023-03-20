from typing import Any, Callable

class SMTP_Service():
    def __init__(self, host: str, port: int, handler: Callable[[str, str, str], None]):
        """
        host: 0.0.0.0
        port: 25
        handler: (from: str, to: str, content: str) => None
        """
        from aiosmtpd.controller import Controller

        class CustomHandler:
            async def handle_DATA(self, server: Any, session: Any, envelope: Any):
                mail_from = envelope.mail_from
                mail_to = envelope.rcpt_tos
                data = envelope.content

                try:
                    print(f"mail_from: {mail_from}")
                    print("\n\n---\n\n")
                    handler(mail_from, mail_to, data.decode(encoding="utf-8"))
                except Exception as e:
                    print(e)
                    return '500 Could not process your message'

                return '250 OK'
        
        self.host = host
        self.port = port
        self.custom_handler = CustomHandler()
        self.controller = Controller(self.custom_handler, hostname=host, port=port)

    def start(self):
        from time import sleep
        self.controller.start()
        print(f'SMTP server is running on {self.host}:{self.port}.\n\n')
        while True:
            sleep(5)
    
    def stop(self):
        self.controller.stop()


if __name__ == '__main__':
    def handle_email(from_: str, to: str, message: str):
        print(from_)
        print(to)
        print(message)

    smtp_service = SMTP_Service(
        host="0.0.0.0",
        port=25,
        handler=handle_email
    )

    smtp_service.start()

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
