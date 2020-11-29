package web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.concurrent.TimeUnit;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.adminDao;
import model.flight;

@WebServlet("/admineditflight")
public class admineditflight extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public admineditflight() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			updateflightForm(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher dispatcher = request.getRequestDispatcher("Adminflights");
			dispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	private void updateflightForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException, ParseException {
		flight u = new flight();
		u.setId(Integer.parseInt(request.getParameter("id")));
		u.setAirline(request.getParameter("airline"));
		u.setDestination(request.getParameter("destination"));
		u.setEndtime(request.getParameter("endtime"));
		u.setFlightno(request.getParameter("flightno"));
		u.setSource(request.getParameter("source"));
		u.setStarttime(request.getParameter("starttime"));
		u.setTicketprice(request.getParameter("ticketprice"));
		String Date1=request.getParameter("traveldate");  
		Date date1=new SimpleDateFormat("yyyy-MM-dd").parse(Date1);
		u.setTraveldate(date1);
		String sDate1=request.getParameter("traveldate");
		String eDate1=request.getParameter("arrivaldate");
		String stime = request.getParameter("starttime");
		String etime = request.getParameter("endtime");
		String sDatetime = sDate1+" "+stime;
		String aDatetime = eDate1+" "+etime;
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date sdate = format.parse(sDatetime);
		Date edate = format.parse(aDatetime);
		long millis = edate.getTime() - sdate.getTime();
	    long mhours = TimeUnit.MILLISECONDS.toHours(millis);
	    long mminutes = TimeUnit.MILLISECONDS.toMinutes(millis) - TimeUnit.HOURS.toMinutes(TimeUnit.MILLISECONDS.toHours(millis));
	    String duration = mhours+"h "+mminutes+"m";
		System.out.println(duration);
		u.setDuration(duration);
		adminDao.updateflight(u);
		System.out.println(u);
		RequestDispatcher dispatcher = request.getRequestDispatcher("Adminflights");
		dispatcher.forward(request, response);
	}

}
