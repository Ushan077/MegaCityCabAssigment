package com.datapackage.model;

public class User {
    private int id;
    private String name;
    private String usertype;
    
    public User() {}

    public User(int id, String name, String usertype) {
        this.id = id;
        this.name = name;
        this.usertype = usertype;
    }
    
    // Getters and setters
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
    
    public String getUsertype() {
        return usertype;
    }
    public void setUsertype(String usertype) {
        this.usertype = usertype;
    }
}
