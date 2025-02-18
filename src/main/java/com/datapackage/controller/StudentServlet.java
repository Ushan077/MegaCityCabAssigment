package com.datapackage.controller;

import com.datapackage.dao.StudentDao;
import com.datapackage.model.Student;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/StudentServlet")
public class StudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Declare StudentDao as a class-level variable
    private StudentDao studentDao;

    public StudentServlet() {
        super();
        // Initialize StudentDao
        studentDao = new StudentDao();
    }

    // Handles GET requests (e.g., loading the registration form)
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward to the student registration form (no message logic here)
        request.getRequestDispatcher("/view/Form.jsp").forward(request, response);
    }

    // Handles POST requests (e.g., registering a new student)
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String fName = request.getParameter("F_name");
        String lName = request.getParameter("L_name");
        String address = request.getParameter("address");
        String contact = request.getParameter("contact");
        String password = request.getParameter("password");

        // Create Student object
        Student student = new Student(fName, lName, address, contact,password);

        try {
            int result = studentDao.registerStudent(student);
            if (result > 0) {
                // Send success message and forward back to the form page
                request.setAttribute("successMessage", "Student registered successfully!");
                request.getRequestDispatcher("/Views/Form.jsp").forward(request, response);

            } else {
                // Send error message and forward back
                request.setAttribute("errorMessage", "Registration failed. Please try again.");
                request.getRequestDispatcher("/Views/Form.jsp").forward(request, response);

            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred. Please try again.");
            request.getRequestDispatcher("/Views/Form.jsp").forward(request, response);
        }
    }
}