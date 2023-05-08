package com.example.eshop3.Controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "LogoutServlet", urlPatterns = "/logout")
public class LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession httpSession = req.getSession();
        if (httpSession.getAttribute("user") != null) {
            httpSession.removeAttribute("user");
        }
        resp.sendRedirect("/trangchu");
//        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/login.jsp");
//        dispatcher.forward(req, resp);

    }
}
