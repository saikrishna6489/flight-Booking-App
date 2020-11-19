package web;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.userDao;
import model.user;

@WebServlet("/userregisterController")
public class userregisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public userregisterController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			showpaymentForm(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	private void showpaymentForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		user u = new user();
		String message;
		u.setFirstName(request.getParameter("firstname"));
		u.setLastName(request.getParameter("lastname"));
		u.setPhone(request.getParameter("phone"));
		u.setEmail(request.getParameter("email"));
		u.setUsername(request.getParameter("username"));
		u.setPassword(request.getParameter("password"));
		HttpSession booksession= request.getSession(false);
		user userbyusername = userDao.userdetailbyusername(u.getUsername());
		user userbyemail = userDao.userdetailbyemail(u.getEmail());
		if(userbyusername != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("registeruser.jsp");
			request.setAttribute("message", "username already exists");
			request.setAttribute("reguser", u);
			dispatcher.forward(request, response);
		}else if(userbyemail != null){
			RequestDispatcher dispatcher = request.getRequestDispatcher("registeruser.jsp");
			request.setAttribute("message", "email already exists");
			request.setAttribute("reguser", u);
			dispatcher.forward(request, response);
		}else {
			userDao.saveUser(u);
		}
		response.sendRedirect("login.jsp");
		System.out.println(u);
	}

}
