package com.eden.model.user;

import jakarta.persistence.*;

import java.time.LocalDate;

@Entity
@Table(name="user")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(updatable = false)
    private Long id;
    @Column(nullable = false)
    private String name;
    @Column(nullable = false)
    private LocalDate birthDay;
    @Enumerated(EnumType.STRING)
    private Gender gender;
    @Column(nullable = false)
    private String email;
    @Column(nullable = false)
    private String password;
    @Enumerated(EnumType.STRING)
    private UserRole role;
    @Enumerated(EnumType.STRING)
    private UserStatus status;

    public User(){
    }

    public User(Long id, String email, String name, LocalDate birthDay, Gender gender, String password, UserRole role,
                UserStatus status) {
        this.id = id;
        this.email = email;
        this.name = name;
        this.birthDay = birthDay;
        this.gender = gender;
        this.password = password;
        this.role = role;
        this.status = status;
    }

    public void validateUser(){
        if(email.isBlank() || email == null){
            throw new IllegalArgumentException("Email cannot be empty or null");
        }
        if(name.isBlank() || name == null){
            throw new IllegalArgumentException("Name cannot be empty or null");
        }
        if(gender == null){
            throw new IllegalArgumentException("Gender cannot be null");
        }
        if(password.isBlank() || password == null){
            throw new IllegalArgumentException("Password cannot be empty or null");
        }

    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public LocalDate getBirthDay() {
        return birthDay;
    }

    public void setBirthDay(LocalDate birthDay) {
        this.birthDay = birthDay;
    }

    public Gender getGender() {
        return gender;
    }

    public void setGender(Gender gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public UserRole getRole() {
        return role;
    }

    public void setRole(UserRole role) {
        this.role = role;
    }

    public UserStatus getStatus() {
        return status;
    }

    public void setStatus(UserStatus status) {
        this.status = status;
    }
}
