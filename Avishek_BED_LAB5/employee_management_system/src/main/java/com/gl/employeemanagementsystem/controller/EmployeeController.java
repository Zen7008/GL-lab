package com.gl.employeemanagementsystem.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;

import com.gl.employeemanagementsystem.entity.Employee;
import com.gl.employeemanagementsystem.service.EmployeeService;

@Controller
//@RequestMapping(value = "/employee")
public class EmployeeController {

	@Autowired
	EmployeeService service;

	@GetMapping(value = "/employees")
	public String viewAllEmployees(Model model) {
		model.addAttribute("employeelist", service.viewAllEmployees());
		return "employeelist";
	}

	@GetMapping("/employees/new")
	public String createEmployee(Model model) {
		Employee employee = new Employee();
		model.addAttribute("employee", employee);
		return "createEmployee";
	}

	@PostMapping("/addemployee")
	public String addEmployee(@ModelAttribute("employee") Employee employee) {
		service.addEmployee(employee);
		return "redirect:/employees";
	}

	@GetMapping("/employees/edit/{employeeId}")
	public String editEmployee(@PathVariable int employeeId, Model model) {
		model.addAttribute("employee", service.getEmployeeById(employeeId));
		return "updateEmployee";
	}

	@PostMapping("/employees/{employeeId}")
	public String updateEmployee(@PathVariable int employeeId, @ModelAttribute("employee") Employee employee,
			Model model) {

		Employee existingEmployee = service.getEmployeeById(employeeId);
		existingEmployee.setEmployeeId(employeeId);
		existingEmployee.setEmployeeFirstName(employee.getEmployeeFirstName());
		existingEmployee.setEmployeeLastName(employee.getEmployeeLastName());
		existingEmployee.setEmployeeEmail(employee.getEmployeeEmail());

		service.updateEmployee(existingEmployee);
		return "redirect:/employees";
	}

	@GetMapping("/employees/{employeeId}")
	public String deleteEmployee(@PathVariable int employeeId) {
		service.deleteEmployeeById(employeeId);
		return "redirect:/employees";
	}
}
