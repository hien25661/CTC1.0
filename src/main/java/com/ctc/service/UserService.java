package com.ctc.service;

import java.util.List;

import com.ctc.model.User;

public interface UserService {
	void save(User user);

	User findByUsername(String userName);

	List<User> findAll();

	User findById(Long id);

	void del(Long id);

	void delAll();
}
