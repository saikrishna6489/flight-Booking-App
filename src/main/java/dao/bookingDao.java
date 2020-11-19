package dao;

import java.util.Date;
import java.util.List;

import java.text.DateFormat;
import java.text.SimpleDateFormat;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import model.flight;
import model.person;
import model.user;
import model.booking;

import util.HibernateMain;

public class bookingDao {
	public static flight flightdetailbyid(int fid){
		Transaction transaction = null;
		flight flightdetail = null;
		try (Session session = HibernateMain.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// get an user object
			
			Query query = session.createQuery("from flight as f where f.id =:idParam");
			query.setParameter("idParam", fid);
			flightdetail = (flight) query.getSingleResult();
			// commit transaction
			transaction.commit();
		} catch (Exception e) {

			e.printStackTrace();
		}
		return flightdetail;
	}
	public static void insertperson(int bookingid, String firstname, String lastname, String gender){
		Transaction transaction = null;
		try (Session session = HibernateMain.getSessionFactory().openSession()) {

			session.beginTransaction();
			
			person person = new person(bookingid, firstname, lastname, gender);
			
			session.save(person);
			
			session.getTransaction().commit();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public static String timenow(){
        DateFormat dateFormat = new SimpleDateFormat("hh:mm:ss a");
        Date date = new Date();
        String time=dateFormat.format(date);
        return time;
    }
	public static void bookticket(int flightid, int userid, String bookingemail, Date traveldate, int personsno, String bookingtime, String cardno){
		Transaction transaction = null;
		try (Session session = HibernateMain.getSessionFactory().openSession()) {
    		booking ticket = new booking(flightid, userid, bookingemail, traveldate, personsno, bookingtime, cardno);

    		session.beginTransaction();
    		
    		session.save(ticket);
    		
    		session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public static booking bookingdetailbyemailandtime(String email, String time){
		Transaction transaction = null;
		booking bookingdetail = null;
		try (Session session = HibernateMain.getSessionFactory().openSession()) {

			transaction = session.beginTransaction();
			
			Query query = session.createQuery("from booking as b where b.bookingemail=:emailParam and b.bookingtime=:timeParam");
			query.setParameter("emailParam", email);
			query.setParameter("timeParam", time);
			bookingdetail = (booking) query.getSingleResult();

			transaction.commit();
			
		} catch (Exception e) {

			e.printStackTrace();
		}
		return bookingdetail;
	}
	public static List<person> selectpersonsbybookingid(int id){
		Transaction transaction = null;
		List<person> persons = null;
		try (Session session = HibernateMain.getSessionFactory().openSession()) {

			transaction = session.beginTransaction();
			
			Query query = session.createQuery("from person as p where p.bookingid=:idParam");
			query.setParameter("idParam", id);
			
			persons = query.getResultList();
			transaction.commit();
			
		} catch (Exception e) {

			e.printStackTrace();
		}
		return persons;
	}
	public static List<booking> selectbookingsbyuserid(int id){
		Transaction transaction = null;
		List<booking> bookings = null;
		try (Session session = HibernateMain.getSessionFactory().openSession()) {

			transaction = session.beginTransaction();
			
			Query query = session.createQuery("from booking as b where b.userid=:idParam");
			query.setParameter("idParam", id);
			
			bookings = query.getResultList();
			transaction.commit();
			
		} catch (Exception e) {

			e.printStackTrace();
		}
		return bookings;
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