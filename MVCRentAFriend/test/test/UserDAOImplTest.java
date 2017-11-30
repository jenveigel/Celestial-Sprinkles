package test;

import static org.junit.Assert.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import data.UserDAO;
import data.UserDAOImpl;

public class UserDAOImplTest {
	private EntityManagerFactory emf;
	private EntityManager em;
	private UserDAO userDao;
	
	
	@Before
	public void setUp() throws Exception {
		this.userDao  = new UserDAOImpl();
		this.emf = Persistence.createEntityManagerFactory("RentAFriend");
		this.em = emf.createEntityManager();
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
	public void test_create_user() {
		userDao.createUser("jake", "theSnake");
		assertEquals("",userDao.getAllUsers().get(userDao.getAllUsers().size()-1).getUserName());
		assertEquals("",userDao.getAllUsers().get(userDao.getAllUsers().size()-1).getPassword());
	}
}

