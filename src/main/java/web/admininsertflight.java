package web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
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
import model.flight;
import model.user;

@WebServlet("/admininsertflight")
public class admininsertflight extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public admininsertflight() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			insertflightForm(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	private void insertflightForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException, ParseException {
		flight u = new flight();
		u.setAirline(request.getParameter("airline"));
		u.setDestination(request.getParameter("destination"));
		u.setEndtime(request.getParameter("endtime"));
		u.setFlightno(request.getParameter("flightno"));
		u.setSource(request.getParameter("source"));
		u.setStarttime(request.getParameter("starttime"));
		u.setTicketprice(request.getParameter("ticketprice"));
		String sDate1=request.getParameter("traveldate");  
	    Date date1=new SimpleDateFormat("dd-MM-yyyy").parse(sDate1);
		u.setTraveldate(date1);
		String hours = request.getParameter("hours");
		String minutes = request.getParameter("minutes");
		String duration = hours+"h "+minutes+"m";
		u.setDuration(duration);
		adminDao.insertflight(u);
		System.out.println(u);
		RequestDispatcher dispatcher = request.getRequestDispatcher("Adminflights");
		dispatcher.forward(request, response);
	}

}
