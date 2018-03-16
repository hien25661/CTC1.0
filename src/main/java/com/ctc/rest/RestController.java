package com.ctc.rest;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ctc.dto.UserInfoDTO;
import com.ctc.model.User;
import com.ctc.model.UserInfo;
import com.ctc.service.SecurityService;
import com.ctc.service.UserInfoService;
import com.ctc.service.UserService;

@org.springframework.web.bind.annotation.RestController
@RequestMapping(value="/rest")
public class RestController {

	@Autowired
	UserInfoService userInfoService;
	@Autowired
	UserService userService;
	@Autowired
	private SecurityService securityService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public List<UserInfoDTO> listAllUsers() {
		List<UserInfo> list = userInfoService.findAll();
		List<UserInfoDTO> listBean = new ArrayList<>();
		for (UserInfo u : list) {
			UserInfoDTO userInfoDTO = new UserInfoDTO();
			userInfoDTO.setId(u.getId());
			userInfoDTO.setUserName(u.getUser().getUsername());
			userInfoDTO.setFirstName(u.getFirstName());
			userInfoDTO.setLastName(u.getLastName());
			userInfoDTO.setUnit(u.getUnit());
			userInfoDTO.setPosition(u.getPosition());
			userInfoDTO.setPassword(u.getUser().getPasswordConfirm());
			listBean.add(userInfoDTO);
		}
		return listBean;
	}

	@RequestMapping(value = "/", method = RequestMethod.POST)
	public ResponseEntity<UserInfoDTO> createUser(@RequestBody UserInfoDTO userInfoDTO) {
		
		// Kiem tra user co ton tai khong
		if (userService.findByUsername(userInfoDTO.getUsername()) != null) {
			userInfoDTO = new UserInfoDTO();
			userInfoDTO.setMessage("Can't create");
			return new ResponseEntity<UserInfoDTO>(userInfoDTO, HttpStatus.CONFLICT);
		}
		User user = new User();
		user.setUsername(userInfoDTO.getUsername());
		user.setPassword(userInfoDTO.getPassword());
		user.setPasswordConfirm(userInfoDTO.getPassword());
		userService.save(user);
		UserInfo userInfo = new UserInfo();
		userInfo.setFirstName(userInfoDTO.getFirstName());
		userInfo.setLastName(userInfoDTO.getLastName());
		userInfo.setUnit(userInfoDTO.getUnit());
		userInfo.setPosition(userInfoDTO.getPosition());
		userInfo.setUser(user);
		userInfoService.save(userInfo);

		// Lay id cua userInfo vua duoc save
		userInfoDTO.setId(userInfoService.findAll().get(userInfoService.findAll().size() - 1).getId());
		userInfoDTO.setMessage("Success");
		return new ResponseEntity<UserInfoDTO>(userInfoDTO, HttpStatus.CREATED);
	}

	@RequestMapping(value = "/", method = RequestMethod.PUT)
	public ResponseEntity<UserInfoDTO> updateUser(@RequestBody UserInfoDTO userInfoDTO) {
		
		// Kiem tra user co ton tai khong
		if (userService.findById(Long.valueOf(userInfoDTO.getId())) == null) {
			userInfoDTO = new UserInfoDTO();
			userInfoDTO.setMessage("User doesn't exist");
			return new ResponseEntity<UserInfoDTO>(userInfoDTO, HttpStatus.NOT_FOUND);
		}
		
		User user = new User();
		user.setId(Long.valueOf(userInfoDTO.getId()));
		user.setUsername(userInfoDTO.getUsername());
		user.setPassword(userInfoDTO.getPassword());
		user.setPasswordConfirm(userInfoDTO.getPassword());
		userService.save(user);
		UserInfo userInfo = new UserInfo();
		userInfo.setId(Long.valueOf(userInfoDTO.getId()));
		userInfo.setFirstName(userInfoDTO.getFirstName());
		userInfo.setLastName(userInfoDTO.getLastName());
		userInfo.setUnit(userInfoDTO.getUnit());
		userInfo.setPosition(userInfoDTO.getPosition());
		userInfo.setUser(user);
		userInfoService.save(userInfo);
		userInfoDTO.setMessage("Success");
		return new ResponseEntity<UserInfoDTO>(userInfoDTO, HttpStatus.OK);
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<UserInfoDTO> deleteUser(@PathVariable("id") Long id, UserInfoDTO userInfoDTO) {
		try {
			userInfoService.deleteUserInfo(id);
			userService.del(id);
			userInfoDTO.setMessage("Success");
			return new ResponseEntity<UserInfoDTO>(userInfoDTO, HttpStatus.OK);
		} catch (Exception e) {
			userInfoDTO.setMessage("Can't delete");
		}
		return new ResponseEntity<UserInfoDTO>(userInfoDTO, HttpStatus.NOT_FOUND);
	}
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ResponseEntity<UserInfoDTO> register(@RequestBody UserInfoDTO userInfoDTO) {
		
		// Kiem tra user co ton tai khong
		if (userService.findByUsername(userInfoDTO.getUsername()) != null) {
			userInfoDTO = new UserInfoDTO();
			userInfoDTO.setMessage("Can't create");
			return new ResponseEntity<UserInfoDTO>(userInfoDTO, HttpStatus.CONFLICT);
		}
		User user = new User();
		user.setUsername(userInfoDTO.getUsername());
		user.setPassword(userInfoDTO.getPassword());
		user.setPasswordConfirm(userInfoDTO.getPassword());
		userService.save(user);
		UserInfo userInfo = new UserInfo();
		userInfo.setFirstName(userInfoDTO.getFirstName());
		userInfo.setLastName(userInfoDTO.getLastName());
		userInfo.setUnit(userInfoDTO.getUnit());
		userInfo.setPosition(userInfoDTO.getPosition());
		userInfo.setUser(user);
		userInfoService.save(userInfo);
		
		securityService.autoLogin(user.getUsername(), user.getPasswordConfirm());

		// Lay id cua userInfo vua duoc save
		userInfoDTO.setId(userInfoService.findAll().get(userInfoService.findAll().size() - 1).getId());
		userInfoDTO.setMessage("Success");
		return new ResponseEntity<UserInfoDTO>(userInfoDTO, HttpStatus.CREATED);
	}

}
