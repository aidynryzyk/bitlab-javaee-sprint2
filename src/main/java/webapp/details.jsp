<%@ page import="db.Task" %>
<%@ page import="db.DBManager" %><%--
  Created by IntelliJ IDEA.
  User: aidyninho
  Date: 08.04.2023
  Time: 14:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Details</title>
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>
<form>
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <form>
                <div class="modal-body">
                    <input type="hidden" name="id" value="<%=request.getParameter("id")%>">
                    <div class="mb-3">
                        <label class="form-label">Name:</label>
                        <input type="text" class="form-control" name="name" placeholder="Name" value="<%=DBManager.getInstance().getTask(Integer.parseInt(request.getParameter("id"))).getName()%>">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Description:</label>
                        <textarea class="form-control" rows="3" name="desc" placeholder="Description"><%=DBManager.getInstance().getTask(Integer.parseInt(request.getParameter("id"))).getDescription()%></textarea>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Due date:</label>
                        <input type="date" class="form-control" name="date" value="<%=DBManager.getInstance().getTask(Integer.parseInt(request.getParameter("id"))).getDate()%>">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Status:</label>
                        <select class="form-select" name="status">
                            <option selected value="0">Not done</option>
                            <option value="1">Done</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-danger" formmethod="post" formaction="/details">Delete</button>
                    <button type="submit" class="btn btn-success" data-bs-dismiss="modal" formmethod="post" formaction="/add">Save</button>
                </div>
            </form>
        </div>
    </div>
</form>
</body>
</html>
