package com.example.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.model.Booking;


@Repository
public interface AddBooking extends JpaRepository<Booking, Integer> {


}
