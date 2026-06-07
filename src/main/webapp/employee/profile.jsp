<%@ page import="com.ems.model.User" %>

<%
if(session.getAttribute("user") == null){

    response.sendRedirect(
        request.getContextPath() + "/login.jsp");

    return;
}

User user =
(User) session.getAttribute("user");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Employee Portal</title>

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

        <div class="col-md-8">

            <div class="page-card">

                <div class="text-center">

                    <i class="bi bi-person-circle"
                       style="font-size:80px;color:#0d6efd;"></i>

                    <h2 class="mt-3">

                        Welcome,
                        <%= user.getUsername() %> 

                    </h2>

                    <p class="text-muted">

                        Employee Portal

                    </p>

                </div>

                <hr>

                <table class="table table-bordered">

                    <tr>

                        <th width="30%">

                            Employee ID

                        </th>

                        <td>

                            <%= user.getId() %>

                        </td>

                    </tr>

                    <tr>

                        <th>

                            Username

                        </th>

                        <td>

                            <%= user.getUsername() %>

                        </td>

                    </tr>

                    <tr>

                        <th>

                            Role

                        </th>

                        <td>

                            <span class="badge bg-success">

                                <%= user.getRole() %>

                            </span>

                        </td>

                    </tr>

                </table>

                <div class="text-center">

                    <a href="<%= request.getContextPath() %>/LogoutServlet"
                       class="btn btn-danger">

                        <i class="bi bi-box-arrow-right"></i>

                        Logout

                    </a>

                </div>

            </div>

        </div>

    </div>

</div>

</body>

</html>