package web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

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
			RequestDispatcher dispatcher = request.getRequestDispatcher("welcomepage");
			dispatcher.forward(request, response);
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
		int userid = user.getId();
		int personsno = (int) booksession.getAttribute("tpersons");
		String bookingtime = bookingDao.timenow();
		String bookingemail = user.getEmail();
		
		flight flightdetail = bookingDao.flightdetailbyid(flightid);
		Date traveldate = flightdetail.getTraveldate();
		String cardno = request.getParameter("card");
		
		bookingDao.bookticket(flightid, userid, bookingemail, traveldate, personsno, flightdetail, bookingtime, cardno);
		booking bookingdetail = bookingDao.bookingdetailbyemailandtime(bookingemail, bookingtime);
		
		int bookingid = bookingdetail.getId();
		int rate = Integer.parseInt(flightdetail.getTicketprice());
		int ticrate = rate*personsno;
		ArrayList<person> arrlist = new ArrayList<person>(5); 
		for(int i=1;i<personsno+1;i++) {
			String fn = String.format("firstname%s", i);
			String firstname = request.getParameter(fn);
			String ln = String.format("lastname%s", i);
			String lastname = request.getParameter(ln);
			String gnd = String.format("gender%s", i);
			String gender = request.getParameter(gnd);
			person bookperson = new person(bookingid, firstname, lastname, gender); 
			arrlist.add(bookperson);
			System.out.println(firstname);
			System.out.println(lastname);
			System.out.println(gender);
		}
		for( person strDay : arrlist ){
		    System.out.println(strDay);
		}
		bookingDao.insertpersonlist(arrlist);
		List<person> personslist = bookingDao.selectpersonsbybookingid(bookingid);
		bookingDao.updatebooking(bookingdetail, personslist);
		booking bookingdetail1 = bookingDao.bookingdetailbyemailandtime(bookingemail, bookingtime);
		bookingDao.updatebooking(bookingdetail1, personslist);
		Set<person> personslist1 = bookingdetail1.getPersons();
		for( person strDay : personslist1 ){
		    System.out.println(strDay);
		    System.out.println("success");
		}
		booksession.setAttribute("bookingdetail", bookingdetail1);
		booksession.setAttribute("personsno", personsno);
		booksession.setAttribute("user", user);
		booksession.setAttribute("personslist1", personslist);
		booksession.setAttribute("ticrate", ticrate);
		response.sendRedirect("bookingsuccesspage.jsp");
	}

}
