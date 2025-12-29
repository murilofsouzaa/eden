package com.eden.repository;

import com.eden.model.user.User;
import com.eden.model.user.UserStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User findUserByEmail(String email);
    User findUserByStatus(UserStatus status);
}
