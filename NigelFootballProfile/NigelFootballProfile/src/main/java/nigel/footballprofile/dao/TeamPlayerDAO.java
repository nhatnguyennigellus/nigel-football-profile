package nigel.footballprofile.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import nigel.footballprofile.entity.TeamPlayer;

import org.springframework.stereotype.Repository;

/**
 * DAO class for Team & Player relational table
 * 
 * @author Nigellus
 *
 *         Oct 24, 2015 1:14:18 PM
 */
@Repository("teamPlayerDAO")
public class TeamPlayerDAO implements DAOInterface<TeamPlayer, Integer> {
	@PersistenceContext
	private EntityManager em;
	
	public TeamPlayerDAO() {
	}

	/**
	 * 
	 * @return
	 *
	 *         Oct 24, 2015 1:16:56 PM
	 * @author Nigellus
	 */
	public List<TeamPlayer> getList() {
		List<TeamPlayer> list = null;

		try {
			TypedQuery<TeamPlayer> query = em.createQuery(
					"SELECT tp FROM TeamPlayer tp", TeamPlayer.class);
			list = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 
	 * @param tp
	 * @return
	 *
	 * Oct 24, 2015 1:24:39 PM
	 * @author Nigellus
	 */
	public boolean add(TeamPlayer tp) {
		try {
			em.persist(tp);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	/**
	 * 
	 * @param tp
	 * @return
	 *
	 * Oct 24, 2015 1:25:22 PM
	 * @author Nigellus
	 */
	public boolean update(TeamPlayer tp) {
		try {
			em.merge(tp);
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
	 * Oct 24, 2015 1:25:58 PM
	 * @author Nigellus
	 */
	public TeamPlayer getById(Integer id) {
		TeamPlayer log = null;
		try {
			TypedQuery<TeamPlayer> query = em.createQuery(
					"SELECT tp FROM TeamPlayer tp WHERE id = ?1", 
					TeamPlayer.class);
			query.setParameter(1, id);
			log = query.getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return log;
	}

}
