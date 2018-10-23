<%@page import="javax.mail.*,javax.mail.internet.*,java.util.Properties"%>
<%
 String msg=request.getParameter("result");
  String SMTP_HOST_NAME = "smtp.gmail.com";
  int SMTP_HOST_PORT = 465;
  String SMTP_AUTH_USER ="sender mail id";
  String SMTP_AUTH_PWD  = "snder password";
   try
   {
    Properties props = new Properties();
    props.put("mail.transport.protocol", "smtps");
    props.put("mail.smtps.host", SMTP_HOST_NAME);
    props.put("mail.smtps.auth", "false");
    Session mailSession = Session.getDefaultInstance(props);
    mailSession.setDebug(true);
    Transport transport = mailSession.getTransport();
    MimeMessage message = new MimeMessage(mailSession);
    message.setSubject("Voice Mail");
    message.setContent(msg, "text/plain");     		        
    message.addRecipient(Message.RecipientType.TO,new InternetAddress("receiver mail id "));
    transport.connect(SMTP_HOST_NAME, SMTP_HOST_PORT,SMTP_AUTH_USER, SMTP_AUTH_PWD);
    transport.sendMessage(message,message.getRecipients(Message.RecipientType.TO));
    transport.close();
   }
   catch(Exception e)
   {
    out.println(e);
   }
 


    %>

