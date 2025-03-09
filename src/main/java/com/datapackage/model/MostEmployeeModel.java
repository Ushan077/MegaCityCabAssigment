package com.datapackage.model;

public class MostEmployeeModel {
    private String employeeId;
    private String employeeName;
    private int count;
    private double totalAmount;
    
    public MostEmployeeModel() {
    }
    
    public MostEmployeeModel(String employeeId, String employeeName, int count, double totalAmount) {
        this.employeeId = employeeId;
        this.employeeName = employeeName;
        this.count = count;
        this.totalAmount = totalAmount;
    }
    
    public String getEmployeeId() {
        return employeeId;
    }
    
    public void setEmployeeId(String employeeId) {
        this.employeeId = employeeId;
    }
    
    public String getEmployeeName() {
        return employeeName;
    }
    
    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }
    
    public int getCount() {
        return count;
    }
    
    public void setCount(int count) {
        this.count = count;
    }
    
    public double getTotalAmount() {
        return totalAmount;
    }
    
    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }
}
