<%@ page import="com.ems.model.Employee" %>

<%
if(session.getAttribute("user") == null){

    response.sendRedirect(
        request.getContextPath() + "/login.jsp");

    return;
}

Employee emp =
(Employee) request.getAttribute("employee");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Edit Employee</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">

<link rel="stylesheet"
      href="<%= request.getContextPath() %>/css/style.css">

<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

</head>

<body>

<div class="container mt-5">

    <div class="row justify-content-center">

        <div class="col-md-6">

            <div class="page-card">

                <h2 class="text-center mb-4">

                    <i class="bi bi-pencil-square"></i>

                    Edit Employee

                </h2>

                <form action="<%= request.getContextPath() %>/UpdateEmployeeServlet"
                      method="post">

                    <input type="hidden"
                           name="empId"
                           value="<%= emp.getEmpId() %>">

                    <div class="mb-3">

                        <label class="form-label">

                            Employee Name

                        </label>

                        <input type="text"
                               name="name"
                               class="form-control"
                               value="<%= emp.getName() %>"
                               required>

                    </div>

                    <div class="mb-3">

                        <label class="form-label">

                            Email Address

                        </label>

                        <input type="email"
                               name="email"
                               class="form-control"
                               value="<%= emp.getEmail() %>"
                               required>

                    </div>

                    <div class="mb-3">

                        <label class="form-label">

                            Department

                        </label>

                        <input type="text"
                               name="department"
                               class="form-control"
                               value="<%= emp.getDepartment() %>"
                               required>

                    </div>

                    <div class="mb-3">

                        <label class="form-label">

                            Salary

                        </label>

                        <input type="number"
                               step="0.01"
                               name="salary"
                               class="form-control"
                               value="<%= emp.getSalary() %>"
                               required>

                    </div>

                    <div class="d-grid gap-2">

                        <button type="submit"
                                class="btn btn-warning">

                            <i class="bi bi-check-circle"></i>

                            Update Employee

                        </button>

                        <a href="<%= request.getContextPath() %>/EmployeePaginationServlet?page=1"
                           class="btn btn-secondary">

                            <i class="bi bi-arrow-left-circle"></i>

                            Back To Dashboard

                        </a>

                    </div>

                </form>

            </div>

        </div>

    </div>

</div>

</body>

</html>