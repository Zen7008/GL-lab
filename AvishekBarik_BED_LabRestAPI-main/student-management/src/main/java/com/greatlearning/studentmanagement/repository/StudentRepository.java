package com.greatlearning.studentmanagement.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.greatlearning.studentmanagement.entity.Student;

// JpaRepository AND CRUDRepository
public interface StudentRepository extends JpaRepository<Student, Integer> {

}
