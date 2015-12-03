package nigel.footballprofile.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import nigel.footballprofile.entity.TeamPlayer;

import org.springframework.stereotype.Repository;
import org.springframework.test.context.transaction.TransactionConfiguration;

/**
 * DAO class for Team & Player relational table
 * 
 * @author Nigellus
 *
 *         Oct 24, 2015 1:14:18 PM
 */
@Repository("teamPlayerDAO")
@Transactional
public class TeamPlayerDAO  {
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
					"SELECT tp FROM TeamPlayer tp WHERE tp.status = 1", TeamPlayer.class);
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
					"SELECT tp FROM TeamPlayer tp WHERE id = ?1 and tp.status = 1", 
					TeamPlayer.class);
			query.setParameter(1, id);
			log = query.getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return log;
	}

	/**
	 * 
	 * @param teamId
	 * @return
	 *
	 * Nov 29, 2015 1:35:31 PM
	 * @author Nigellus
	 */
	public List<TeamPlayer> getByTeam(String teamId) {
		List<TeamPlayer> list = null;

		try {
			TypedQuery<TeamPlayer> query = em.createQuery(
					"SELECT tp FROM TeamPlayer tp where tp.team.teamId = ?1 and tp.status = 1", 
					TeamPlayer.class);
			query.setParameter(1, teamId);
			list = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 
	 * @param playerId
	 * @return
	 *
	 * Nov 29, 2015 1:36:10 PM
	 * @author Nigellus
	 */
	public List<TeamPlayer> getByPlayer(String playerId) {
		List<TeamPlayer> list = null;

		try {
			TypedQuery<TeamPlayer> query = em.createQuery(
					"SELECT tp FROM TeamPlayer tp where tp.player.playerId = ?1 and tp.status = 1", 
					TeamPlayer.class);
			query.setParameter(1, playerId);
			list = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
