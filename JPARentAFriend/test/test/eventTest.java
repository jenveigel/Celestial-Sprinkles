package test;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.Event;

public class eventTest {
	
	private EntityManagerFactory emf;
	private EntityManager em;
	private Event event;

	@Before
	public void setUp() throws Exception {
		this.emf = Persistence.createEntityManagerFactory("RentAFriend");
		this.em = emf.createEntityManager();
		this.event = em.find(Event.class, 1);
		
	}
	
	@After
	public void tearDown() throws Exception{
		em.close();
		emf.close();
	}
	
	@Test
	public void test_Address() {
		
	}
	
}
