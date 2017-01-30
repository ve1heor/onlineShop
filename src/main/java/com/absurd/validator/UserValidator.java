package com.absurd.validator;

import com.absurd.entity.User;
import com.absurd.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class UserValidator implements Validator {

    @Autowired
    private UserService userService;

    @Override
    public boolean supports(Class<?> aClass) {
        return User.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        User user = (User) o;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors,"login","Required");

        if(user.getLogin().length()<5 || user.getLogin().length()>32){
            errors.rejectValue("login","Size");
        }
        if(userService.getUser(user.getLogin())!=null){
            errors.rejectValue("login","Duplicate");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "Required");

        if(user.getPassword().length()<8 || user.getPassword().length()>32){
            errors.rejectValue("password", "Size");
        }
    }
}
