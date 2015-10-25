package nigel.footballprofile.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

/**
 * Inteface with generics for DAO classes
 * 
 * @author Nigellus
 *
 * @param <T>
 * @param <U>
 * Oct 24, 2015 11:00:34 AM
 */
@Repository
public interface DAOInterface<T, U> {
	List<T> getList();
	
	boolean add(T t);
	
	boolean update(T t);
	
	T getById(U u);
}
