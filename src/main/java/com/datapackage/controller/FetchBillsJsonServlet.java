package com.datapackage.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.google.gson.Gson;
import com.datapackage.model.Bill; // Updated import

@WebServlet("/FetchBillsJsonServlet")
public class FetchBillsJsonServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // Database connection details
    private static final String DB_URL = "jdbc:mysql://localhost:3306/megacitycab";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Mobitel#123";
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        List<Bill> bills = new ArrayList<Bill>(); // Explicitly specify type if needed
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            // Load the JDBC driver and establish connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            
            // Query all bills
            String sql = "SELECT id, employee_name, employee_id, booking_id, customer_id, vehicle, kilometers, per_km_rate, amount, bill_date FROM bill";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            
            // Build list of bills
            while (rs.next()) {
                Bill bill = new Bill();
                bill.setId(rs.getInt("id"));
                bill.setEmployeeName(rs.getString("employee_name"));
                bill.setEmployeeId(rs.getInt("employee_id"));
                bill.setBookingId(rs.getInt("booking_id"));
                bill.setCustomerId(rs.getInt("customer_id"));
                bill.setVehicle(rs.getString("vehicle"));
                bill.setKilometers(rs.getDouble("kilometers"));
                bill.setPerKmRate(rs.getDouble("per_km_rate"));
                bill.setAmount(rs.getDouble("amount"));
                // Convert SQL Date to String (adjust format as needed)
                bill.setBillDate(rs.getDate("bill_date"));

                bills.add(bill);
            }
            
            // Convert list to JSON and output it
            Gson gson = new Gson();
            String json = gson.toJson(bills);
            out.print(json);
            
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print("{\"error\": \"Unable to fetch bills.\"}");
        } finally {
            try { if(rs != null) rs.close(); } catch(Exception ex) { ex.printStackTrace(); }
            try { if(ps != null) ps.close(); } catch(Exception ex) { ex.printStackTrace(); }
            try { if(con != null) con.close(); } catch(Exception ex) { ex.printStackTrace(); }
        }
    }
}
