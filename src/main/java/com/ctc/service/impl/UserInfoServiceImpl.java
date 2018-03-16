package com.ctc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ctc.model.UserInfo;
import com.ctc.repository.UserInfoRepository;
import com.ctc.service.UserInfoService;

@Service
//@Transactional(readOnly=true)
public class UserInfoServiceImpl implements UserInfoService {
	@Autowired
	UserInfoRepository userInfoRepository;

	/* (non-Javadoc)
	 * @see com.sam.service.UserInfoService#findAll()
	 */
	@Override
	public List<UserInfo> findAll() {
		return userInfoRepository.findAll();
	}

	@Override
	@Transactional(readOnly=false)
	public void save(UserInfo userInfo) {
		// TODO Auto-generated method stub
		userInfoRepository.save(userInfo);
	}

	@Override
	public void deleteUserInfo(Long id) {
		// TODO Auto-generated method stub
		userInfoRepository.delete(id);
	}


}
