package web;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.adminDao;

@WebServlet("/admindeleteflight")
public class admindeleteflight extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public admindeleteflight() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			showpaymentForm(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher dispatcher = request.getRequestDispatcher("Adminflights");
			dispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	private void showpaymentForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		System.out.println(id);
		if (adminDao.deleteflight(id)) {
			System.out.println("flight deleted successfully");
		}else {
			System.out.println("flight deleted failed");
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("Adminflights");
		dispatcher.forward(request, response);
	}

}
