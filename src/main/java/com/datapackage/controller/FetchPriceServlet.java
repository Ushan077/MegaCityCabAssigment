package com.datapackage.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/FetchPriceServlet")
public class FetchPriceServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // Database credentials
    private static final String DB_URL = "jdbc:mysql://localhost:3306/megacitycab";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Mobitel#123";
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/plain;charset=UTF-8");
        
        try (PrintWriter out = response.getWriter()) {
            System.out.println("FetchPriceServlet started");
            
            // Retrieve vehicle id from request parameter "id"
            String idParam = request.getParameter("id");
            System.out.println("DEBUG: Received id parameter: " + idParam);
            
            if (idParam == null || idParam.trim().isEmpty()) {
                System.out.println("DEBUG: id parameter is null or empty");
                out.print("0");
                return;
            }
            
            int vehicleId;
            try {
                vehicleId = Integer.parseInt(idParam);
                System.out.println("DEBUG: Parsed vehicleId: " + vehicleId);
            } catch (NumberFormatException e) {
                System.out.println("DEBUG: Invalid vehicle ID format: " + idParam);
                out.print("0 - Invalid ID format");
                return;
            }
            
            // Load JDBC driver (optional for JDBC 4+)
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                System.out.println("DEBUG: JDBC driver loaded successfully");
            } catch (ClassNotFoundException e) {
                System.out.println("DEBUG: JDBC driver not found: " + e.getMessage());
                out.print("0 - Driver not found");
                return;
            }
            
            // Test database connection first
            try (Connection testCon = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                System.out.println("DEBUG: Database connection test successful");
            } catch (SQLException e) {
                System.out.println("DEBUG: Database connection test failed: " + e.getMessage());
                out.print("0 - DB connection failed");
                return;
            }
            
            try (Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                // Check if the vehicle exists
                String checkSql = "SELECT COUNT(*) as count FROM vehicles WHERE id = ?";
                try (PreparedStatement checkPs = con.prepareStatement(checkSql)) {
                    checkPs.setInt(1, vehicleId);
                    try (ResultSet checkRs = checkPs.executeQuery()) {
                        if (checkRs.next()) {
                            int count = checkRs.getInt("count");
                            System.out.println("DEBUG: Vehicle count for id " + vehicleId + ": " + count);
                            if (count == 0) {
                                System.out.println("DEBUG: No vehicle found with id: " + vehicleId);
                                out.print("0 - Vehicle not found");
                                return;
                            }
                        }
                    }
                }
                
                // Now get the price for the vehicle id
                String sql = "SELECT price FROM vehicles WHERE id = ?";
                System.out.println("DEBUG: Executing SQL: " + sql + " with parameter: " + vehicleId);
                
                try (PreparedStatement ps = con.prepareStatement(sql)) {
                    ps.setInt(1, vehicleId);
                    try (ResultSet rs = ps.executeQuery()) {
                        if (rs.next()) {
                            double price = rs.getDouble("price");
                            System.out.println("DEBUG: Retrieved price from DB: " + price);
                            // Apply a 3% discount if the price is greater than 500
                            if (price > 500) {
                                price = price * 0.97;
                                System.out.println("DEBUG: Price after 3% discount: " + price);
                            }
                            String formattedPrice = String.format("%.2f", price);
                            System.out.println("DEBUG: Sending formatted price: " + formattedPrice);
                            out.print(formattedPrice);
                        } else {
                            System.out.println("DEBUG: No record found for vehicle id: " + vehicleId);
                            out.print("0 - No price data");
                        }
                    }
                } catch (SQLException e) {
                    System.out.println("DEBUG: SQL error while fetching price: " + e.getMessage());
                    out.print("0 - SQL error");
                }
            }
        } catch (Exception e) {
            System.out.println("DEBUG: Unexpected error: " + e.getMessage());
            e.printStackTrace();
            response.getWriter().print("0 - General error");
        }
    }
}
