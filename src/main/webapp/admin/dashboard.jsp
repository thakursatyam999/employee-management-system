<%@ page import="java.util.List" %>
<%@ page import="com.ems.model.Employee" %>

<%
if(session.getAttribute("user") == null){

    response.sendRedirect(
        request.getContextPath() + "/login.jsp");

    return;
}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Employee Management System</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">

<link rel="stylesheet"
      href="<%= request.getContextPath() %>/css/style.css">

<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

</head>

<body>

<div class="container mt-5">

    <div class="page-card">

        <div class="d-flex justify-content-between align-items-center">

            <div>

                <h1 class="dashboard-title">
                    Employee Management System
                </h1>

                <p class="text-muted">
                    Admin Dashboard
                </p>

            </div>

            <div>

                <a href="<%= request.getContextPath() %>/admin/addEmployee.jsp"
                   class="btn btn-success">

                    <i class="bi bi-plus-circle"></i>
                    Add Employee

                </a>

                <a href="<%= request.getContextPath() %>/LogoutServlet"
                   class="btn btn-danger">

                    <i class="bi bi-box-arrow-right"></i>
                    Logout

                </a>

            </div>

        </div>

    </div>
    
    <%
Integer totalEmployees =
(Integer)request.getAttribute("totalEmployees");

Integer totalDepartments =
(Integer)request.getAttribute("totalDepartments");

Double averageSalary =
(Double)request.getAttribute("averageSalary");
%>

<div class="row mt-4">

    <div class="col-md-4">

        <div class="stat-card">

            <h5>Total Employees</h5>

            <h2>

                <%= totalEmployees != null ?
                totalEmployees : 0 %>

            </h2>

        </div>

    </div>

    <div class="col-md-4">

        <div class="stat-card">

            <h5>Departments</h5>

            <h2>

                <%= totalDepartments != null ?
                totalDepartments : 0 %>

            </h2>

        </div>

    </div>

    <div class="col-md-4">

        <div class="stat-card">

            <h5>Average Salary</h5>

            <h2>

                Rs.
                <%= averageSalary != null ?
                String.format("%.0f", averageSalary)
                : 0 %>

            </h2>

        </div>

    </div>

</div>

    <br>

    <div class="page-card">

        <h5>Sort Employees</h5>

        <a href="<%= request.getContextPath() %>/EmployeeSortServlet?sort=name"
           class="btn btn-outline-primary">

            Name

        </a>

        <a href="<%= request.getContextPath() %>/EmployeeSortServlet?sort=department"
           class="btn btn-outline-primary">

            Department

        </a>

        <a href="<%= request.getContextPath() %>/EmployeeSortServlet?sort=salary"
           class="btn btn-outline-primary">

            Salary

        </a>

        <a href="<%= request.getContextPath() %>/EmployeePaginationServlet?page=1"
           class="btn btn-secondary">

            Default View

        </a>

    </div>

    <br>

    <div class="table-container">

        <table class="table table-striped table-hover">

            <thead class="table-dark">

                <tr>

                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Department</th>
                    <th>Salary</th>
                    <th>Actions</th>

                </tr>

            </thead>

            <tbody>

<%
List<Employee> employeeList =
(List<Employee>) request.getAttribute("employeeList");

if(employeeList != null){

    for(Employee emp : employeeList){
%>

<tr>

<td><%= emp.getEmpId() %></td>

<td><%= emp.getName() %></td>

<td><%= emp.getEmail() %></td>

<td><%= emp.getDepartment() %></td>

<td><%= emp.getSalary() %></td>

<td>

<a href="<%= request.getContextPath() %>/EditEmployeeServlet?id=<%= emp.getEmpId() %>"
   class="btn btn-warning btn-sm">

    <i class="bi bi-pencil-square"></i>
    Edit

</a>

<a href="<%= request.getContextPath() %>/DeleteEmployeeServlet?id=<%= emp.getEmpId() %>"
   class="btn btn-danger btn-sm"
   onclick="return confirm('Are you sure you want to delete this employee?');">

    <i class="bi bi-trash"></i>
    Delete

</a>

</td>

</tr>

<%
    }
}
%>

            </tbody>

        </table>

    </div>

    <br>

<%
Integer currentPage =
(Integer)request.getAttribute("currentPage");

Integer totalPages =
(Integer)request.getAttribute("totalPages");

if(currentPage != null &&
   totalPages != null){
%>

<div class="text-center">

<% if(currentPage > 1){ %>

<a href="<%= request.getContextPath() %>/EmployeePaginationServlet?page=<%= currentPage - 1 %>"
   class="btn btn-outline-secondary">

    Previous

</a>

<% } %>

<%
for(int i = 1; i <= totalPages; i++){
%>

<a href="<%= request.getContextPath() %>/EmployeePaginationServlet?page=<%= i %>"
   class="btn btn-outline-primary">

    <%= i %>

</a>

<%
}
%>

<% if(currentPage < totalPages){ %>

<a href="<%= request.getContextPath() %>/EmployeePaginationServlet?page=<%= currentPage + 1 %>"
   class="btn btn-outline-secondary">

    Next

</a>

<% } %>

</div>

<%
}
%>

</div>

</body>

</html>