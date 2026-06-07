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
<title>Admin Dashboard</title>
</head>
<body>

<h1>Admin Dashboard</h1>

<a href="<%= request.getContextPath() %>/admin/addEmployee.jsp">
    Add Employee
</a>

<a href="<%= request.getContextPath() %>/LogoutServlet">

Logout

</a>

<br><br>

<br><br>

<%
Integer currentPage =
(Integer)request.getAttribute("currentPage");

Integer totalPages =
(Integer)request.getAttribute("totalPages");

if(currentPage != null &&
   totalPages != null){
%>

<% if(currentPage > 1){ %>

<a href="<%= request.getContextPath() %>/EmployeePaginationServlet?page=<%= currentPage - 1 %>">

Previous

</a>

<% } %>

<%
for(int i = 1; i <= totalPages; i++){
%>

<a href="<%= request.getContextPath() %>/EmployeePaginationServlet?page=<%= i %>">

<%= i %>

</a>

<%
}
%>

<% if(currentPage < totalPages){ %>

<a href="<%= request.getContextPath() %>/EmployeePaginationServlet?page=<%= currentPage + 1 %>">

Next

</a>

<% } %>

<%
}
%>

<h3>Sort By</h3>

<a href="<%= request.getContextPath() %>/EmployeeSortServlet?sort=name">

Name

</a>

|

<a href="<%= request.getContextPath() %>/EmployeeSortServlet?sort=department">

Department

</a>

|

<a href="<%= request.getContextPath() %>/EmployeeSortServlet?sort=salary">

Salary

</a>

<a href="<%= request.getContextPath() %>/EmployeePaginationServlet?page=1">
<button type="button">
Default View
</button>
</a>

<br><br>

<table border="1">

<tr>
    <th>ID</th>
    <th>Name</th>
    <th>Email</th>
    <th>Department</th>
    <th>Salary</th>
    <th>Action</th>
</tr>

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

<a href="<%= request.getContextPath() %>/EditEmployeeServlet?id=<%= emp.getEmpId() %>">

Edit

</a>

&nbsp;&nbsp;

<a href="<%= request.getContextPath() %>/DeleteEmployeeServlet?id=<%= emp.getEmpId() %>"
   onclick="return confirm('Are you sure you want to delete this employee?');">

Delete

</a>

</td>

</tr>

<%
    }
}
%>

</table>

</body>
</html>