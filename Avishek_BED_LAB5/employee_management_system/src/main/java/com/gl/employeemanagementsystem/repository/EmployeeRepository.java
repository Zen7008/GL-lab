package com.gl.employeemanagementsystem.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.gl.employeemanagementsystem.entity.Employee;

public interface EmployeeRepository extends JpaRepository<Employee, Integer> {

}
