package web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.placeDao;

@WebServlet("/welcomepage")
public class welcomepage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public welcomepage() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			showdetailsForm(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void showdetailsForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		List<String> places = placeDao.selectDistintplacenames();
		HttpSession welcomesession= request.getSession();
		welcomesession.setAttribute("bookinplaces", places);
		welcomesession.setAttribute("usererrlogmessage", "");
		welcomesession.setAttribute("adminerrlogmessage", "");
		response.sendRedirect("index.jsp");
	}
}
