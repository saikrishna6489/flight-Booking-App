package web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.booking;
import model.flight;
import model.person;
import model.user;
import dao.bookingDao;
import dao.flightDao;

@WebServlet("/booksuccess")
public class Book3Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Book3Controller() {
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
		
		HttpSession booksession= request.getSession(false);
		int flightid = (int) booksession.getAttribute("flightid");
		user user = (user) booksession.getAttribute("user");
		int personsno = (int) booksession.getAttribute("tpersons");
		String bookingtime = bookingDao.timenow();
		String bookingemail = user.getEmail();
		
		flight flightdetail = bookingDao.flightdetailbyid(flightid);
		Date traveldate = flightdetail.getTraveldate();
		String cardno = request.getParameter("card");
		
		bookingDao.bookticket(flightid, bookingemail, traveldate, personsno, bookingtime, cardno);
		booking bookingdetail = bookingDao.bookingdetailbyemailandtime(bookingemail, bookingtime);
		
		int bookingid = bookingdetail.getId();
		
		for(int i=1;i<personsno+1;i++) {
			String fn = String.format("firstname%s", i);
			String firstname = request.getParameter(fn);
			String ln = String.format("lastname%s", i);
			String lastname = request.getParameter(ln);
			String gnd = String.format("gender%s", i);
			String gender = request.getParameter(gnd);
			bookingDao.insertperson(bookingid, firstname, lastname, gender);
			System.out.println(firstname);
			System.out.println(lastname);
			System.out.println(gender);
		}
		List<person> personslist = bookingDao.selectpersonsbybookingid(bookingid);
		request.setAttribute("flightdetail", flightdetail);
		request.setAttribute("bookingdetail", bookingdetail);
		request.setAttribute("personsno", personsno);
		request.setAttribute("user", user);
		RequestDispatcher dispatcher = request.getRequestDispatcher("bookingsuccesspage.jsp");
		dispatcher.forward(request, response);
	}

}
