package web;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.flight;
import dao.flightDao;

@WebServlet("/ind")
public class FlightController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			listflight(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	private void listflight(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException, ParseException {
		String travelfrom = request.getParameter("travelfrom");
		String travelto = request.getParameter("travelto");
		int travelpersons = Integer.parseInt(request.getParameter("travelpersons"));

		SimpleDateFormat in = new SimpleDateFormat("yyyy-MM-dd");
		String parameter = request.getParameter("traveldate");
		Date date = in.parse(parameter);


		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		System.out.println(fmt.format(date));
		System.out.println(travelfrom);
		System.out.println(travelto);
		System.out.println(travelpersons);
		HttpSession booksession= request.getSession();
		booksession.setAttribute("tpersons", travelpersons);
		System.out.println("uhh");
		List<flight> listflights = flightDao.selectQueryflights(travelfrom, travelto, date);
		for (flight bookInfo : listflights) {
			System.out.println("uhh");
	        System.out.println(bookInfo);
	    }
		request.setAttribute("listflights", listflights);
		System.out.println("uhh");
		RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
		dispatcher.forward(request, response);
	}

}