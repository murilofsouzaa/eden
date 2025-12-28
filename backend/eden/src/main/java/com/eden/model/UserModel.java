package com.eden.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="user")
public class UserModel {
    @Id
    @Column
    private int id;
    @Column(nullable = false)
    private String name;
    @Column(nullable = false)
    private int age;
    @Column
    private String gender;
    @Column(nullable = false)
    private String email;
    @Column(nullable = false)
    private String password;

    public UserModel(){
    }

    public UserModel(String email, int id, String name, int age, String gender, String password) {
        this.email = email;
        this.id = id;
        this.name = name;
        this.age = age;
        this.gender = gender;
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
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
}
