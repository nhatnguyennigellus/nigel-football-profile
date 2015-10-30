package nigel.footballprofile.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

/**
 * Entity class for Country
 * 
 * @author Nigellus
 *
 * Oct 24, 2015 6:34:32 AM
 */
@Entity
@Table(name = "countries")
public class Country extends SpecialEntity {
	@Id
	@Column(name = "id")
	@Length(min = 0, max = 5, message="Length must be maximum 5")
	private String countryId;
	
	private String name;
	
	private String shortName;
	
	@OneToMany(mappedBy = "country")
	private Set<City> cities = new HashSet<City>();
	
	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "playernationality", joinColumns = { @JoinColumn(name = "nationalityId")} , 
		inverseJoinColumns = { @JoinColumn(name = "playerId")})
	private Set<Player> players = new HashSet<Player>();
	
	public Country() {
		// TODO Auto-generated constructor stub
	}

	public String getCountryId() {
		return countryId;
	}

	public void setCountryId(String countryId) {
		this.countryId = countryId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getShortName() {
		return shortName;
	}

	public void setShortName(String shortName) {
		this.shortName = shortName;
	}

	public Set<City> getCities() {
		return cities;
	}

	public void setCities(Set<City> cities) {
		this.cities = cities;
	}

	public Set<Player> getPlayers() {
		return players;
	}

	public void setPlayers(Set<Player> players) {
		this.players = players;
	}
	
	@Override
	public String getId() {
		return this.countryId;
	}
}
