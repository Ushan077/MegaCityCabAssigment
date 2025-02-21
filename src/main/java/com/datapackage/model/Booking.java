package com.datapackage.model;

import java.sql.Date;

public class Booking {
    private int bookingId;
    private Date bookingDate;
    private int customerId;
    private String vehicle;
    private String pickupLocation;
    private String dropoffLocation;
    
    public Booking() { }
    
    // Constructor without bookingId (if auto-generated)
    public Booking(Date bookingDate, int customerId, String vehicle, String pickupLocation, String dropoffLocation) {
        this.bookingDate = bookingDate;
        this.customerId = customerId;
        this.vehicle = vehicle;
        this.pickupLocation = pickupLocation;
        this.dropoffLocation = dropoffLocation;
    }
    
    // Full constructor (if you need to set the ID)
    public Booking(int bookingId, Date bookingDate, int customerId, String vehicle, String pickupLocation, String dropoffLocation) {
        this.bookingId = bookingId;
        this.bookingDate = bookingDate;
        this.customerId = customerId;
        this.vehicle = vehicle;
        this.pickupLocation = pickupLocation;
        this.dropoffLocation = dropoffLocation;
    }
    
    // Getters and Setters
    public int getBookingId() {
        return bookingId;
    }
    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }
    public Date getBookingDate() {
        return bookingDate;
    }
    public void setBookingDate(Date bookingDate) {
        this.bookingDate = bookingDate;
    }
    public int getCustomerId() {
        return customerId;
    }
    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }
    public String getVehicle() {
        return vehicle;
    }
    public void setVehicle(String vehicle) {
        this.vehicle = vehicle;
    }
    public String getPickupLocation() {
        return pickupLocation;
    }
    public void setPickupLocation(String pickupLocation) {
        this.pickupLocation = pickupLocation;
    }
    public String getDropoffLocation() {
        return dropoffLocation;
    }
    public void setDropoffLocation(String dropoffLocation) {
        this.dropoffLocation = dropoffLocation;
    }
}
