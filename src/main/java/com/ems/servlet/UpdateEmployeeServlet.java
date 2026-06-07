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

@WebServlet("/UpdateEmployeeServlet")
public class UpdateEmployeeServlet
extends HttpServlet {

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        Employee emp =
                new Employee();

        emp.setEmpId(
                Integer.parseInt(
                        request.getParameter(
                                "empId")));

        emp.setName(
                request.getParameter(
                        "name"));

        emp.setEmail(
                request.getParameter(
                        "email"));

        emp.setDepartment(
                request.getParameter(
                        "department"));

        emp.setSalary(
                Double.parseDouble(
                        request.getParameter(
                                "salary")));

        EmployeeDAO dao =
                new EmployeeDAO();

        boolean status =
                dao.updateEmployee(emp);

        if(status){

            EmailUtil.sendEmail(

                    emp.getEmail(),

                    "Employee Record Updated",

                    "Dear " + emp.getName() +

                    ",\n\nYour employee details have been updated successfully.\n\nRegards,\nAdmin"
            );
        }

        response.sendRedirect(
                "EmployeePaginationServlet");
    }
}