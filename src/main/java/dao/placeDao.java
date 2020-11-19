package dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import model.flight;
import model.place;
import util.HibernateMain;

public class placeDao {
	
	public static List<place> selectAllplaces(){
		Transaction transaction = null;
		List<place> places = null;
		try (Session session = HibernateMain.getSessionFactory().openSession()) {

			transaction = session.beginTransaction();
			
			places = session.createQuery("from place").getResultList();
			
			transaction.commit();

		} catch (Exception e) {

			e.printStackTrace();
		}
		return places;
	}

	public static void insertplace(String placename){
		Transaction transaction = null;
		try (Session session = HibernateMain.getSessionFactory().openSession()) {

			session.beginTransaction();
			
			place Place = new place(placename);
			
			session.save(Place);
			
			session.getTransaction().commit();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public static void insertplace(place Place){
		Transaction transaction = null;
		try (Session session = HibernateMain.getSessionFactory().openSession()) {

			session.beginTransaction();
			
			session.save(Place);
			
			session.getTransaction().commit();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public static boolean deleteplace(int id){
		Transaction transaction = null;
		try (Session session = HibernateMain.getSessionFactory().openSession()) {

			session.beginTransaction();
			
			place Place = session.get(place.class, id);
			if (Place != null) {
				session.delete(Place);
				System.out.println("Place is deleted");
				session.getTransaction().commit();
				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	public static place placedetailbyid(int pid){
		Transaction transaction = null;
		place placedetail = null;
		try (Session session = HibernateMain.getSessionFactory().openSession()) {

			transaction = session.beginTransaction();
			
			Query query = session.createQuery("from place as p where p.id =:idParam");
			query.setParameter("idParam", pid);
			placedetail = (place) query.getSingleResult();

			transaction.commit();
		} catch (Exception e) {

			e.printStackTrace();
		}
		return placedetail;
	}
}
