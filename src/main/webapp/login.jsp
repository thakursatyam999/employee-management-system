<%@ page language="java" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Login</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">

<link rel="stylesheet"
      href="css/style.css">

</head>

<body>

<div class="login-container">

    <div class="login-card">

        <h2 class="text-center mb-4">
            Employee Management System
        </h2>

        <form action="LoginServlet"
              method="post">

            <div class="mb-3">

                <label class="form-label">
                    Username
                </label>

                <input type="text"
                       name="username"
                       class="form-control"
                       required>

            </div>

            <div class="mb-3">

                <label class="form-label">
                    Password
                </label>

                <input type="password"
                       name="password"
                       class="form-control"
                       required>

            </div>

            <button type="submit"
                    class="btn btn-primary w-100">

                Login

            </button>

        </form>

    </div>

</div>

</body>

</html>