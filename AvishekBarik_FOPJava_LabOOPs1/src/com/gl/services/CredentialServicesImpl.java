package com.gl.services;
import java.util.Random;
import com.gl.model.Employee;

public class CredentialServicesImpl implements CredentialService{
	
	@Override
	public String generatePassword() {
		Random rnd = new Random();
		String password="";
		for(int i=0;i<8;i++)
		{
			char jumble = (char) (33 + rnd.nextInt(126));
			password=password+jumble;
		}
		return password;
	}

	@Override
	public String generateEmailAddress(Employee employee) {
		return employee.getFirstName()+employee.getLastName()+"@"+employee.getDepartment()+".gl.com";
	}

	@Override
	public void showCredentials(Employee employee) {
//		System.out.println("First Name: "+employee.getFirstName());
//		System.out.println("Last Name: "+employee.getLastName());
		System.out.println("Dear "+employee.getFirstName()+" your crentials are as follows");
		System.out.println("Email   ---> "+employee.getEmail());
		System.out.println("Password--->"+employee.getPassword());
	}
}
