package nigel.footballprofile.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import nigel.footballprofile.entity.StandingsData;
import nigel.footballprofile.entity.Team;

import org.springframework.stereotype.Repository;
import org.springframework.test.context.transaction.TransactionConfiguration;

/**
 * DAO class for Standing
 * 
 * @author Nigellus
 *
 * Oct 24, 2015 9:20:33 PM
 */
@Repository("standingDAO")
@Transactional
public class StandingDAO{
	@PersistenceContext
	private EntityManager em;
	
	public StandingDAO() {
	}

	public List<StandingsData> getList() {
		return null;
	}
	
	/**
	 * Get championship's standings
	 * 
	 * @param champShortName
	 * @return
	 *
	 * Oct 24, 2015 9:26:37 PM
	 * @author Nigellus
	 */
	public List<StandingsData> getStandingByChampionship(String champShortName) {
		List<StandingsData> list = null;

		try {
			TypedQuery<StandingsData> query = em.createQuery(
					"SELECT s FROM StandingsData s WHERE s.championship.shortName = ?1", 
					StandingsData.class);
			query.setParameter(1, champShortName);
			list = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 
	 * @param data
	 * @return
	 *
	 * Oct 24, 2015 9:27:02 PM
	 * @author Nigellus
	 */
	public boolean add(StandingsData data) {
		try {
			em.persist(data);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	/**
	 * 
	 * @param data
	 * @return
	 *
	 * Oct 24, 2015 9:27:58 PM
	 * @author Nigellus
	 */
	public boolean update(StandingsData data) {
		try {
			em.merge(data);
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
	 * Oct 24, 2015 9:34:51 PM
	 * @author Nigellus
	 */
	public StandingsData getById(Integer id) {
		StandingsData data = null;
		try {
			TypedQuery<StandingsData> query = em.createQuery(
					"SELECT s FROM StandingsData s WHERE id = ?1", 
					StandingsData.class);
			query.setParameter(1, id);
			data = query.getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return data;
	}
	
	/**
	 * 
	 * @param team
	 * @param champShortName
	 * @return
	 *
	 * Oct 24, 2015 9:34:58 PM
	 * @author Nigellus
	 */
	public StandingsData getByTeam(Team team, String champShortName) {
		StandingsData data = null;
		try {
			TypedQuery<StandingsData> query = em.createQuery(
					"SELECT s FROM StandingsData s WHERE s.team.teamId = ?1 AND s.championship.shortName = ?1", 
					StandingsData.class);
			query.setParameter(1, team.getTeamId());
			query.setParameter(2, champShortName);
			data = query.getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return data;
	}

	/**
	 * 
	 * @param champShortName
	 * @param group
	 * @return
	 *
	 * @author Nigellus
	 */
	public List<StandingsData> getByGroup(String champShortName, String group) {
		List<StandingsData> data = null;
		try {
			TypedQuery<StandingsData> query = em.createQuery(
					"SELECT s FROM StandingsData s WHERE s.group = ?1 AND s.championship.shortName = ?1", 
					StandingsData.class);
			query.setParameter(1, group);
			query.setParameter(2, champShortName);
			data = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return data;
	}
	
}
