package web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.adminDao;
import dao.placeDao;
import model.user;

@WebServlet("/admindeleteplace")
public class admindeleteplace extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public admindeleteplace() {
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
		int id = Integer.parseInt(request.getParameter("id"));
		System.out.println(id);
		if (placeDao.deleteplace(id)) {
			System.out.println("place deleted successfully");
		}else {
			System.out.println("place deleting failed");
		}
		HttpSession adminsession= request.getSession();
		RequestDispatcher dispatcher = request.getRequestDispatcher("Admincities");
		List<String> places = placeDao.selectDistintplacenames();
		adminsession.setAttribute("bookinplaces", places);
		dispatcher.forward(request, response);
	}

}
