package test;

import static org.junit.Assert.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.User;

public class UserTest {
	private EntityManagerFactory emf;
	private EntityManager em;
	private User user;
	
	@Before
	public void setUp() throws Exception {
		this.emf = Persistence.createEntityManagerFactory("RentAFriend");
		this.em = emf.createEntityManager();
		
		this.user = em.find(User.class, 1);
	}
	
	@After
	public void tearDown() throws Exception{
		em.close();
		emf.close();
	}
	
	@Test
	public void test() {
		boolean pass = true;
		assertEquals(pass, true);
	}
	
	@Test
	public void test_user_to_profile_mapping() {
		assertEquals("aaron",user.getProfile().getFirstName());
		assertEquals("ipp",user.getProfile().getLastName());
		assertEquals("falcon's bio", user.getProfile().getBio());
	}
	
	@Test
	public void test_user_to_event_mapping() {
		assertEquals("Going to the Movies",user.getEvents().get(0).getActivity());
	}
	
}
