package com.eden.service;

import com.eden.dto.user.CreateUserRequest;
import com.eden.dto.user.UserResponse;
import com.eden.model.user.User;
import com.eden.repository.UserRepository;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    private UserRepository userRepository;

    public UserService(UserRepository userRepository){
        this.userRepository = userRepository;
    }

    public UserResponse createUser (CreateUserRequest userRequest){

        User newUser = new User();

        newUser.setName(userRequest.name());
        newUser.setEmail(userRequest.email());
        newUser.setGender(userRequest.gender());
        newUser.setBirthDay(userRequest.birthDay());
        newUser.setPassword(userRequest.password());

        userRepository.save(newUser);

        return new UserResponse(
                newUser.getId(),
                newUser.getName(),
                newUser.getGender(),
                newUser.getEmail(),
                newUser.getCreatedAt()
        );
    }
}
