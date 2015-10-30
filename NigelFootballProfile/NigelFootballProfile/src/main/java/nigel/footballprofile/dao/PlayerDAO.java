package nigel.footballprofile.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import nigel.footballprofile.entity.Player;

import org.springframework.stereotype.Repository;
import org.springframework.test.context.transaction.TransactionConfiguration;

/**
 * DAO class for Player
 * 
 * @author Nigellus
 *
 *         Oct 24, 2015 1:29:20 PM
 */
@Repository("playerDAO")
@Transactional
public class PlayerDAO  {
	@PersistenceContext
	private EntityManager em;

	public PlayerDAO() {
	}

	/**
	 * 
	 * @return
	 *
	 *         Oct 24, 2015 1:30:51 PM
	 * @author Nigellus
	 */
	public List<Player> getList() {
		List<Player> list = null;

		try {
			TypedQuery<Player> query = em.createQuery(
					"SELECT p FROM Player p", Player.class);
			list = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 
	 * @param player
	 * @return
	 *
	 * Oct 24, 2015 1:34:05 PM
	 * @author Nigellus
	 */
	public boolean add(Player player) {
		try {
			em.persist(player);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	/**
	 * 
	 * @param player
	 * @return
	 *
	 * Oct 24, 2015 1:34:52 PM
	 * @author Nigellus
	 */
	public boolean update(Player player) {
		try {
			em.merge(player);
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
	 * Oct 24, 2015 1:35:39 PM
	 * @author Nigellus
	 */
	public Player getById(String id) {
		Player player = null;
		try {
			TypedQuery<Player> query = em.createQuery(
					"SELECT p FROM Player p WHERE id = ?1", 
					Player.class);
			query.setParameter(1, id);
			player = query.getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return player;
	}

	public List<Player> getByType(String u) {
		return null;
	}

}
