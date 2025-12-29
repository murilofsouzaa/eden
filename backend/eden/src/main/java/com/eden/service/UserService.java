package com.eden.service;

import com.eden.dto.user.CreateUserRequest;
import com.eden.dto.user.UpdateUserRequest;
import com.eden.dto.user.UserResponse;
import com.eden.model.user.User;
import com.eden.model.user.UserRole;
import com.eden.repository.UserRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {

    private UserRepository userRepository;

    public UserService(UserRepository userRepository){
        this.userRepository = userRepository;
    }

    public UserResponse createUser(CreateUserRequest userRequest){

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

    public String updateUser(Long id, UpdateUserRequest updateUserRequest){
        User user = userRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("User not found!"));

        if (updateUserRequest.name() != null) {
            user.setName(updateUserRequest.name());
        }
        if(updateUserRequest.email() != null){
            user.setEmail(updateUserRequest.email());
        }
        if(updateUserRequest.gender() != null){
            user.setGender(updateUserRequest.gender());
        }
        if(updateUserRequest.birthDay() != null){
            user.setBirthDay(updateUserRequest.birthDay());
        }

        userRepository.save(user);

        return "Updated successfully!";
    }

    public String deleteUser(Long id){
        User user = userRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("User not found!"));
        if(user == null){
            return "User not found!";
        }
        if(user.getRole().equals(UserRole.ADMIN)){
            userRepository.delete(user);
            return "User was deleted successfully!";
        }
            return "You don't have permission to delete the user";
    }

    public List<User> listAllUsers(){
        return userRepository.findAll();
    }


}
