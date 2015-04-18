package com.lis.base.test;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class HibernateTest {
	public static void main(String[] args) {
		
	Configuration conf = new Configuration().configure();
	SessionFactory sf = conf.buildSessionFactory();
	Session s = sf.openSession();
	Transaction tx = s.beginTransaction();
	UserXmlTest user = new UserXmlTest();
	user.setUsername("TestUser");
	s.save(user); 
	tx.commit();
	s.close();	
	sf.close();
	}
}
