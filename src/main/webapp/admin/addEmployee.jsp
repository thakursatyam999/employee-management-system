<%@ page language="java" %>

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

<title>Add Employee</title>

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

                    <i class="bi bi-person-plus-fill"></i>

                    Add Employee

                </h2>

                <form action="<%= request.getContextPath() %>/AddEmployeeServlet"
                      method="post">

                    <div class="mb-3">

                        <label class="form-label">

                            Employee Name

                        </label>

                        <input type="text"
                               name="name"
                               class="form-control"
                               required>

                    </div>

                    <div class="mb-3">

                        <label class="form-label">

                            Email Address

                        </label>

                        <input type="email"
                               name="email"
                               class="form-control"
                               required>

                    </div>

                    <div class="mb-3">

                        <label class="form-label">

                            Department

                        </label>

                        <input type="text"
                               name="department"
                               class="form-control"
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
                               required>

                    </div>

                    <div class="d-grid gap-2">

                        <button type="submit"
                                class="btn btn-success">

                            <i class="bi bi-plus-circle"></i>

                            Add Employee

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