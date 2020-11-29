package web;

import java.io.IOException;
import java.sql.SQLException;

import java.text.ParseException;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.adminDao;
import model.flight;

@WebServlet("/adminflighteditform")
public class adminflighteditform extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public adminflighteditform() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			insertflightForm(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher dispatcher = request.getRequestDispatcher("Adminflights");
			dispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	private void insertflightForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException, ParseException {
		int id = Integer.parseInt(request.getParameter("id"));
		flight flight = adminDao.flightdetailbyid(id);
		
		System.out.println("now"+flight);
		String sDate1=flight.getStarttime();  

	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm");
	    LocalTime date7 = LocalTime.parse(sDate1, formatter);
	    
		RequestDispatcher dispatcher = request.getRequestDispatcher("adminflightedit.jsp");
		request.setAttribute("flight", flight);
		request.setAttribute("starttime", date7);
		dispatcher.forward(request, response);
	}

}
