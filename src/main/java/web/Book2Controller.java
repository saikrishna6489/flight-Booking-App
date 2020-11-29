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

import dao.bookingDao;
import model.flight;
import model.user;

@WebServlet("/bookpayment")
public class Book2Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Book2Controller() {
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
		user u = new user();
		u.setFirstName(request.getParameter("firstname"));
		u.setLastName(request.getParameter("lastname"));
		u.setPhone(request.getParameter("phone"));
		u.setEmail(request.getParameter("email"));
		if(request.getParameter("id")!= "") {
		u.setId(Integer.parseInt(request.getParameter("id")));
		}
		HttpSession booksession= request.getSession(false);
		booksession.setAttribute("user", u);
		int flightid = (int) booksession.getAttribute("flightid");
		System.out.println(flightid);
		flight flightdetail = bookingDao.flightdetailbyid(flightid);
		System.out.println(flightdetail);
		booksession.setAttribute("flightdetail", flightdetail);
		response.sendRedirect("paymentpage.jsp");
		System.out.println(u);
		int id = (int) booksession.getAttribute("flightid");
		System.out.println("id is : "+id);
	}

}
