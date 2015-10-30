package nigel.footballprofile.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import nigel.footballprofile.entity.WorkLog;

import org.springframework.stereotype.Repository;
import org.springframework.test.context.transaction.TransactionConfiguration;

/**
 * DAO class for Work Log
 * 
 * @author Nigellus
 *
 *         Oct 24, 2015 12:38:35 PM
 */
@Repository("workLogDAO")
@Transactional
public class WorkLogDAO {
	@PersistenceContext
	private EntityManager em;

	public WorkLogDAO() {
	}

	/**
	 * 
	 * @return
	 *
	 *         Oct 24, 2015 12:39:02 PM
	 * @author Nigellus
	 */
	public List<WorkLog> getList() {
		List<WorkLog> list = null;

		try {
			TypedQuery<WorkLog> query = em.createQuery(
					"SELECT w FROM WorkLog w", WorkLog.class);
			list = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 
	 * @param log
	 * @return
	 *
	 *         Oct 24, 2015 12:40:03 PM
	 * @author Nigellus
	 */
	public boolean add(WorkLog log) {
		try {
			em.persist(log);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	/**
	 * 
	 * @param log
	 * @return
	 *
	 *         Oct 24, 2015 12:42:16 PM
	 * @author Nigellus
	 */
	public boolean update(WorkLog log) {
		try {
			em.merge(log);
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
	 *         Oct 24, 2015 12:42:20 PM
	 * @author Nigellus
	 */
	public WorkLog getById(Integer id) {
		WorkLog log = null;
		try {
			TypedQuery<WorkLog> query = em.createQuery(
					"SELECT w FROM WorkLog w WHERE id = ?1", WorkLog.class);
			query.setParameter(1, id);
			log = query.getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return log;
	}

	/**
	 * Get work log by type
	 * 
	 * @param type
	 * @return
	 *
	 *         Oct 24, 2015 12:42:22 PM
	 * @author Nigellus
	 */
	public List<WorkLog> getByType(String type) {
		List<WorkLog> list = null;
		try {
			TypedQuery<WorkLog> query = em.createQuery(
					"SELECT w FROM WorkLog w WHERE w.logType = ?1",
					WorkLog.class);
			query.setParameter(1, type);
			list = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return list;
	}
}
