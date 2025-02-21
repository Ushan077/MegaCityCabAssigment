package com.datapackage.dao;

import com.datapackage.model.Complaint;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ComplaintDao {
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

    // Retrieve all complaints ordered by date_filed descending
    public List<Complaint> getComplaints() throws SQLException {
        List<Complaint> complaints = new ArrayList<>();
        String sql = "SELECT complaint_id, user_id, user_name, subject, description, status, date_filed, admin_reply FROM Complaints ORDER BY date_filed DESC";
        try (Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while(rs.next()){
                Complaint comp = new Complaint();
                comp.setComplaintId(rs.getInt("complaint_id"));
                comp.setUserId(rs.getString("user_id"));
                comp.setUserName(rs.getString("user_name"));
                comp.setSubject(rs.getString("subject"));
                comp.setDescription(rs.getString("description"));
                comp.setStatus(rs.getString("status"));
                comp.setDateFiled(rs.getDate("date_filed"));
                comp.setAdminReply(rs.getString("admin_reply"));
                
                // Debug: print values to the console
                System.out.println("Complaint: " + comp.getComplaintId() + ", Subject: " + comp.getSubject() + ", Description: " + comp.getDescription());
                
                complaints.add(comp);
            }
        }
        return complaints;
    }


    // Update a complaint with admin reply and change its status to "Replied"
    public int updateComplaintReply(int complaintId, String adminReply) throws SQLException {
        String sql = "UPDATE Complaints SET admin_reply = ?, status = 'Replied' WHERE complaint_id = ?";
        try (Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, adminReply);
            ps.setInt(2, complaintId);
            return ps.executeUpdate();
        }
    }
}
