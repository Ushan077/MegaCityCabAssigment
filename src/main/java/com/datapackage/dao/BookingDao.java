package com.datapackage.dao;

import com.datapackage.model.Booking;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookingDao {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/megacitycab";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Mobitel#123";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch(ClassNotFoundException e) {
            throw new RuntimeException("MySQL JDBC Driver not found!", e);
        }
    }
    
    // Inserts a new booking record into the database.
    public int createBooking(Booking booking) throws SQLException {
        String sql = "INSERT INTO carbooking (booking_date, customer_id, vehicle, pickup_location, dropoff_location) VALUES (?, ?, ?, ?, ?)";
        try (Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setDate(1, booking.getBookingDate());
            ps.setInt(2, booking.getCustomerId());
            ps.setString(3, booking.getVehicle());
            ps.setString(4, booking.getPickupLocation());
            ps.setString(5, booking.getDropoffLocation());
            int rowsAffected = ps.executeUpdate();
            
            // Optionally, retrieve the auto-generated booking ID.
            try (ResultSet rs = ps.getGeneratedKeys()) {
                if (rs.next()) {
                    booking.setBookingId(rs.getInt(1));
                }
            }
            return rowsAffected;
        }
    }
    public List<Booking> getBookings() throws SQLException {
        List<Booking> bookings = new ArrayList<>();
        String sql = "SELECT booking_id, booking_date, customer_id, vehicle, pickup_location, dropoff_location FROM carbooking";
        try (Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Booking booking = new Booking();
                booking.setBookingId(rs.getInt("booking_id"));
                booking.setBookingDate(rs.getDate("booking_date"));
                booking.setCustomerId(rs.getInt("customer_id"));
                booking.setVehicle(rs.getString("vehicle"));
                booking.setPickupLocation(rs.getString("pickup_location"));
                booking.setDropoffLocation(rs.getString("dropoff_location"));
                bookings.add(booking);
            }
        }
        return bookings;
    }

}
