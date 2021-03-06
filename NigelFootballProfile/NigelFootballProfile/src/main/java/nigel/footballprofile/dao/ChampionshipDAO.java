package nigel.footballprofile.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.transaction.NotSupportedException;
import javax.transaction.Transactional;

import nigel.footballprofile.entity.Championship;

import org.springframework.stereotype.Repository;
import org.springframework.test.context.transaction.TransactionConfiguration;

/**
 * DAO class for Championship
 * 
 * @author Nigellus
 *
 *         Oct 24, 2015 12:46:38 PM
 */
@Repository("championshipDAO")
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback=false)
@Transactional
public class ChampionshipDAO {
	@PersistenceContext
	private EntityManager em;

	public ChampionshipDAO() {
	}

	/**
	 * 
	 * @return
	 *
	 *         Oct 24, 2015 12:49:07 PM
	 * @author Nigellus
	 */
	public List<Championship> getList() {
		List<Championship> list = null;

		try {
			TypedQuery<Championship> query = em.createQuery(
					"SELECT c FROM Championship c", Championship.class);
			list = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 
	 * @param champ
	 * @return
	 *
	 * Oct 24, 2015 12:55:04 PM
	 * @author Nigellus
	 */
	public boolean add(Championship champ) {
		try {
			em.persist(champ);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	/**
	 * 
	 * @param champ
	 * @return
	 *
	 * Oct 24, 2015 12:55:01 PM
	 * @author Nigellus
	 */
	public boolean update(Championship champ) {
		try {
			em.merge(champ);
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
	 * Oct 24, 2015 12:54:58 PM
	 * @author Nigellus
	 */
	public Championship getById(Integer id) {
		Championship champ = null;
		try {
			TypedQuery<Championship> query = em.createQuery(
					"SELECT c FROM Championship c WHERE id = ?1", 
					Championship.class);
			query.setParameter(1, id);
			champ = query.getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return champ;
	}

	/**
	 * Get championship list by short name
	 * 
	 * @return
	 *
	 * Oct 24, 2015 12:54:24 PM
	 * @author Nigellus
	 */
	public Championship getChampByShortName(String shortName) {
		Championship champ = null;

		try {
			TypedQuery<Championship> query = em.createQuery(
					"SELECT c FROM Championship c WHERE c.shortName = ?1", Championship.class);
			query.setParameter(1, shortName);
			champ = query.getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return champ;
	}

	/**
	 * 
	 * @param name
	 * @return
	 *
	 * Nov 11, 2015 7:52:43 PM
	 * @author Nigellus
	 */
	public Championship getChampByName(String name) {
		Championship champ = null;

		try {
			TypedQuery<Championship> query = em.createQuery(
					"SELECT c FROM Championship c WHERE c.fullName = ?1", Championship.class);
			query.setParameter(1, name);
			champ = query.getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return champ;
	}
}
