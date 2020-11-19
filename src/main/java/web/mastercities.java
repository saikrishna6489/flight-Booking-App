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

import dao.placeDao;
import dao.flightDao;
import model.flight;
import model.place;
import model.user;

@WebServlet("/Admincities")
public class mastercities extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private placeDao placeDao;

	public void init() {
		placeDao = new placeDao();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			showplaces(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void showplaces(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		HttpSession adminsession= request.getSession(false);
		List<place> listallplaces =  placeDao.selectAllplaces();
		request.setAttribute("listallplaces", listallplaces);
		RequestDispatcher dispatcher = request.getRequestDispatcher("adminplaces.jsp");
		dispatcher.forward(request, response);
	}
}