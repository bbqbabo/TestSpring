package mail;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import mail.SMTPAuthenticator;

public class MailAction {
	//���� �߻� �޼���
	public String RandomNum(){

		StringBuffer buffer = new StringBuffer();
		for(int i=0; i <= 6; i++){
		    int n =(int)(Math.random() *10);
		     buffer.append(n); 

		}
		return buffer.toString();
	}
	
	
	//�̸�������
	
	public int sendEmail(String to, String authNum) {

		 //POP ��Ʈ : 995, ���ȿ���(SSL) �ʿ�
		 // SMTP ���� �ּ� "SMTP �ּҳ� �����ǵ� ����"
		 String smtpHost = "smtp.naver.com";
		 
			String subject = "이메일 인증!!!";
			String content = "[" + authNum + "]";

		 //�޴� ����� ����
		 String toEmail = to;


		 //������ ����� ����
		 String fromName = "22세기 운동혁명!!";
		 String fromEmail = "leonu@naver.com";
		 
		 
		 try {
		  Properties props = new Properties();
		  props.put("mail.smtp.host", smtpHost);
		  props.put("mail.smtp.auth","true");


		  // ���� ����
		  Authenticator myauth=new SMTPAuthenticator(); 
		  Session sess=Session.getInstance(props, myauth);


		  InternetAddress addr = new InternetAddress();
		  addr.setPersonal(fromName,"UTF-8");
		  addr.setAddress(fromEmail);


		  Message msg = new MimeMessage(sess);
		  msg.setFrom(addr);         
		  msg.setSubject(MimeUtility.encodeText("�̸��� ������ȣ���� ", "utf-8","B"));
		  msg.setContent(content, "text/html;charset=utf-8");
		  msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
		  msg.setSubject(subject);


		  Transport.send(msg);

		  return 1;
		  
		 } catch (Exception e) {
		  e.printStackTrace();
		 
		  System.out.println("<script>alert('���� ���ۿ� �����߽��ϴ�.\\n�ٽ� �õ����ּ���.');</script>");
		  return 0;
		
		 }
	  }	 
}
