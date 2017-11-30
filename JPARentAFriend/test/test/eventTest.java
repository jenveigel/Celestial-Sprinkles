package test;

import java.sql.Date;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import entities.Event;

public class eventTest {
	
	private EntityManagerFactory emf;
	private EntityManager em;
	private Event event;
	
	public static void main(String[] args) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("RentAFriend");
		EntityManager em = emf.createEntityManager();

		Event event = em.find(Event.class, 1);
		System.out.println(event);

		em.close();
		emf.close();
	}


	@Before
	public void setUp() throws Exception {
		this.emf = Persistence.createEntityManagerFactory("RentAFriend");
		this.em = emf.createEntityManager();

		event = em.find(Event.class, 1);
	}

	@After
	public void tearDown() throws Exception {
		this.em.close();
		this.emf.close();
	}

	@Test
	public void test_event_city() {
		// Rating rating = em.find(Rating.class, 1);
		assertEquals("Orlando", event.getAddress().getCity());

	}
	
	
}
