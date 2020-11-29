package web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.user;

@WebServlet("/Adminpasschange")
public class adminpasswordchange extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public adminpasswordchange() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			passwordchange(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher dispatcher = request.getRequestDispatcher("Adminflights");
			dispatcher.forward(request, response);
		}
	}

	private void passwordchange(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		String password = request.getParameter("password");
		
		HttpSession adminsession= request.getSession(false);
		user User = (user) adminsession.getAttribute("Adminuser");
		System.out.println("User");
		User.setPassword(password);
		dao.adminDao.changepassword(User);
		RequestDispatcher dispatcher = request.getRequestDispatcher("Adminflights");
		dispatcher.forward(request, response);

	}
}