package nigel.footballprofile.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import nigel.footballprofile.entity.Stadium;

import org.springframework.stereotype.Repository;

/**
 * DAO class for Stadium
 * 
 * @author Nigellus
 *
 * Oct 24, 2015 11:49:24 AM
 */
@Repository("stadiumDAO")
public class StadiumDAO implements DAOInterface<Stadium, String> {
	@PersistenceContext
	private EntityManager em;
	
	public StadiumDAO() {
	}

	/**
	 * Get list of stadium
	 * 
	 * @return
	 *
	 * Oct 24, 2015 12:20:41 PM
	 * @author Nigellus
	 */
	public List<Stadium> getList() {
		List<Stadium> list = null;

		try {
			TypedQuery<Stadium> query = em.createQuery("SELECT s FROM Stadium s",
					Stadium.class);
			list = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 
	 * @param stadium
	 * @return
	 *
	 * Oct 24, 2015 12:20:59 PM
	 * @author Nigellus
	 */
	public boolean add(Stadium stadium) {
		try {
			em.persist(stadium);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	/**
	 * 
	 * @param stadium
	 * @return
	 *
	 * Oct 24, 2015 12:21:08 PM
	 * @author Nigellus
	 */
	public boolean update(Stadium stadium) {
		try {
			em.merge(stadium);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	/**
	 * 
	 * @param id
	 * @return
	 *
	 * Oct 24, 2015 12:21:11 PM
	 * @author Nigellus
	 */
	public Stadium getById(String id) {
		Stadium stadium = null;
		try {
			TypedQuery<Stadium> query = em.createQuery(
					"SELECT s FROM Stadium s WHERE id = ?1", Stadium.class);
			query.setParameter(1, id);
			stadium = query.getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return stadium;
	}

}
