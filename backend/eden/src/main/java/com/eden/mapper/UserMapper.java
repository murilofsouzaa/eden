package com.eden.mapper;

import com.eden.dto.user.UserResponse;
import com.eden.model.user.User;

public class UserMapper {

    public static UserResponse toResponse(User user){
        return new UserResponse(
                user.getId(),
                user.getName(),
                user.getGender(),
                user.getEmail(),
                user.getCreatedAt()
        );
    }
}
