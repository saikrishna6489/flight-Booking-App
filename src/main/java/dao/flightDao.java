package dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import model.flight;
import util.HibernateMain;

public class flightDao {
	public static List<flight> selectAllflights(){
		Transaction transaction = null;
		List<flight> flights = null;
		try (Session session = HibernateMain.getSessionFactory().openSession()) {

			transaction = session.beginTransaction();
			
			flights = session.createQuery("from flight").getResultList();
			
			transaction.commit();
			printBooks(flights);
		} catch (Exception e) {

			e.printStackTrace();
		}
		return flights;
	}
	public static List<String> selectAllairlines(){
		Transaction transaction = null;
		List<String> flights = null;
		try (Session session = HibernateMain.getSessionFactory().openSession()) {

			transaction = session.beginTransaction();
			
			flights = session.createQuery("select DISTINCT f.airline from flight f").getResultList();
			
			transaction.commit();
		} catch (Exception e) {

			e.printStackTrace();
		}
		return flights;
	}
	public static List<flight> selectQueryflights(String travelfrom, String travelto, Date date){
		Transaction transaction = null;
		List<flight> flights = null;
		try (Session session = HibernateMain.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// get an user object
			
			Query query = session.createQuery("from flight as f where f.source=:fromParam and f.destination=:toParam and f.traveldate=:dateParam");
			query.setParameter("fromParam", travelfrom);
			query.setParameter("toParam", travelto);
			query.setParameter("dateParam", date);
			
			flights = query.getResultList();
			
			// commit transaction
			transaction.commit();
			printBooks(flights);
		} catch (Exception e) {

			e.printStackTrace();
		}
		return flights;
	}
	public static void printBooks(List<flight> books) {
	    for (flight bookInfo : books) {
	        System.out.println(bookInfo);//assuming you implemented toString or use logger to log into the logs
	    }
	}
}
