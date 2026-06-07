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

@WebServlet("/EmployeeSortServlet")
public class EmployeeSortServlet extends HttpServlet {

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String sortBy =
                request.getParameter("sort");

        if(sortBy == null){

            sortBy = "emp_id";
        }

        if(!sortBy.equals("name") &&
           !sortBy.equals("department") &&
           !sortBy.equals("salary")){

            sortBy = "emp_id";
        }

        EmployeeDAO dao =
                new EmployeeDAO();

        List<Employee> employeeList =
                dao.getEmployeesSorted(sortBy);

        request.setAttribute(
                "employeeList",
                employeeList);

        request.getRequestDispatcher(
                "/admin/dashboard.jsp")
                .forward(request,response);
    }
}