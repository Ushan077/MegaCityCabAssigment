package com.datapackage.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {

    // Database connection details
    private String url = "jdbc:mysql://localhost:3306/StudentDB";
    private String user = "root";
    private String password = "Mobitel#123";
    
    // SQL query to validate user credentials
    private static final String VALIDATE_USER_QUERY = "SELECT * FROM Student WHERE F_name = ? AND password = ?";

    public boolean validateUser(String username, String password) throws ClassNotFoundException, SQLException {
        Connection connection = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // Load MySQL JDBC driver (optional for JDBC 4.0+ but added here for clarity)
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a database connection
            connection = DriverManager.getConnection(url, user, this.password);
            
            // Prepare the SQL statement
            pstmt = connection.prepareStatement(VALIDATE_USER_QUERY);
            pstmt.setString(1, username);
            pstmt.setString(2, password); // Using plain text password

            // Execute the query
            rs = pstmt.executeQuery();

            // If a record is found, then the user exists
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new SQLException("Database error: " + e.getMessage());
        } finally {
            // Clean up resources
            if (rs != null) {
                try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
            if (pstmt != null) {
                try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
            if (connection != null) {
                try { connection.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        }
    }
}
