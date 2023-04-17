<%@ page import="db.Task" %>
<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: aidyninho
  Date: 07.04.2023
  Time: 20:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Tasks</title>
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>
<jsp:include page="modal.jsp"></jsp:include>
<div class="container">
    <!-- Button trigger modal -->
    <button type="button" class="mt-3 btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
        + Add Task
    </button>
    <table class="mt-3 table table-hover">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Due date</th>
            <th scope="col">Status</th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody>
        <%
            Map<String, Task> tasks = (Map<String, Task>) request.getAttribute("tasks");
            for (Task task:
                    tasks.values()) {
        %>
        <tr>
            <th scope="row"><%=task.getId()%></th>
            <td><%=task.getName()%></td>
            <td><%=task.getDateDMYFormat()%></td>
            <td><%=task.isDone()%></td>
            <td><a class="btn btn-primary btn-sm" href="details?id=<%=task.getId()%>">Details</a></td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>
