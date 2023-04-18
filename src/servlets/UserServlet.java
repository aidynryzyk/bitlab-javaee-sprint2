package servlets;

import dao.UserDAO;
import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/login")
public class UserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getParameter("email") == null && req.getParameter("password") == null) {
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        } else {
            UserDAO userDAO = new UserDAO();
            User user = userDAO.getUserByEmail(req.getParameter("email"));
            if (user == null || !user.getPassword().equals(req.getParameter("password"))) {
                req.setAttribute("found", false);
                req.getRequestDispatcher("login.jsp").forward(req, resp);
            } else {
                req.setAttribute("found", true);
                req.setAttribute("user", user);
                req.getRequestDispatcher("profile.jsp").forward(req, resp);
            }
        }
    }
}
