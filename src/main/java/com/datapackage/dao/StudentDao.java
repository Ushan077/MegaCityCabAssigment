	package com.datapackage.dao;
	
	import com.datapackage.model.Student;
	import java.sql.Connection;
	import java.sql.DriverManager;
	import java.sql.PreparedStatement;
	import java.sql.SQLException;
	
	public class StudentDao {

	    public int registerStudent(Student student) throws ClassNotFoundException, SQLException {
	        int result = 0;

	        String url = "jdbc:mysql://localhost:3306/StudentDB";
	        String user = "root";
	        String password = "Mobitel#123"; 
	        

	        String INSERT_QUERY = "INSERT INTO student (F_name, L_name, address, contact, password) VALUES (?, ?, ?, ?, ?)";

	        Class.forName("com.mysql.cj.jdbc.Driver");

	        try (Connection connection = DriverManager.getConnection(url, user, password);
	             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_QUERY)) {

	            preparedStatement.setString(1, student.getFName());
	            preparedStatement.setString(2, student.getLName());
	            preparedStatement.setString(3, student.getAddress());
	            preparedStatement.setString(4, student.getContact());
	            preparedStatement.setString(5, student.getPassword()); // Set password in the prepared statement

	            result = preparedStatement.executeUpdate();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	        return result;
	    }
	}
