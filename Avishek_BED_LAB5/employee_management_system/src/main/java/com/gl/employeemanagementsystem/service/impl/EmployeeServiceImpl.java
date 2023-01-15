package com.gl.employeemanagementsystem.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gl.employeemanagementsystem.entity.Employee;
import com.gl.employeemanagementsystem.repository.EmployeeRepository;
import com.gl.employeemanagementsystem.service.EmployeeService;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	EmployeeRepository emprepo;

	@Override
	public List<Employee> viewAllEmployees() {
		return emprepo.findAll();
	}

	@Override
	public Employee addEmployee(Employee employee) {
		return emprepo.save(employee);
	}

	@Override
	public Employee getEmployeeById(int employeeId) {
		return emprepo.findById(employeeId).get();
	}

	@Override
	public Employee updateEmployee(Employee employee) {
		return emprepo.save(employee);
	}

	@Override
	public void deleteEmployeeById(int employeeId) {
		emprepo.deleteById(employeeId);
	}

}
