package nigel.footballprofile.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import nigel.footballprofile.entity.City;
import nigel.footballprofile.entity.Country;

import org.springframework.stereotype.Repository;
import org.springframework.test.context.transaction.TransactionConfiguration;

/**
 * DAO class for City
 * 
 * @author Nigellus
 *
 *         Oct 24, 2015 11:20:19 AM
 */
@Repository("cityDAO")
@Transactional
public class CityDAO  {
	@PersistenceContext
	private EntityManager em;

	public CityDAO() {
	}

	/**
	 * 
	 * @return list of cities
	 *
	 *         Oct 24, 2015 11:23:26 AM
	 * @author Nigellus
	 */
	public List<City> getList() {
		List<City> list = null;

		try {
			TypedQuery<City> query = em.createQuery("SELECT c FROM City c",
					City.class);
			list = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 
	 * @param city
	 * @return
	 *
	 *         Oct 24, 2015 11:28:34 AM
	 * @author Nigellus
	 */
	public boolean add(City city) {
		try {
			em.persist(city);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	/**
	 * 
	 * @param city
	 * @return
	 *
	 *         Oct 24, 2015 11:29:12 AM
	 * @author Nigellus
	 */
	public boolean update(City city) {
		try {
			em.merge(city);
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
	 *         Oct 24, 2015 11:24:26 AM
	 * @author Nigellus
	 */
	public City getById(String id) {
		City city = null;
		try {
			TypedQuery<City> query = em.createQuery(
					"SELECT c FROM City c WHERE id = ?1", City.class);
			query.setParameter(1, id);
			city = query.getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return city;
	}

	/**
	 * 
	 * @param name
	 * @return
	 *
	 * Oct 30, 2015 8:21:36 PM
	 * @author Nigellus
	 */
	public List<City> getByName(String name) {
		List<City> city = null;
		try {
			TypedQuery<City> query = em.createQuery(
					"SELECT c FROM City c WHERE c.name LIKE ?1", 
					City.class);
			query.setParameter(1, "'%" + name + "%'");
			city = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return city;
	}
}
