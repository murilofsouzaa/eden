package com.eden.controller;

import com.eden.dto.user.CreateUserRequest;
import com.eden.dto.user.UserResponse;
import com.eden.model.user.User;
import com.eden.repository.UserRepository;
import com.eden.service.UserService;
import org.apache.coyote.Response;
import org.springframework.data.repository.query.Param;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
public class UserController {

    UserService userService;

    public UserController(UserService userService){
        this.userService = userService;
    }

    @PostMapping("/users")
    public ResponseEntity<UserResponse> getUserById(@RequestBody CreateUserRequest user){
        UserResponse savedUserResponse = userService.createUser(user);
        return ResponseEntity.status(HttpStatus.CREATED).body(savedUserResponse) ;
    };




}
