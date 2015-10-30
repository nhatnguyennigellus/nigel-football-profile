package nigel.footballprofile.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

/**
 * Entity class for City
 * 
 * @author Nigellus
 *
 * Oct 24, 2015 6:34:22 AM
 */
@Entity
@Table(name = "cities")
public class City extends SpecialEntity {
	@Id
	@Column(name = "id")
	@Length(max = 5)
	private String cityId;
	
	@NotEmpty
	private String name;
	
	@ManyToOne
	@JoinColumn(name = "countryId")
	private Country country;
	
	@OneToMany(mappedBy = "city")
	private Set<Stadium> stadiums = new HashSet<Stadium>();
	
	public City() {
		// TODO Auto-generated constructor stub
	}

	public String getCityId() {
		return cityId;
	}

	public void setCityId(String cityId) {
		this.cityId = cityId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Country getCountry() {
		return country;
	}

	public void setCountry(Country country) {
		this.country = country;
	}
	
	@Override
	public String getId() {
		return this.cityId;
	}
}
