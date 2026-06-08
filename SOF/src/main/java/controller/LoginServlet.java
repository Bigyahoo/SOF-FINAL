package controller;

import java.io.IOException;

import dao.UserDAO;
import entity.User;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws IOException {

        String email =
                request.getParameter("email");

        String password =
                request.getParameter("password");

        User user =
                userDAO.login(email, password);

        if(user != null){

            HttpSession session =
                    request.getSession();

            session.setAttribute("user", user);

            response.sendRedirect(
                    request.getContextPath() + "/");

        }else{

            response.sendRedirect(
                    "login.jsp?error=true");
        }
    }
}