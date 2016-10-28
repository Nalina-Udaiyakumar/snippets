## R Script to send mails from am SMTP enabled mail ID

#install.packages("mailR")
library(mailR)

sender <- "nalina.u@gmail.com"
recipients <- c("nalinau1992@gmail.com")
send.mail(from = sender,
          to = recipients,
          subject = "Subject of the email",
          body = "Body of the email",
          smtp = list(host.name = "smtp.gmail.com", port = 465, 
                      user.name = "nalina.u@gmail.com",            
                      passwd = "xxxxxxxxxx", ssl = TRUE),
          authenticate = TRUE,
          send = TRUE)
          
### This is a simple mail with title and body. A mail with attachemnt has to have a MIME attachment in its body
