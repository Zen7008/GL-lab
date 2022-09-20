package com.gl.test1;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import com.gl.model.Employee;
import com.gl.services.CredentialServicesImpl;

public class Test {
	

	public static void main(String[] args)
	{
		List<Employee> EmployeeList= new ArrayList<>();
		CredentialServicesImpl cred=new CredentialServicesImpl();
		Scanner sc=new Scanner(System.in);
		System.out.println("Number of Entries?");
		int numberOfEntries= sc.nextInt();
		for(int i=0;i<numberOfEntries;i++)
		{
			Employee emp=new Employee();
			EmployeeList.add(emp);
		}
		
		for(Employee employee: EmployeeList)
		{
			System.out.print("Enter First Name: ");
			employee.setFirstName(sc.next());
			System.out.print("Enter Last Name: ");
			employee.setLastName(sc.next());
			
			System.out.println("Choose your Department: \n1.Technical \n2.Admin  \n3.Human Resource \n4.Legal");
			int option=5;
			
			while(option!=99)
			{
				option=sc.nextInt();
				if(option==1) {
					employee.setDepartment("tech");
					option=99;
				}
					
				else if(option==2) {
					employee.setDepartment("adm");
					option=99;
				}
					
				else if(option ==3) {
					employee.setDepartment("hr");
					option=99;
				}
					
				else if(option==4)	{
					employee.setDepartment("lgl");
					option=99;
				}
					
				else
					System.out.println("Invalid Input Try Again");
			}
			employee.setPassword(cred.generatePassword());
			employee.setEmail(cred.generateEmailAddress(employee));
			cred.showCredentials(employee);
			System.out.println();
		}
		sc.close();
		
	}

}
