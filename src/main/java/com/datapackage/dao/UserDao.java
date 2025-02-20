package com.datapackage.dao;

import com.datapackage.model.User;
import java.sql.*;

public class UserDao {
    private static final String LOGIN_QUERY = 
        "SELECT id, name, usertype FROM users WHERE LOWER(name) = LOWER(?) AND password = ? AND LOWER(usertype) = LOWER(?)";
    
    private static final String DB_URL = "jdbc:mysql://localhost:3306/megacitycab";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Mobitel#123";

    public User validateUser(String username, String password, String usertype) {
        User user = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                 PreparedStatement ps = con.prepareStatement(LOGIN_QUERY)) {
                 
                ps.setString(1, username);
                ps.setString(2, password);
                ps.setString(3, usertype);
                
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    String role = rs.getString("usertype");
                    user = new User(id, name, role);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
}
