# Create the container (outer) email message.
msg = MIMEMultipart('alternative')
msg['Subject'] = 'Title of the mail'
family=['receipient1@xyz.com','receipient2@xyz.com']
msg['From'] = 'sender@xyz.com'
msg['To'] = COMMASPACE.join(family)
#msg['To'] = 'nalina.u@mu-sigma.com'   ## in case of a single receipient            

body="Hello Team,\n\nPlease find attached the files."
new_body = MIMEText(body, 'text')
new_body.add_header('Content-Disposition', 'inline', filename='body')
new_body.set_payload(body)
msg.attach(new_body)

### adding text or csv attachments to the mail - the type,subtype and file extensions will be different for each file
ctype, encoding = mimetypes.guess_type("/path/to/your/file")
if ctype is None or encoding is not None:
  ctype = 'application/octet-stream'        ## Assign the ctype to octet-stream in case it cannot be figured. Helps to attach a .xls file
maintype, subtype = ctype.split('/', 1)
mail_file = MIMEBase(maintype, subtype)

mail_file.set_payload(open('/path/to/your/file', 'rb').read())
mail_file.add_header('Content-Disposition', 'attachment', filename='attachment_name.x')
msg.attach(mail_file)

composed = msg.as_string()
# Send the email via an SMTP server.
s = smtplib.SMTP('sever Name', port number)    
s.sendmail('sender@xyz.com', ['receipient1@xyz.com','receipient2@xyz.com'],composed)
s.quit()
