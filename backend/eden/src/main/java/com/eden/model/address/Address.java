package com.eden.model.address;

import com.eden.model.user.User;
import jakarta.persistence.*;

@Entity
@Table(name="address")
public class Address {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(updatable = false)
    private Long id;
    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;
    @Column(nullable = false)
    private String street;
    @Column(nullable = false)
    private int number;
    @Column(nullable = false)
    private String neighborhood;
    @Column(nullable = false)
    private String city;
    @Column(nullable = false)
    private String state;
    @Column(nullable = false)
    private String country;
    @Column(nullable = false)
    private String zipCode;

    public Address(){
    }

    public Address(Long id, User user, String street, int number,
                   String neighborhood, String city, String state, String country, String zipCode) {
        this.id = id;
        this.user = user;
        this.street = street;
        this.number = number;
        this.neighborhood = neighborhood;
        this.city = city;
        this.state = state;
        this.country = country;
        this.zipCode = zipCode;
    }

    public void validateAddress(){
        if(user == null) {
            throw new IllegalArgumentException("User cannot be null");
        }
        if(street.isBlank() || street == null ){
            throw new IllegalArgumentException("Street cannot be null or blank");
        }
        if(neighborhood.isBlank() || neighborhood == null ){
            throw new IllegalArgumentException("Neighborhood cannot be null or blank");
        }
        if(city.isBlank() || city == null ){
            throw new IllegalArgumentException("City cannot be null or blank");
        }
        if(state.isBlank() || state == null){
            throw new IllegalArgumentException("State cannot be null or blank");
        }
        if(country.isBlank() || country == null){
            throw new IllegalArgumentException("Country cannot be null or blank");
        }
        if(zipCode.isBlank() || zipCode == null){
            throw new IllegalArgumentException("Zip code cannot be null or blank");
        }
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public String getNeighborhood() {
        return neighborhood;
    }

    public void setNeighborhood(String neighborhood) {
        this.neighborhood = neighborhood;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }
}
