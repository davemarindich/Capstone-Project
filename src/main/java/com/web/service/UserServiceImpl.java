package com.web.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.model.Users;
import com.web.repository.UserRepository;

@Service
@Transactional
public class UserServiceImpl implements UserService {

	private UserRepository userRepository;
	
	@Autowired
	public UserServiceImpl(UserRepository userRepository) {
		super();
		this.userRepository = userRepository;
	}

	@Override
	public void save(Users user) {
		userRepository.save(user);
	}

	@Override
	public void delete(Long id) {
		userRepository.deleteById(id);
	}

	@Override
	public List<Users> findAll() {
		return userRepository.findAll();
	}

	@Override
	public void Update(Users user) {
		userRepository.findById(user.getId()).
		ifPresent(a->{
		  a.setAddress(user.getAddress());
		  a.setFname(user.getFname());
		  a.setLname(user.getLname());		  		  
		});
		
	}

	@Override
	public List<Users> SearchByname(String name) {
		return userRepository.searchByName(name);
	}

	@Override
	public Optional<Users> findByEmail(String email) {
		return userRepository.getByEmail(email);
	}

	@Override
	public Optional<Users> findById(Long id) {
		return userRepository.findById(id);
	}

	@Override
	public Optional<Users> login(String email, String password) {
		return userRepository.login(email, password);
	}

	@Override
	public void addcoment(Long id, String comment) {
		userRepository.findById(id).
		ifPresent(a->{
		  a.setComment(comment);		  	  
		});
	}

}
