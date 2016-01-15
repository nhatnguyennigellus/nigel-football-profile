package nigel.footballprofile.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;

/**
 * 
 * @author Nigellus
 *
 * Jan 11, 2016 8:15:32 PM
 */
@Entity
@Table(name="items")
public class Item {
	@Id
	@GeneratedValue
	private Integer id;
	
	@NotEmpty
	private String item;
	
	@NotEmpty
	private String description;
	
	@NotEmpty
	private String language;
	
	@NotEmpty
	private String type;
	
	public Item() {
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

}
