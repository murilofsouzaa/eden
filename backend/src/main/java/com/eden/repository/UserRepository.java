package com.eden.repository;

import com.eden.models.UserModel;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface UserRepository extends JpaRepository<UserModel, Integer> {
    Optional<UserModel> findById(Integer id);
    Optional<UserModel> findByEmail(String email);
    Optional<UserModel> findByName(String name);
}
