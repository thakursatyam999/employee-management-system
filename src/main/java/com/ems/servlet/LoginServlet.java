package com.ems.servlet;

import java.io.IOException;

import com.ems.dao.UserDAO;
import com.ems.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String username =
                request.getParameter("username");

        String password =
                request.getParameter("password");
        
        System.out.println("Username: " + username);
        System.out.println("Password: " + password);

        UserDAO dao = new UserDAO();

        User user =
                dao.validateUser(username,password);

        if(user != null) {

            HttpSession session =
                    request.getSession();

            session.setAttribute("user", user);

            if(user.getRole().equalsIgnoreCase("ADMIN")) {

            	response.sendRedirect(
            		    "EmployeePaginationServlet");

            } else {

                response.sendRedirect(
                        "employee/profile.jsp");
            }

        } else {

            response.getWriter().println(
                    "Invalid Username or Password");
        }
    }
	
	
//	

//	protected void doPost(
//	        HttpServletRequest request,
//	        HttpServletResponse response)
//	        throws ServletException, IOException {
//
//	    UserDAO dao = new UserDAO();
//
//	    User user = dao.validateUser("admin", "admin123");
//
//	    if(user != null) {
//	        response.getWriter().println("User Found");
//	        response.getWriter().println("<br>");
//	        response.getWriter().println(user.getUsername());
//	        response.getWriter().println("<br>");
//	        response.getWriter().println(user.getRole());
//	    } else {
//	        response.getWriter().println("User Not Found");
//	    }
//	}
}