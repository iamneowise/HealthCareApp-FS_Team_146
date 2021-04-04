package com.example.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.model.Register;

@Repository
public interface UserAddRepo extends JpaRepository<Register, Long>{

	List<Register> findByRole(String role);
	Register findByEmail(String email);
}
