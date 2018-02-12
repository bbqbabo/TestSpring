package mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class SMTPAuthenticator extends Authenticator { //���̵� �н����� �����ޱ� �Լ�
	  
	PasswordAuthentication pa;
	  public SMTPAuthenticator(){
	    pa=new PasswordAuthentication("leonu","312761yjb!@");        
	  }
	  @Override
	  protected PasswordAuthentication getPasswordAuthentication() {
	    return pa;
	  }
	}