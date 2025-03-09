package com.datapackage.controller;

import com.datapackage.dao.DashboardDAO;
import com.datapackage.model.MostVehicleModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/MostVehicleServlet")
public class MostVehicleServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DashboardDAO dashboardDAO = new DashboardDAO();
        
        // Default limit to 5 if not specified
        int limit = 5;
        String limitParam = request.getParameter("limit");
        if (limitParam != null && !limitParam.isEmpty()) {
            try {
                limit = Integer.parseInt(limitParam);
            } catch (NumberFormatException e) {
                // Use default if parameter is not a valid number
            }
        }
        
        List<MostVehicleModel> vehicles = dashboardDAO.getMostBookedVehicles(limit);
        request.setAttribute("mostBookedVehicles", vehicles);
        
        // Forward to the dashboard page (adminhome.jsp)
        request.getRequestDispatcher("/adminhome.jsp").forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
