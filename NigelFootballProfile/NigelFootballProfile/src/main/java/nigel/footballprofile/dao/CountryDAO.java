package nigel.footballprofile.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import org.springframework.transaction.annotation.Transactional;

import nigel.footballprofile.entity.Country;

import org.springframework.stereotype.Repository;
import org.springframework.test.context.transaction.TransactionConfiguration;

/**
 * DAO class for Country
 * 
 * @author Nigellus
 *
 *         Oct 24, 2015 11:12:45 AM
 */
@Repository("countryDAO")
@Transactional
public class CountryDAO  {
	@PersistenceContext
	private EntityManager em;

	public CountryDAO() {
	}

	/**
	 * 
	 * @return list of countries
	 *
	 *         Oct 24, 2015 11:16:50 AM
	 * @author Nigellus
	 */
	public List<Country> getList() {
		List<Country> list = null;

		try {
			TypedQuery<Country> query = em.createQuery(
					"SELECT l FROM Country l", Country.class);
			list = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 
	 * @param country
	 * @return
	 *
	 *         Oct 24, 2015 11:16:45 AM
	 * @author Nigellus
	 */
	public boolean add(Country country) {
		try {
			em.persist(country);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	/**
	 * 
	 * @param country
	 * @return
	 *
	 *         Oct 24, 2015 11:16:39 AM
	 * @author Nigellus
	 */
	public boolean update(Country country) {
		try {
			em.merge(country);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	/**
	 * 
	 * @param id
	 * @return country
	 *
	 *         Oct 24, 2015 11:16:48 AM
	 * @author Nigellus
	 */
	public Country getById(String id) {
		Country country = null;
		try {
			TypedQuery<Country> query = em.createQuery(
					"SELECT l FROM Country l WHERE id = ?1", 
					Country.class);
			query.setParameter(1, id);
			country = query.getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return country;
	}

	/**
	 * 
	 * @param u
	 * @return
	 *
	 * Oct 29, 2015 12:14:36 AM
	 * @author Nigellus
	 */
	public Country getByShortname(String shortName) {
		Country country = null;
		try {
			TypedQuery<Country> query = em.createQuery(
					"SELECT l FROM Country l WHERE l.shortName = ?1", 
					Country.class);
			query.setParameter(1, shortName);
			country = query.getSingleResult();
		} catch (Exception e) {
			return null;
		}
		return country;
	}
	
	/**
	 * 
	 * @param name
	 * @return
	 *
	 * Oct 30, 2015 8:20:15 PM
	 * @author Nigellus
	 */
	public Country getByName(String name) {
		Country country = null;
		try {
			TypedQuery<Country> query = em.createQuery(
					"SELECT l FROM Country l WHERE l.name = ?1", 
					Country.class);
			query.setParameter(1, name);
			country = query.getSingleResult();
		} catch (Exception e) {
			return null;
		}
		return country;
	}

}
