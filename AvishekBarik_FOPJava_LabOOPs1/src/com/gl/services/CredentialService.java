package com.gl.services;

import com.gl.model.Employee;

public interface CredentialService {
	
	public String generatePassword();
	//public String generateEmailAddress(String firstName, String lastName, String department);
	//public void showCredentials(Employee employee, String email);//, char[] generatePassword());
	//public void showCredentials(String firstName, String lastName, String department, String password);
	void showCredentials(Employee employee);
	String generateEmailAddress(Employee employee);
	
	
	
	//import com.gl.model.Employee;

}





