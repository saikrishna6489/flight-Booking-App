package dao;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import model.user;


public class adduser {


    public static void main( String[] args )
    {
    	// Get a reference to the SessionFactory
    	SessionFactory theFactory = new Configuration()
    								.configure("hibernate.cfg.xml")
    								.addAnnotatedClass(user.class)
    								.buildSessionFactory();
    	
    	
//    	Get the Session Object from the Factory
    	Session theSession = theFactory.getCurrentSession();
    	
    	
//    	Write the code using the Session reference to save a new java object into the table
    	try {
    		//  Lets create a new StudentDetails object
    		user theStudent = new user("sai", "krishna", "chsaikrishna6489@gmail.com", "9490531758", "sai6489" ,"password");
    		
//    		Start the transaction
    		theSession.beginTransaction();
    		
//    		Save the New StudentDetails object
    		theSession.save(theStudent);
    		
//    		Commit the transaction
    		theSession.getTransaction().commit();
    	}
    	finally {
			theFactory.close();
		}
    	
    
}
}
