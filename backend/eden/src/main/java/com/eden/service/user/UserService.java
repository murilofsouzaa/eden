package com.eden.service.user;

import com.eden.dto.user.CreateUserRequest;
import com.eden.dto.user.UpdateUserRequest;
import com.eden.dto.user.UserResponse;
import com.eden.mapper.UserMapper;
import com.eden.model.shopping_cart.ShoppingCart;
import com.eden.model.user.User;
import com.eden.repository.UserRepository;
import com.eden.service.cart.ShoppingCartService;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class UserService {

    final private UserRepository userRepository;
    final private ShoppingCartService shoppingCartService;
    final private UserValidator validator;

    public UserService(UserRepository userRepository, @Lazy ShoppingCartService shoppingCartService, UserValidator validator){
        this.userRepository = userRepository;
        this.shoppingCartService = shoppingCartService;
        this.validator = validator;
    }
       

    public UserResponse createUser(CreateUserRequest userRequest){

        User newUser = new User();
        newUser.setName(userRequest.name());
        newUser.setEmail(userRequest.email());
        newUser.setGender(userRequest.gender());
        newUser.setBirthDay(userRequest.birthDay());
        newUser.setPassword(userRequest.password());
        newUser.setRole(userRequest.role());
        newUser.setCreatedAt(LocalDateTime.now());
        
        userRepository.save(newUser);
        
        ShoppingCart cart = shoppingCartService.createCart(newUser);
        newUser.setCart(cart);
        userRepository.save(newUser);

        return UserMapper.toResponse(newUser);
    }

    public UserResponse updateUser(Long id, UpdateUserRequest updateUserRequest){
        User user = userRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("User not found!"));

        validator.validateUpdateRequest(updateUserRequest);

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

        return UserMapper.toResponse(user);
    }

    public String deleteUser(Long id){
        User user = userRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("User not found!"));

            userRepository.delete(user);
            return "User was deleted successfully!";
    }

    public User getUserById(Long id){
        return userRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("User not found!"));
    }

    public User getUserByUsername(String username){
        return userRepository.findUserByName(username);
    }

    public List<User> listAllUsers(){
        return userRepository.findAll();
    }


}
