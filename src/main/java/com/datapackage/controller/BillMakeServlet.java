package com.datapackage.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/BillMakeServlet")
public class BillMakeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // Database credentials
    private static final String DB_URL = "jdbc:mysql://localhost:3306/megacitycab";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Mobitel#123";
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        // Retrieve form parameters
        String employeeName = request.getParameter("employeeName");
        String employeeID   = request.getParameter("employeeID");
        String bookingID    = request.getParameter("bookingID");
        String customerID   = request.getParameter("customerID");
        String vehicle      = request.getParameter("vehicle");
        String kilometers   = request.getParameter("kilometers");
        String perKmRate    = request.getParameter("perKmRate");
        String amount       = request.getParameter("amount");

        // SQL for inserting the bill
        String insertSql = "INSERT INTO bill (employee_name, employee_id, booking_id, customer_id, vehicle, kilometers, per_km_rate, amount, bill_date) "
                         + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, NOW())";
        // SQL for deleting the booking record after successful bill generation
        String deleteSql = "DELETE FROM carbooking WHERE id = ?";
        
        Connection con = null;
        PreparedStatement insertPs = null;
        PreparedStatement deletePs = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            // Start transaction
            con.setAutoCommit(false);
            
            insertPs = con.prepareStatement(insertSql);
            insertPs.setString(1, employeeName);
            insertPs.setString(2, employeeID);
            insertPs.setInt(3, Integer.parseInt(bookingID));
            insertPs.setInt(4, Integer.parseInt(customerID));
            insertPs.setString(5, vehicle);
            insertPs.setDouble(6, Double.parseDouble(kilometers));
            insertPs.setDouble(7, Double.parseDouble(perKmRate));
            insertPs.setDouble(8, Double.parseDouble(amount));
            
            int insertRow = insertPs.executeUpdate();
            
            // If insertion is successful, delete the booking from carbooking table
            if (insertRow > 0) {
                deletePs = con.prepareStatement(deleteSql);
                deletePs.setInt(1, Integer.parseInt(bookingID));
                int deleteRow = deletePs.executeUpdate();
                System.out.println("DEBUG: Deleted " + deleteRow + " record(s) from carbooking.");
            }
            
            // Commit the transaction
            con.commit();
            
            response.setContentType("text/html;charset=UTF-8");
            try (PrintWriter out = response.getWriter()) {
                out.println("<!DOCTYPE html>");
                out.println("<html lang='en'>");
                out.println("<head>");
                out.println("  <meta charset='UTF-8'>");
                out.println("  <meta name='viewport' content='width=device-width, initial-scale=1'>");
                out.println("  <title>Bill Status</title>");
                out.println("  <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css'>");
                out.println("</head>");
                out.println("<body class='container mt-5'>");
                if (insertRow > 0) {
                    out.println("<h3 class='text-success'>Bill Generated Successfully</h3>");
                } else {
                    out.println("<h3 class='text-danger'>Failed to generate bill</h3>");
                }
                out.println("<a href='BillMake.jsp' class='btn btn-primary mt-3'>Back to Billing Page</a>");
                out.println("</body>");
                out.println("</html>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            if (con != null) {
                try {
                    con.rollback();
                } catch (SQLException se) {
                    se.printStackTrace();
                }
            }
            response.getWriter().println("<h3>Error generating bill.</h3>");
        } finally {
            try {
                if (insertPs != null) insertPs.close();
                if (deletePs != null) deletePs.close();
                if (con != null) con.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
