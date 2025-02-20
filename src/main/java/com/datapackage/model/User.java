package com.datapackage.model;

public class User {
    private int id;
    private String nic;
    private String name;
    private String address;
    private String contact;
    private String password;
    private String usertype;

    // Full constructor for registration
    public User(int id, String nic, String name, String address, String contact, String password, String usertype) {
        this.id = id;
        this.nic = nic;
        this.name = name;
        this.address = address;
        this.contact = contact;
        this.password = password;
        this.usertype = usertype;
    }
    
    // Default constructor
    public User() {}

    // Overloaded constructor for login (minimal fields)
    public User(int id, String name, String usertype) {
        this.id = id;
        this.name = name;
        this.usertype = usertype;
    }
    
    // Getters and setters for all fields
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    
    public String getNic() {
        return nic;
    }
    public void setNic(String nic) {
        this.nic = nic;
    }
    
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    
    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }
    
    public String getContact() {
        return contact;
    }
    public void setContact(String contact) {
        this.contact = contact;
    }
    
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    
    public String getUsertype() {
        return usertype;
    }
    public void setUsertype(String usertype) {
        this.usertype = usertype;
    }
}
