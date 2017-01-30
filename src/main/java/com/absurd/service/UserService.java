package com.absurd.service;

import com.absurd.entity.User;

import java.util.List;

public interface UserService {

    User addUser(User user);
    void delete(long id);
    User getUser(String login);
    User editUser(User user);
    List<User> getAll();

}

