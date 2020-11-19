package web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.adminDao;

@WebServlet("/Adminlogin")
public class adminLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private adminDao adminDao;

	public void init() {
		adminDao = new adminDao();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			authenticate(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void authenticate(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		if (adminDao.validate(username, password)) {
			HttpSession adminsession= request.getSession();
			RequestDispatcher dispatcher = request.getRequestDispatcher("Adminflights");
			dispatcher.forward(request, response);
		}else {
			System.out.println(username+""+password);
		}
	}
}