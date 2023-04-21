<%@ page import="entity.User" %><%--
  Created by IntelliJ IDEA.
  User: aidyninho
  Date: 19.04.2023
  Time: 05:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Profile</title>
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>
<%
    User user = (User) request.getSession().getAttribute("user");
%>
<figure class="text-center mt-5">
    <blockquote class="blockquote">
        <p class="h1"><strong>Hello, <%=user.getFullName()%>!</strong></p>
        <p class="text-body-secondary">This is your profile page</p>
    </blockquote>
</figure>
</body>
</html>
