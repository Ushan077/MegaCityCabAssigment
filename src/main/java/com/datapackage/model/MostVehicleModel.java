package com.datapackage.model;

public class MostVehicleModel {
    private String vehicleId;
    private String vehicleName;
    private int bookingCount;
    
    public MostVehicleModel() {
    }
    
    public MostVehicleModel(String vehicleId, String vehicleName, int bookingCount) {
        this.vehicleId = vehicleId;
        this.vehicleName = vehicleName;
        this.bookingCount = bookingCount;
    }
    
    public String getVehicleId() {
        return vehicleId;
    }
    
    public void setVehicleId(String vehicleId) {
        this.vehicleId = vehicleId;
    }
    
    public String getVehicleName() {
        return vehicleName;
    }
    
    public void setVehicleName(String vehicleName) {
        this.vehicleName = vehicleName;
    }
    
    public int getBookingCount() {
        return bookingCount;
    }
    
    public void setBookingCount(int bookingCount) {
        this.bookingCount = bookingCount;
    }
}
