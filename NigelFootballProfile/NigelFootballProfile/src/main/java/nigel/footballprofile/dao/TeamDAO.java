package nigel.footballprofile.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import nigel.footballprofile.entity.Team;

import org.springframework.stereotype.Repository;
import org.springframework.test.context.transaction.TransactionConfiguration;

/**
 * DAO class for Team
 * 
 * @author Nigellus
 *
 * Oct 24, 2015 12:33:52 PM
 */
@Repository("teamDAO")
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback=false)
@Transactional
public class TeamDAO {
	@PersistenceContext
	private EntityManager em;
	
	public TeamDAO() {
	}
	
	/**
	 * 
	 * @return
	 *
	 * Oct 24, 2015 12:30:52 PM
	 * @author Nigellus
	 */
	public List<Team> getList() {
		List<Team> list = null;

		try {
			TypedQuery<Team> query = em.createQuery("SELECT t FROM Team t",
					Team.class);
			list = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 
	 * @param type
	 * @return
	 *
	 * Nov 27, 2015 11:47:47 PM
	 * @author Nigellus
	 */
	public List<Team> getTeamByType(String type) {
		List<Team> list = null;

		try {
			TypedQuery<Team> query = em.createQuery("SELECT t FROM Team t where t.teamType = ?1",
					Team.class);
			query.setParameter(1, type);
			list = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 
	 * @param team
	 * @return
	 *
	 * Oct 24, 2015 12:32:06 PM
	 * @author Nigellus
	 */
	public boolean add(Team team) {
		try {
			em.persist(team);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	/**
	 * 
	 * @param team
	 * @return
	 *
	 * Oct 24, 2015 12:32:18 PM
	 * @author Nigellus
	 */
	public boolean update(Team team) {
		try {
			em.merge(team);
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
	 * Oct 24, 2015 12:32:41 PM
	 * @author Nigellus
	 */
	public Team getById(String id) {
		Team team = null;
		try {
			TypedQuery<Team> query = em.createQuery(
					"SELECT t FROM Team t WHERE id = ?1", 
					Team.class);
			query.setParameter(1, id);
			team = query.getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return team;
	}

	public Team getByName(String name, String shortName) {
		Team team = null;
		try {
			TypedQuery<Team> query = em.createQuery(
					"SELECT t FROM Team t WHERE t.fullName = ?1 OR t.shortName = ?2", 
					Team.class);
			query.setParameter(1, name);
			query.setParameter(2, shortName);
			team = query.getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return team;
	}
	
	public boolean existedCoach(String coach) {
		try {
			TypedQuery<Team> query = em.createQuery(
					"SELECT t.coach FROM Team t WHERE t.coach = ?1", 
					Team.class);
			query.setParameter(1, coach);
			return query.getSingleResult() != null;
		} catch (Exception e) {
			e.printStackTrace();
			return true;
		}
	}
}
