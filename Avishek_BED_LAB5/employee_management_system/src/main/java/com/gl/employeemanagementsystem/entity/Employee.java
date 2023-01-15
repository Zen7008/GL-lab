package com.gl.employeemanagementsystem.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Data;

@Data
@Entity
public class Employee {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int employeeId;

	@Column(name = "first_name")
	String employeeFirstName;

	@Column(name = "last_name")
	String employeeLastName;

	@Column(name = "email")
	String employeeEmail;

}
