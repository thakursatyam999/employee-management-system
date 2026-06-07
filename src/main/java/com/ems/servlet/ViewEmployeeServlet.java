package com.ems.servlet;

import java.io.IOException;
import java.util.List;

import com.ems.dao.EmployeeDAO;
import com.ems.model.Employee;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ViewEmployeeServlet")
public class ViewEmployeeServlet extends HttpServlet {

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        EmployeeDAO dao = new EmployeeDAO();

        List<Employee> employeeList =
                dao.getAllEmployees();

        request.setAttribute(
                "employeeList",
                employeeList);

        request.getRequestDispatcher(
                "admin/dashboard.jsp")
                .forward(request, response);
    }
}