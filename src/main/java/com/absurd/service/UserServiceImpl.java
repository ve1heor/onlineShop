package com.absurd.service;

import com.absurd.entity.User;
import com.absurd.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private ShaPasswordEncoder passwordEncoder;

    @Autowired
    private UserRepository userRepository;

    @Override
    public User addUser(User user) {

        user.setPassword(passwordEncoder.encodePassword(user.getPassword(),null));
        User savedUser = userRepository.saveAndFlush(user);

        return savedUser;
    }

    @Override
    public void delete(long id) {
        userRepository.delete(id);
    }

    @Override
    public User getUser(String login) {
        return userRepository.findByLogin(login);
    }

    @Override
    public User editUser(User user) {
        return userRepository.saveAndFlush(user);
    }

    @Override
    public List<User> getAll() {
        return userRepository.findAll();
    }

}