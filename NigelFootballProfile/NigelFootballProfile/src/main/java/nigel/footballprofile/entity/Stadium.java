package nigel.footballprofile.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "stadiums")
public class Stadium {
	@Id
	@Column(name = "id")
	@Length(max = 5)
	private String stadiumId;

	@NotEmpty
	private String name;

	@NotEmpty
	private String uefaName;

	@NotNull
	private Integer capacity;

	@ManyToOne
	@JoinColumn(name = "cityId")
	private City city;

	@OneToMany(mappedBy = "stadium")
	private Set<Match> matches = new HashSet<Match>();

	@OneToMany(mappedBy = "stadium")
	private Set<Team> teams = new HashSet<Team>();

	@ManyToMany(mappedBy = "stadiums", cascade = CascadeType.ALL)
	private Set<Championship> championships = new HashSet<Championship>();
	
	public Stadium() {
		// TODO Auto-generated constructor stub
	}

	public String getStadiumId() {
		return stadiumId;
	}

	public void setStadiumId(String stadiumId) {
		this.stadiumId = stadiumId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUefaName() {
		return uefaName;
	}

	public void setUefaName(String uefaName) {
		this.uefaName = uefaName;
	}

	public Integer getCapacity() {
		return capacity;
	}

	public void setCapacity(Integer capacity) {
		this.capacity = capacity;
	}

	public City getCity() {
		return city;
	}

	public void setCity(City city) {
		this.city = city;
	}

	
	@Override
	public String toString() {
		return "[" + stadiumId + ", " + name + ", " + uefaName + ", "
				+ capacity + "," + city.getName() + ","
				+ city.getCountry().getName() + "]";
	}
}
