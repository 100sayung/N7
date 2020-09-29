package com.n7.erp.bean.entity;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator{

	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("mykyj2000@gmail.com", "rladPwls1@"); 
	}
	
}
