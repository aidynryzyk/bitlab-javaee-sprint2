<%@ page import="dao.ItemDAO" %>
<%@ page import="entity.Item" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: aidyninho
  Date: 18.04.2023
  Time: 07:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Top Sales</title>
</head>
<body>
<div class="container justify-content-center">
    <div class="row row-cols-3">
        <%
            List<Item> items = (List<Item>) request.getAttribute("list");
            for (int i = 0; i < 6; i++) {
                if (i >= items.size()) {
                    break;
                }
                Item item = items.get(i);
                request.setAttribute("id", item.getId());
                String[] descriptions = item.getDescription().split("/");
        %>
            <div class="col">
                <div class="card m-3 text-center">
                    <div class="card-header lead"><%=item.getName()%></div>
                    <div class="card-body">
                        <h3 class="card-title text-success mb-3">$<%=item.getPrice()%></h3>
                        <div class="card-text mb-4">
                            <p class="m-1"><%=descriptions[0]%></p>
                            <p class="m-1"><%=descriptions[1]%></p>
                            <p class="m-1"><%=descriptions[2]%></p>
                        </div>
                        <div class="d-grid gap-2">
                            <form action="<%=request.getParameter("category_id") == null
                            ? "/item?show=" + request.getParameter("show")
                            : "/item?show=" + request.getParameter("show") + "&category_id="
                            + request.getParameter("category_id")%>" method="post">
                                <input type="hidden" name="id" value="<%=item.getId()%>">
                                <div class="d-grid gap-2">
                                    <button class="btn btn-success" type="submit">Buy now</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="card-footer text-body-secondary">
                        Sold: <%=item.getSold()%>
                    </div>
                </div>
            </div>
        <%
            }
        %>
    </div>
</div>
</body>
</html>
