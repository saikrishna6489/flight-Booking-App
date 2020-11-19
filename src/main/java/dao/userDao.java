package dao;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import model.flight;
import model.user;
import util.HibernateMain;

public class userDao {
	
	public static user userdetailbyusername(String username){
		Transaction transaction = null;
		user userdetail = null;
		try (Session session = HibernateMain.getSessionFactory().openSession()) {

			transaction = session.beginTransaction();
			
			Query query = session.createQuery("from user as u where u.username =:userParam");
			query.setParameter("userParam", username);
			userdetail = (user) query.getSingleResult();

			transaction.commit();
		} catch (Exception e) {

			e.printStackTrace();
		}
		return userdetail;
	}

	public static user userdetailbyemail(String email){
		Transaction transaction = null;
		user userdetail = null;
		try (Session session = HibernateMain.getSessionFactory().openSession()) {

			transaction = session.beginTransaction();
			
			Query query = session.createQuery("from user as u where u.email =:emailParam");
			query.setParameter("emailParam", email);
			userdetail = (user) query.getSingleResult();

			transaction.commit();
		} catch (Exception e) {

			e.printStackTrace();
		}
		return userdetail;
	}

	public static void saveUser(user user) {
		Transaction transaction = null;
		try (Session session = HibernateMain.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// save the student object
			session.save(user);
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}

	public boolean validate(String userName, String password) {

		Transaction transaction = null;
		user user = null;
		try (Session session = HibernateMain.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// get an user object
			user = (user) session.createQuery("FROM user U WHERE U.username = :userName").setParameter("userName", userName)
					.uniqueResult();
			
			if(user != null && user.getPassword().equals(password)) {
				return true;
			}
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

}