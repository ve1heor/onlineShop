package com.absurd.controller;

import com.absurd.entity.User;
import com.absurd.service.UserService;
import com.absurd.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.HashSet;
import java.util.Set;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserValidator userValidator;

    @RequestMapping(value = "/" , method = RequestMethod.GET)
    public String start(Model model){
        return "index";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model){
        model.addAttribute("userForm", new User());
        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult,Model model){
        userValidator.validate(userForm,bindingResult);

        if(bindingResult.hasErrors()){
            return "registration";
        }

        userService.addUser(userForm);

        return "redirect:/";
    }

    @RequestMapping(value = "/search", method = RequestMethod.POST)
    @ResponseBody
    public Set<String> search(@RequestParam("search") String searchText) {
        Set<String> records = new HashSet<String>();
        records.add(searchText);
        return records;
    }


}