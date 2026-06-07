package com.ems.servlet;

import java.io.IOException;

import com.ems.dao.EmployeeDAO;
import com.ems.model.Employee;

import com.ems.util.EmailUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddEmployeeServlet")
public class AddEmployeeServlet extends HttpServlet {

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String name =
                request.getParameter("name");

        String email =
                request.getParameter("email");

        String department =
                request.getParameter("department");

        double salary =
                Double.parseDouble(
                        request.getParameter("salary"));

        Employee emp = new Employee();

        emp.setName(name);
        emp.setEmail(email);
        emp.setDepartment(department);
        emp.setSalary(salary);

        EmployeeDAO dao =
                new EmployeeDAO();

        boolean status =
                dao.addEmployee(emp);

        if(status) {

            EmailUtil.sendEmail(

                    email,

                    "Welcome to Employee Management System",

                    "Dear " + name +

                    ",\n\nYour employee record has been created successfully.\n\nRegards,\nAdmin"
            );

            response.sendRedirect(
                    "EmployeePaginationServlet");
        }
        else {

            response.getWriter().println(
                    "Failed To Add Employee");
        }
    }
}