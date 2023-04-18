<%--
  Created by IntelliJ IDEA.
  User: aidyninho
  Date: 19.04.2023
  Time: 04:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>
<div class="container">
    <div class="card text-center">
        <div class="card-header">
            Login Page
        </div>
        <div class="card-body">
            <form method="get" action="/login">
                <%
                    if (request.getAttribute("found") != null && !((boolean) request.getAttribute("found"))) {
                %>
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    Incorrect <strong>email</strong> or <strong>password</strong>!
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <%
                    }
                %>
                <div class="form-group row mb-3">
                    <label class="col-sm-2 col-form-label">Email:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="email">
                    </div>
                </div>
                <div class="form-group row mb-3">
                    <label class="col-sm-2 col-form-label">Password:</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" name="password">
                    </div>
                </div>
                <button class="btn btn-success" type="submit">Login</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
