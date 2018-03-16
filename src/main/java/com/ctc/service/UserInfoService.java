package com.ctc.service;

import java.util.List;

import com.ctc.model.UserInfo;

public interface UserInfoService {
	List<UserInfo> findAll();

	void save(UserInfo userInfo);

	void deleteUserInfo(Long id);
}
