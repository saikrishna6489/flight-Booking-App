package web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	    Date time1=new SimpleDateFormat("HH:mm").parse(sDate1);

	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm");
	    LocalTime date7 = LocalTime.parse(sDate1, formatter);
	    java.util.Date date = new java.util.Date();
	    SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
	    System.out.println(sdf.format(date));
	    
		RequestDispatcher dispatcher = request.getRequestDispatcher("adminflightedit.jsp");
		request.setAttribute("flight", flight);
		request.setAttribute("starttime", date7);
		dispatcher.forward(request, response);
	}

}