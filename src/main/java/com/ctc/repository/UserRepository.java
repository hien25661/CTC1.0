package com.ctc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ctc.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
	User findByUsername(String userName);
}
