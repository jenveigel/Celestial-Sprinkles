//package client;
//
//import java.time.LocalDateTime;
//import java.util.Date;
//
//import javax.persistence.EntityManager;
//import javax.persistence.EntityManagerFactory;
//import javax.persistence.Persistence;
//
//import data.EventDAO;
//import entities.Address;
//import entities.Event;
//import entities.User;
//
//public class eventDAOtest {
//	public static void main(String[] args) {
//		EntityManagerFactory emf = Persistence.createEntityManagerFactory("RentAFriend");
//		EntityManager em = emf.createEntityManager();
//
//		EventDAO dao = new EventDAO();
//		Event event = new Event();
////
////
////======Create Test============================
//		Date date = new Date();
////		event.setDateTime(date);
//		User user = new User();
//		event.setActivity("Drinking");
//		event.setOwnerId(em.find(User.class, 1));
//		Address add = new Address();
//		add = em.find(Address.class, 1);
//		event.setAddress(add);
//		dao.create(event);
////==============================================
//
////		=======Delete======================
////		System.out.println(dao.delete(3));
////		===================================
//
//
//		em.close();
//		emf.close();
////		System.out.println(user.getUserName());
//	}
//}
