package com.example.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.model.Hospital;

@Repository
public interface doctorHospital extends JpaRepository<Hospital, Integer> {

	Hospital findByEmail(String email);
}
