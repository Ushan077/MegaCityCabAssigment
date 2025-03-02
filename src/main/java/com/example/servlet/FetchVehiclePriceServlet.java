package com.example.servlet;

import com.example.dao.VehiclepriceDAO;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.datapackage.model.Vehicleprice;


import org.apache.tomcat.jakartaee.bcel.classfile.ClassFormatException;

import java.io.IOException;
import java.io.PrintWriter;

@jakarta.servlet.annotation.WebServlet("/FetchVehiclePriceServlet")
public class FetchVehiclePriceServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private VehiclepriceDAO vehicleDAO;
    
    @Override
    public void init() {
        vehicleDAO = new VehiclepriceDAO();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ClassFormatException, IOException {
        String idStr = request.getParameter("id");
        double price = 0;
        if (idStr != null) {
            int id = Integer.parseInt(idStr);
            Vehicleprice vehicle = vehicleDAO.getVehicleById(id);
            if(vehicle != null) {
                price = vehicle.getPrice();
            }
        }
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.write(String.valueOf(price));
        out.flush();
    }
}
