import smtplib
from email.message import EmailMessage

msg = EmailMessage()
msg['Subject'] = f'verify:8360327668'
msg['From'] = "1576570260@qq.com"
msg['To'] = "god@mail.weloveparty.ai-tools-online.xyz"

# s = smtplib.SMTP('mail.weloveparty.ai-tools-online.xyz', port=25)
#s = smtplib.SMTP('0.0.0.0', port=25)
s = smtplib.SMTP('127.0.0.1', port=25)
s.send_message(msg)
s.quit()
