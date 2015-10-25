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
	
	@NotEmpty
	private Integer capacity;
	
	@ManyToOne
	@JoinColumn(name = "cityId")
	private City city;
	
	@OneToMany(mappedBy = "stadium")
	private Set<Match> matches = new HashSet<Match>();
	
	@OneToMany(mappedBy = "stadium")
	private Set<Team> teams = new HashSet<Team>();
	
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
	
	
}
