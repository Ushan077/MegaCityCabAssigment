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
        String customerName = request.getParameter("customerName"); 
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
            out.println("<div class='confirmation-container'>");
            out.println("<h2 class='confirmation-title'>Booking Confirmation</h2>");
            out.println("<div class='booking-details'>");
            out.println("<p><strong>Customer Name:</strong> " + customerName + "</p>");
            out.println("<p><strong>Customer ID:</strong> " + customerIDStr + "</p>");
            out.println("<p><strong>Pickup Location:</strong> " + pickupLocation + "</p>");
            out.println("<p><strong>Dropoff Location:</strong> " + dropoffLocation + "</p>");
            out.println("<p><strong>Booking Date:</strong> " + bookingDateStr + "</p>");
            out.println("<p><strong>Selected Vehicle:</strong> " + selectedVehicle + "</p>");
            out.println("<p class='success-message'>Your booking has been successfully created!</p>");
            out.println("</div>");
            out.println("</div>");
        } else {
            out.println("<div class='error-container'>");
            out.println("<h2 class='error-title'>Booking Failed</h2>");
            out.println("<p class='error-message'>There was an error processing your booking. Please try again.</p>");
            out.println("</div>");
        }
        out.println("<div class='button-container'>");
        out.println("<a href='cusbooking.jsp' class='back-button'>Back to Booking Page</a>");
        out.println("</div>");
        out.println("</div>");
        out.println("<style>");
        out.println("body { font-family: 'Arial', sans-serif; background-color: #f5f5f5; margin: 0; padding: 20px; }");
        out.println(".confirmation-container, .error-container { max-width: 600px; margin: 0 auto; background-color: white; border-radius: 8px; padding: 25px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }");
        out.println(".confirmation-title { color: #2e7d32; border-bottom: 2px solid #2e7d32; padding-bottom: 10px; margin-top: 0; }");
        out.println(".error-title { color: #c62828; border-bottom: 2px solid #c62828; padding-bottom: 10px; margin-top: 0; }");
        out.println(".booking-details p { margin: 10px 0; line-height: 1.5; }");
        out.println(".success-message { color: #2e7d32; font-weight: bold; margin-top: 20px; }");
        out.println(".error-message { color: #c62828; font-weight: bold; margin-top: 20px; }");
        out.println(".button-container { text-align: center; margin-top: 25px; }");
        out.println(".back-button { display: inline-block; background-color: #1976d2; color: white; padding: 12px 24px; text-decoration: none; border-radius: 4px; font-weight: bold; transition: background-color 0.3s; }");
        out.println(".back-button:hover { background-color: #1565c0; }");
        out.println("</style>");
        out.println("</body></html>");
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        doPost(request, response);
    }
}
