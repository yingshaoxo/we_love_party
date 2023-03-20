import smtplib
from email.message import EmailMessage

msg = EmailMessage()
msg['Subject'] = f'Hi, you!'
msg['From'] = "yingshaoxo@gmail.com"
msg['To'] = "lili@gmail.com"

# s = smtplib.SMTP('mail.weloveparty.ai-tools-online.xyz', port=25)
s = smtplib.SMTP('0.0.0.0', port=25)
s.send_message(msg)
s.quit()