package web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.userDao;
import model.user;

/**
 * @email Ramesh Fadatare
 */

@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private userDao loginDao;

	public void init() {
		loginDao = new userDao();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("login.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			authenticate(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void authenticate(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		HttpSession usersession= request.getSession();
		if (loginDao.validate(username, password)) {
			user loguser = loginDao.userdetailbyusername(username);
			System.out.println(loguser);
			usersession.setAttribute("usererrlogmessage", "");
			usersession.setAttribute("loguser", loguser);
			RequestDispatcher dispatcher = request.getRequestDispatcher("userdashboard");
			dispatcher.forward(request, response);
		}else {
			usersession.setAttribute("usererrlogmessage", "wrong username or password");
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		}
	}
}