package nigel.footballprofile.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import nigel.footballprofile.entity.Stadium;

import org.springframework.stereotype.Repository;
import org.springframework.test.context.transaction.TransactionConfiguration;

/**
 * DAO class for Stadium
 * 
 * @author Nigellus
 *
 * Oct 24, 2015 11:49:24 AM
 */
@Repository("stadiumDAO")
@Transactional
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback=false)
public class StadiumDAO {
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

	/**
	 * 
	 * @param name
	 * @param uefaName
	 * @return
	 *
	 * Nov 5, 2015 7:45:45 AM
	 * @author Nigellus
	 */
	public Stadium getByName(String name, String uefaName) {
		Stadium stadium = null;
		try {
			TypedQuery<Stadium> query = em.createQuery(
					"SELECT s FROM Stadium s WHERE s.name = ?1 OR s.uefaName = ?2", 
					Stadium.class);
			query.setParameter(1, name);
			query.setParameter(2, uefaName);
			stadium = (query.getSingleResult() == null) ? null : 
				query.getSingleResult() ;
		} catch (Exception e) {
			return null;
		}
		return stadium;
	}

}
