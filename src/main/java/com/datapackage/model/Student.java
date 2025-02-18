package com.datapackage.model;

import java.sql.Timestamp;

public class Student {
    private String fName;
    private String lName;
    private String address;
    private String contact;
    private String password;

    // Constructor with 5 parameters
    public Student(String fName, String lName, String address, String contact, String password) {
        this.fName = fName;
        this.lName = lName;
        this.address = address;
        this.contact = contact;
        this.password = password;
    }

    // Getter and Setter methods for all fields
    public String getFName() {
        return fName;
    }

    public void setFName(String fName) {
        this.fName = fName;
    }

    public String getLName() {
        return lName;
    }

    public void setLName(String lName) {
        this.lName = lName;
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
}