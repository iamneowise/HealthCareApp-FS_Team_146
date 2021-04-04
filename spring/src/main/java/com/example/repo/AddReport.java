package com.example.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.model.Report;

@Repository
public interface AddReport extends JpaRepository<Report, Integer>  {

}
