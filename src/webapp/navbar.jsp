<%@ page import="dao.UserDAO" %>
<%@ page import="entity.User" %><%--
  Created by IntelliJ IDEA.
  User: aidyninho
  Date: 08.04.2023
  Time: 13:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Navbar</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>
<body>
<div>
    <nav class="navbar navbar-expand-lg">
        <div class="container border-bottom pt-3 pb-3">
            <a class="navbar-brand" href="/"><strong>BITLAB SHOP</strong></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="navbar-nav">
                <%
                    User user = (User) request.getAttribute("user");
                    if ("top".equals(request.getParameter("show"))) {
                %>
                <a class="nav-link active" href="/item?show=top">Top Sales</a>
                <%
                    } else {
                %>
                <a class="nav-link" href="/item?show=top">Top Sales</a>
                <%
                    }
                    if ("date".equals(request.getParameter("show"))) {
                %>
                <a class="nav-link active" href="/item?show=date">New Sales</a>
                <%
                } else {
                %>
                <a class="nav-link" href="/item?show=date">New Sales</a>
                <li class="nav-item dropdown">
                <%
                }
                if ("category".equals(request.getParameter("show"))) {
                %>
                    <a class="nav-link dropdown-toggle active" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        By Category
                    </a>
                <%
                } else {
                %>
                    <a class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        By Category
                    </a>
                <%
                    }
                %>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/item?show=category&category_id=1">Computers</a></li>
                        <li><a class="dropdown-item" href="/item?show=category&category_id=2">Smartphones</a></li>
                        <li><a class="dropdown-item" href="/item?show=category&category_id=3">Tablets</a></li>
                    </ul>
                </li>
                <%
                    if (request.getParameter("show") == null) {
                        if (user == null) {
                %>
                <a class="nav-link active" href="/login">Sign In</a>
                <%
                        } else {
                %>
                <a class="nav-link active" href="profile.jsp"><%=user.getFullName()%></a>
                <%
                        }
                    } else {
                        if (user == null)  {
                %>
                <a class="nav-link" href="/login">Sign In</a>
                <%
                        } else {
                %>
                <a class="nav-link" href="profile.jsp"><%=user.getFullName()%></a>
                <%
                        }
                    }
                %>
            </div>
        </div>
    </nav>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>
