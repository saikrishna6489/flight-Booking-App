package web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.adminDao;
import dao.placeDao;
import model.flight;
import model.place;
import model.user;

@WebServlet("/admininsertplace")
public class admininsertplace extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public admininsertplace() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			insertplaceform(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	private void insertplaceform(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException, ParseException {
		place u = new place();
		HttpSession adminsession= request.getSession();
		String placename = request.getParameter("cityname");
		u.setPlacename(placename);
		placeDao.insertplace(u);
		System.out.println("placename::"+placename);
		List<String> places = placeDao.selectDistintplacenames();
		adminsession.setAttribute("bookinplaces", places);
		RequestDispatcher dispatcher = request.getRequestDispatcher("Admincities");
		dispatcher.forward(request, response);
		
	}

}
