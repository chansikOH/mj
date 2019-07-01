package kr.co.mj.util;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailUtils {
	private static Properties props = new Properties();

	static {
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "587");
	}
	
	public static void sendMail(String to, String content) throws Exception {
		Session session = Session.getInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("Newkurlyad", "Zxcv_!234");
			}
		});
		
		Message message = new MimeMessage(session);
		message.setFrom(new InternetAddress("Newkurlyad@gmail.com"));
		message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
		message.setSubject("민지컬리 인증코드메일입니다.");
		message.setContent(content, "text/html;charset=utf-8");
		
		Transport.send(message);
	}
	
	public static void sendMail(String from, String to, String subject, String content)  throws Exception {
		
		Session session = Session.getInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("Newkurlyad", "Zxcv_!234");
			}
		});
		
		Message message = new MimeMessage(session);
		message.setFrom(new InternetAddress(from));
		message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
		message.setSubject(subject);
		message.setContent(content, "text/html;charset=utf-8");
		
		Transport.send(message);
	}
	
	public static void main(String[] args) throws Exception{
		sendMail("kbun011877@naver.com", "test");
	}
	
	
}

