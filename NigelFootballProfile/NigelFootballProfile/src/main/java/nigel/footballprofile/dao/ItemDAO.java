package nigel.footballprofile.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import nigel.footballprofile.entity.Item;
import nigel.footballprofile.entity.Item;

import org.springframework.stereotype.Repository;

/**
 * 
 * @author Nigellus
 *
 * Jan 11, 2016 8:22:18 PM
 */
@Repository("itemDAO")
@Transactional
public class ItemDAO {
	@PersistenceContext
	private EntityManager em;
	
	public ItemDAO() {
	}
	
	
	/**
	 * 
	 * @return
	 *
	 * Jan 11, 2016 8:23:53 PM
	 * @author Nigellus
	 */
	public List<Item> getList(String lang) {
		List<Item> list = null;

		try {
			TypedQuery<Item> query = em.createQuery(
					"SELECT i FROM Item i WHERE i.language = ?1",
					Item.class);
			query.setParameter(1, lang);
			list = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 
	 * @return
	 *
	 * Jan 11, 2016 10:40:01 PM
	 * @author Nigellus
	 */
	public List<Item> getList() {
		List<Item> list = null;

		try {
			TypedQuery<Item> query = em.createQuery(
					"SELECT i FROM Item i",
					Item.class);
			list = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 
	 * @param item
	 * @return
	 *
	 * Jan 11, 2016 8:26:46 PM
	 * @author Nigellus
	 */
	public boolean add(Item item) {
		try {
			em.persist(item);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	/**
	 * 
	 * @param item
	 * @return
	 *
	 * Jan 11, 2016 8:26:48 PM
	 * @author Nigellus
	 */
	public boolean update(Item item) {
		try {
			em.merge(item);
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
	 * Jan 11, 2016 8:26:50 PM
	 * @author Nigellus
	 */
	public Item getById(int id) {
		Item item = null;
		try {
			TypedQuery<Item> query = em.createQuery(
					"SELECT c FROM Item c WHERE id = ?1", Item.class);
			query.setParameter(1, id);
			item = query.getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return item;
	}
	
	/**
	 * 
	 * @param item
	 * @return
	 *
	 * Jan 11, 2016 8:26:53 PM
	 * @author Nigellus
	 */
	public Item getByItem(String item, String lang) {
		Item items = null;
		try {
			TypedQuery<Item> query = em.createQuery(
					"SELECT c FROM Item c WHERE c.name = ?1 AND c.language = ?2", 
					Item.class);
			query.setParameter(1, item);
			query.setParameter(2, lang);
			items = query.getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return items;
	}
	
	public List<Item> getByType(String type, String lang) {
		List<Item> items = null;
		try {
			TypedQuery<Item> query = em.createQuery(
					"SELECT c FROM Item c WHERE c.type = ?1 AND c.language = ?2", 
					Item.class);
			query.setParameter(1, type);
			query.setParameter(2, lang);
			items = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return items;
	}
}
