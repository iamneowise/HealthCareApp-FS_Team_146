package com.example.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.example.model.Prescription;

@Repository
public interface addPrescription extends JpaRepository<Prescription, Integer> {

}
