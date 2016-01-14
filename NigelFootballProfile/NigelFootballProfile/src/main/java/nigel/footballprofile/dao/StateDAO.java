package nigel.footballprofile.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import nigel.footballprofile.entity.Championship;
import nigel.footballprofile.entity.State;
import nigel.footballprofile.entity.Team;

import org.springframework.stereotype.Repository;
import org.springframework.test.context.transaction.TransactionConfiguration;

/**
 * DAO class for State
 * 
 * @author Nigellus
 *
 * Oct 24, 2015 1:00:20 PM
 */
@Repository("stateDAO")
@Transactional
public class StateDAO {
	@PersistenceContext
	private EntityManager em;
	
	public StateDAO() {
	}
	
	/**
	 * 
	 * @return
	 *
	 * Oct 24, 2015 1:00:47 PM
	 * @author Nigellus
	 */
	public List<State> getList() {
		List<State> list = null;

		try {
			TypedQuery<State> query = em.createQuery("SELECT s FROM State s",
					State.class);
			list = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 
	 * @param state
	 * @return
	 *
	 * Oct 24, 2015 1:01:40 PM
	 * @author Nigellus
	 */
	public boolean add(State state) {
		try {
			em.persist(state);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	/**
	 * 
	 * @param state
	 * @return
	 *
	 * Oct 24, 2015 1:01:59 PM
	 * @author Nigellus
	 */
	public boolean update(State state) {
		try {
			em.merge(state);
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
	 * Oct 24, 2015 1:02:01 PM
	 * @author Nigellus
	 */
	public State getById(Integer id) {
		State state = null;
		try {
			TypedQuery<State> query = em.createQuery(
					"SELECT s FROM State s WHERE id = ?1", 
					State.class);
			query.setParameter(1, id);
			state = query.getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return state;
	}

	/**
	 * Get list of states by team
	 * 
	 * @param team
	 * @return
	 *
	 * Oct 24, 2015 1:07:14 PM
	 * @author Nigellus
	 */
	public List<State> getListByTeam(Team team) {
		List<State> state = null;
		try {
			TypedQuery<State> query = em.createQuery(
					"SELECT s FROM State s WHERE s.team.teamId = ?1", 
					State.class);
			query.setParameter(1, team.getTeamId());
			state = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return state;
	}

	/**
	 * 
	 * @param champ
	 * @return
	 *
	 * Jan 13, 2016 9:24:10 PM
	 * @author Nigellus
	 */
	public List<State> getListByChamp(Championship champ) {
		List<State> state = null;
		try {
			TypedQuery<State> query = em.createQuery(
					"SELECT s FROM State s WHERE s.championship.champId = ?1", 
					State.class);
			query.setParameter(1, champ.getChampId());
			state = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return state;
	}
}
