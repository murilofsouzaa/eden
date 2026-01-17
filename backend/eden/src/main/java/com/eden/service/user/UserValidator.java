package com.eden.service.user;

import com.eden.dto.user.UpdateUserRequest;
import org.springframework.stereotype.Component;

//TODO DELETE THIS CLASS
@Component
public class UserValidator {

    public void validateUpdateRequest(UpdateUserRequest request){
        if (request == null) {
            throw new IllegalArgumentException("Update request cannot be null");
        }

        boolean allNull = request.name() == null &&
                request.email() == null &&
                request.gender() == null &&
                request.birthDay() == null;

        if (allNull) {
            throw new IllegalArgumentException("Nothing to update");
        }
    }
}
