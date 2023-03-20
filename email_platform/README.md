# Email Platform

Although this email service can't send email to other people due to `server providers email port block`, it can be used to receive email.

There are 2 options, but I decided to use other solution since my VPS has limited memory and disk storage:
* https://github.com/mailcow/mailcow-dockerized
* https://github.com/Mailu/Mailu 

I'm going to make a SMTP(Simple Mail Transfer Protocol) service by myself:
* https://stackoverflow.com/a/10850619/8667243
* https://aiosmtpd.readthedocs.io/en/latest/migrating.html
* https://docs.python.org/3/library/email.examples.html
* https://petri.com/configure_mx_records_for_incoming_smtp_email_traffic/
* https://stackoverflow.com/questions/7297373/smtp-directly-to-a-hosts-mx-record

## How I did

For the python part, you can simply use python to set up a `SMTP` service, which will listen to a port, for google, they use `25`.

Then if you want the outside world to be able to send email to you, you have to set up a `MX record` and an `A record`.

It is normally like this:

```
MX  your_domain.com          mail.your_domain.com
A   mail.your_domain.com     192.168.3.123(your server IP address)
```

Then you could send email to your email service by specify the sender email as `admin@mail.your_domain.com`

## email service example

```python
import smtpd
import asyncore
from typing import Any

class CustomSMTPServer(smtpd.SMTPServer):
    def process_message(self, peer: Any, mailfrom: Any, rcpttos: Any, data: Any, mail_options: Any = None,rcpt_options: Any = None):
        print ('Receiving message from:', peer)
        print ('Message addressed from:', mailfrom)
        print ('Message addressed to  :', rcpttos)
        print ('Message length        :', len(data))
        print(data)
        return None

server = CustomSMTPServer(('0.0.0.0', 25), None) #type: ignore

asyncore.loop()
```

## email sender example

```python
import smtplib
from email.message import EmailMessage

msg = EmailMessage()
msg['Subject'] = f'Hi, you!'
msg['From'] = "yingshaoxo@gmail.com"
msg['To'] = "lili@gmail.com"

s = smtplib.SMTP('0.0.0.0', port=25)
s.send_message(msg)
s.quit()
```