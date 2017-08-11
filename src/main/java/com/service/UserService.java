package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.UserDao;
import com.entity.User;

import javax.persistence.Query;
import java.util.List;

@Service
@Transactional
public class UserService {
	@Autowired
	private UserDao userDao;
	
	public void addUser(User user) {
		userDao.persist(user);
	}
	
	public User getUser(String userName, String password) {
		return userDao.find(userName, password);
	}

	public void updateUser(User user) {
		userDao.persist(user);
	}

	public List<User> getUsers() {
		return  userDao.find();
	}

    public boolean getUserName(String username) {
		return  userDao.getUserName(username);
    }
}
