package web;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/bookdetails")
public class BookController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public BookController() {
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
		int id = Integer.parseInt(request.getParameter("id"));
		HttpSession booksession= request.getSession(false);
		booksession.setAttribute("flightid", id);
		int noofpersons = (int) booksession.getAttribute("tpersons");
		response.sendRedirect("detailsform.jsp");
		System.out.println(id);
	}
}
