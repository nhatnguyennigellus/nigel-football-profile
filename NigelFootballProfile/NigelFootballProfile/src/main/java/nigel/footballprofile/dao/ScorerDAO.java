package nigel.footballprofile.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import nigel.footballprofile.entity.Scorer;

import org.springframework.stereotype.Repository;
import org.springframework.test.context.transaction.TransactionConfiguration;

/**
 * DAO class for Scorer
 * 
 * @author Nigellus
 *
 * Oct 24, 2015 1:54:28 PM
 */
@Repository("scorerDAO")
@Transactional
public class ScorerDAO {
	@PersistenceContext
	private EntityManager em;
	
	public ScorerDAO() {
	}

	/**
	 * 
	 * @return
	 *
	 * Oct 24, 2015 1:54:51 PM
	 * @author Nigellus
	 */
	public List<Scorer> getList() {
		List<Scorer> list = null;

		try {
			TypedQuery<Scorer> query = em.createQuery("SELECT s FROM Scorer s",
					Scorer.class);
			list = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 
	 * @param scorer
	 * @return
	 *
	 * Oct 24, 2015 1:55:50 PM
	 * @author Nigellus
	 */
	public boolean add(Scorer scorer) {
		try {
			em.persist(scorer);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	/**
	 * 
	 * @param scorer
	 * @return
	 *
	 * Oct 24, 2015 1:56:09 PM
	 * @author Nigellus
	 */
	public boolean update(Scorer scorer) {
		try {
			em.merge(scorer);
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
	 * Oct 24, 2015 1:57:15 PM
	 * @author Nigellus
	 */
	public Scorer getById(Integer id) {
		Scorer scorer = null;
		try {
			TypedQuery<Scorer> query = em.createQuery(
					"SELECT s FROM Scorer s WHERE id = ?1", 
					Scorer.class);
			query.setParameter(1, id);
			scorer = query.getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return scorer;
	}

	public List<Scorer> getByType(Integer u) {
		return null;
	}
	
	
}
