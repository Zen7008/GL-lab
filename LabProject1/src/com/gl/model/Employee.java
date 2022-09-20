package com.gl.model;

import java.util.Scanner;

public class Employee {
	private String firstName, lastName, password, department,email;
	////////////////////////////
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	//////////////////////////////
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	/////////////////////////
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	///////////////////////////////
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	/////////////////////////////////
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	///////////////////////////////
	public Employee()
	{
//		Scanner sc=new Scanner(System.in);
//		System.out.println("Enter first Name: ");
//		setFirstName(sc.nextLine());
//		System.out.print("Enter last Name: ");
//		setLastName(sc.nextLine());
//		setDepartment();
//		sc.close();
	}
	////////////////////////////////////
	//import com.gl.services.CredentialServicesImpl;
	/////////////////////////////////////


}
