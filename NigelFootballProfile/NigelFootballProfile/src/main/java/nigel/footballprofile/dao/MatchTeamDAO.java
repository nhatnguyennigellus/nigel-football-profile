package nigel.footballprofile.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import nigel.footballprofile.entity.Match;
import nigel.footballprofile.entity.MatchTeam;

import org.springframework.stereotype.Repository;

/**
 * DAO class for Match Team
 * 
 * @author Nigellus
 *
 * Oct 24, 2015 1:42:25 PM
 */
@Repository("matchTeamDAO")
@Transactional
public class MatchTeamDAO {
	@PersistenceContext
	private EntityManager em;

	public MatchTeamDAO() {
	}

	/**
	 * 
	 * @return
	 *
	 * Oct 24, 2015 1:45:01 PM
	 * @author Nigellus
	 */
	public List<MatchTeam> getList() {
		List<MatchTeam> list = null;

		try {
			TypedQuery<MatchTeam> query = em.createQuery("SELECT m FROM MatchTeam m",
					MatchTeam.class);
			list = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 
	 * @param matchTeam
	 * @return
	 *
	 * Oct 24, 2015 1:45:03 PM
	 * @author Nigellus
	 */
	public boolean add(MatchTeam matchTeam) {
		try {
			em.persist(matchTeam);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	/**
	 * 
	 * @param t
	 * @return
	 *
	 * Oct 24, 2015 1:45:24 PM
	 * @author Nigellus
	 */
	public boolean update(MatchTeam matchTeam) {
		try {
			em.merge(matchTeam);
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
	 * Oct 24, 2015 1:45:41 PM
	 * @author Nigellus
	 */
	public MatchTeam getById(Integer id) {
		MatchTeam matchTeam = null;
		try {
			TypedQuery<MatchTeam> query = em.createQuery(
					"SELECT m FROM MatchTeam m WHERE id = ?1", 
					MatchTeam.class);
			query.setParameter(1, id);
			matchTeam = query.getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return matchTeam;
	}

	public MatchTeam getBySide(String side, Match match) {
		MatchTeam matchTeam = null;
		try {
			TypedQuery<MatchTeam> query = em.createQuery(
					"SELECT m FROM MatchTeam m WHERE m.match.matchId = ?1 AND m.side = ?2", 
					MatchTeam.class);
			query.setParameter(2, side);
			query.setParameter(1, match.getMatchId());
			matchTeam = query.getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return matchTeam;
	}
	
	
}
