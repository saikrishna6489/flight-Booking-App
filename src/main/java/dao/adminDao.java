package dao;

import java.util.Date;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import model.flight;
import model.user;
import util.HibernateMain;

public class adminDao {
	public boolean validate(String userName, String password) {

		Transaction transaction = null;
		user user = null;
		String admin_username = "admin";
		try (Session session = HibernateMain.getSessionFactory().openSession()) {
			if (userName.equals(admin_username)) {
				transaction = session.beginTransaction();
	
				user = (user) session.createQuery("FROM user U WHERE U.username = :userName").setParameter("userName", userName)
						.uniqueResult();
				
				if(user != null && user.getPassword().equals(password)) {
					return true;
				}
	
				transaction.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	public static void insertflight(String flightno, String airline, Date traveldate, String traveltime, String starttime, String endtime,
			String source, String destination, String ticketprice){
		Transaction transaction = null;
		try (Session session = HibernateMain.getSessionFactory().openSession()) {

			session.beginTransaction();
			
			flight Flight = new flight(flightno, airline, traveldate, traveltime, starttime, endtime, source, destination, ticketprice);
			
			session.save(Flight);
			
			session.getTransaction().commit();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public static void insertflight(flight Flight){
		Transaction transaction = null;
		try (Session session = HibernateMain.getSessionFactory().openSession()) {

			session.beginTransaction();
			
			session.save(Flight);
			
			session.getTransaction().commit();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public static void updateflight(flight Flight){
		Transaction transaction = null;
		try (Session session = HibernateMain.getSessionFactory().openSession()) {

			session.beginTransaction();
			
			session.saveOrUpdate(Flight);
			
			session.getTransaction().commit();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public static void changepassword(user User){
		Transaction transaction = null;
		try (Session session = HibernateMain.getSessionFactory().openSession()) {

			session.beginTransaction();
			
			session.saveOrUpdate(User);
			
			session.getTransaction().commit();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public static boolean deleteflight(int id){
		Transaction transaction = null;
		try (Session session = HibernateMain.getSessionFactory().openSession()) {

			session.beginTransaction();
			
			flight Flight = session.get(flight.class, id);
			if (Flight != null) {
				session.delete(Flight);
				System.out.println("flight is deleted");
				session.getTransaction().commit();
				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
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
}
