package web;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.flightDao;
import model.flight;

@WebServlet("/Adminflights")
public class masterflights extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public masterflights() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			showflights(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void showflights(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		HttpSession adminsession= request.getSession(false);
		List<flight> listallflights =  flightDao.selectAllflights();
		adminsession.setAttribute("listallflights", listallflights);
		RequestDispatcher dispatcher = request.getRequestDispatcher("adminflights.jsp");
		dispatcher.forward(request, response);
	}
}