package com.datapackage.controller;

import com.datapackage.dao.BookingDao;
import com.datapackage.model.Booking;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Date;

@WebServlet("/CusBookingServlet")
public class CusBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    public CusBookingServlet() {
        super();
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        
        // Retrieve parameters from the booking form.
        String customerName = request.getParameter("customerName"); // For display purposes.
        String customerIDStr = request.getParameter("customerID");
        String pickupLocation = request.getParameter("pickupLocation");
        String dropoffLocation = request.getParameter("dropoffLocation");
        String bookingDateStr = request.getParameter("bookingDate");
        String selectedVehicle = request.getParameter("vehicle");
        
        // Convert customer ID.
        int customerID = 0;
        try {
            customerID = Integer.parseInt(customerIDStr);
        } catch (NumberFormatException e) {
            customerID = 0;
        }
        
        // Convert booking date.
        Date bookingDate = null;
        try {
            bookingDate = Date.valueOf(bookingDateStr);
        } catch (IllegalArgumentException e) {
            // Handle invalid date
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid booking date format.");
            return;
        }
        
        // Create a Booking object.
        Booking booking = new Booking(bookingDate, customerID, selectedVehicle, pickupLocation, dropoffLocation);
        
        // Use BookingDao to create the booking.
        BookingDao dao = new BookingDao();
        int rowsAffected = 0;
        try {
            rowsAffected = dao.createBooking(booking);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        // Respond to the client.
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<html><head><title>Booking Confirmation</title></head><body>");
        out.println("<div style='margin:20px;'>");
        if (rowsAffected > 0) {
            out.println("<h2>Booking Confirmation</h2>");
            out.println("<p><strong>Customer Name:</strong> " + customerName + "</p>");
            out.println("<p><strong>Customer ID:</strong> " + customerIDStr + "</p>");
            out.println("<p><strong>Pickup Location:</strong> " + pickupLocation + "</p>");
            out.println("<p><strong>Dropoff Location:</strong> " + dropoffLocation + "</p>");
            out.println("<p><strong>Booking Date:</strong> " + bookingDateStr + "</p>");
            out.println("<p><strong>Selected Vehicle:</strong> " + selectedVehicle + "</p>");
            out.println("<p>Your booking has been successfully created!</p>");
        } else {
            out.println("<h2>Booking Failed</h2>");
            out.println("<p>There was an error processing your booking. Please try again.</p>");
        }
        out.println("<a href='cusbooking.jsp'>Back to Booking Page</a>");
        out.println("</div>");
        out.println("</body></html>");
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        doPost(request, response);
    }
}
