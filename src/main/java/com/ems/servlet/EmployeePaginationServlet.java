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

@WebServlet("/EmployeePaginationServlet")
public class EmployeePaginationServlet extends HttpServlet {

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int page = 1;

        int recordsPerPage = 5;

        if(request.getParameter("page") != null){

            page = Integer.parseInt(
                    request.getParameter("page"));
        }

        int start =
                (page - 1) * recordsPerPage;

        EmployeeDAO dao =
                new EmployeeDAO();
        
        int totalEmployees =
                dao.getTotalEmployees();

        int totalDepartments =
                dao.getTotalDepartments();

        double averageSalary =
                dao.getAverageSalary();

        List<Employee> employeeList =
                dao.getEmployeesByPage(
                        start,
                        recordsPerPage);

        int totalRecords =
                dao.getEmployeeCount();

        int totalPages =
                (int)Math.ceil(
                        (double)totalRecords /
                        recordsPerPage);

        request.setAttribute(
                "employeeList",
                employeeList);

        request.setAttribute(
                "currentPage",
                page);

        request.setAttribute(
                "totalPages",
                totalPages);

        request.setAttribute(
                "totalEmployees",
                totalEmployees);

        request.setAttribute(
                "totalDepartments",
                totalDepartments);

        request.setAttribute(
                "averageSalary",
                averageSalary);
        
        request.getRequestDispatcher(
                "/admin/dashboard.jsp")
                .forward(request,response);
    }
}