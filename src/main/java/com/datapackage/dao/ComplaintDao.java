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

    // Retrieve complaints by user ID
    public List<Complaint> getComplaintsByUserId(String userId) throws SQLException {
        List<Complaint> complaints = new ArrayList<>();
        String sql = "SELECT * FROM Complaints WHERE user_id = ?";
        try (Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Complaint complaint = new Complaint();
                    complaint.setComplaintId(rs.getInt("complaint_id"));
                    complaint.setUserId(rs.getString("user_id"));
                    complaint.setUserName(rs.getString("user_name"));
                    complaint.setSubject(rs.getString("subject"));
                    complaint.setDescription(rs.getString("description"));
                    complaint.setAdminReply(rs.getString("admin_reply"));
                    complaint.setStatus(rs.getString("status"));
                    complaint.setDateFiled(rs.getDate("date_filed")); // Using getDate for java.sql.Date
                    complaints.add(complaint);
                }
            }
        }
        return complaints;
    }
 // In ComplaintDao.java

    public List<Complaint> getComplaints() throws SQLException {
        List<Complaint> complaints = new ArrayList<>();
        String sql = "SELECT * FROM Complaints"; // Removed WHERE clause to display all records
        try (Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Complaint complaint = new Complaint();
                complaint.setComplaintId(rs.getInt("complaint_id"));
                complaint.setUserId(rs.getString("user_id"));
                complaint.setUserName(rs.getString("user_name"));
                complaint.setSubject(rs.getString("subject"));
                complaint.setDescription(rs.getString("description"));
                complaint.setAdminReply(rs.getString("admin_reply"));
                complaint.setStatus(rs.getString("status"));
                complaint.setDateFiled(rs.getDate("date_filed"));
                complaints.add(complaint);
            }
        }
        return complaints;
    }


}
