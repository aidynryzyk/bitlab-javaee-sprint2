package servlets;

import dao.ItemDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/item")
public class ItemServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String show = req.getParameter("show");
        ItemDAO itemDAO = new ItemDAO();
        switch (show) {
            case "top" -> req.setAttribute("list", itemDAO.getAllItemSortedBySoldDesc());
            case "date" -> req.setAttribute("list", itemDAO.getAllItemSortedByDateDesc());
            case "category" ->
                    req.setAttribute("list", itemDAO.getAllItemByCategory(Long.parseLong(req.getParameter("category_id"))));
        }
        req.getRequestDispatcher("page.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ItemDAO itemDAO = new ItemDAO();
        itemDAO.incrementSold(Long.parseLong(req.getParameter("id")));
        doGet(req, resp);
    }
}
