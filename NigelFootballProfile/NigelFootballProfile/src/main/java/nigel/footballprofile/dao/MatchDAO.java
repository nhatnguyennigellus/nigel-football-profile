package nigel.footballprofile.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import nigel.footballprofile.entity.Match;
import nigel.footballprofile.entity.WorkLog;

/**
 * DAO class for Match
 * 
 * @author Nigellus
 *
 * Oct 24, 2015 1:38:46 PM
 */
@Repository("matchDAO")
public class MatchDAO implements DAOInterface<Match, String> {

	@PersistenceContext
	private EntityManager em;

	public MatchDAO() {
	}

	/**
	 * 
	 * @return
	 *
	 * Oct 24, 2015 1:39:00 PM
	 * @author Nigellus
	 */
	public List<Match> getList() {
		List<Match> list = null;

		try {
			TypedQuery<Match> query = em.createQuery("SELECT m FROM Match m",
					Match.class);
			list = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 
	 * @param match
	 * @return
	 *
	 * Oct 24, 2015 1:39:46 PM
	 * @author Nigellus
	 */
	public boolean add(Match match) {
		try {
			em.persist(match);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	/**
	 * 
	 * @param match
	 * @return
	 *
	 * Oct 24, 2015 1:40:08 PM
	 * @author Nigellus
	 */
	public boolean update(Match match) {
		try {
			em.merge(match);
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
	 * Oct 24, 2015 1:43:08 PM
	 * @author Nigellus
	 */
	public Match getById(String id) {
		Match match = null;
		try {
			TypedQuery<Match> query = em.createQuery(
					"SELECT m FROM Match m WHERE id = ?1", 
					Match.class);
			query.setParameter(1, id);
			match = query.getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return match;
	}

}
