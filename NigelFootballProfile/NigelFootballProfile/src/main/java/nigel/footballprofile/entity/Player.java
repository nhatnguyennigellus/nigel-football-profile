package nigel.footballprofile.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import nigel.footballprofile.service.DateUtil;

import org.hibernate.validator.constraints.NotEmpty;

/**
 * Entity class for Player
 * 
 * @author Nigellus
 *
 * Oct 24, 2015 6:34:09 AM
 */
@Entity
@Table(name = "players")
public class Player {
	@Id
	@Column(name = "id")
	private String playerId;

	private String firstName;

	@NotEmpty
	private String lastName;
	
	@NotEmpty
	private String position;

	@NotNull
	private Date birthdate;

	private Integer weight;

	private Integer height;

	@OneToMany(mappedBy = "player", fetch = FetchType.EAGER)
	private Set<TeamPlayer> teamplayers = new HashSet<TeamPlayer>();
	
	
	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "playernationality", joinColumns = { @JoinColumn(name = "playerId") }, inverseJoinColumns = { @JoinColumn(name = "nationalityId") })
	private Set<Country> nationalities = new HashSet<Country>(0);
	
	@OneToMany(mappedBy = "player")
	private Set<Scorer> scorers = new HashSet<Scorer>();
	
	public Player() {
	}

	public String getPlayerId() {
		return playerId;
	}

	public void setPlayerId(String playerId) {
		this.playerId = playerId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public Date getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(Date birthdate) {
		this.birthdate = birthdate;
	}

	public Integer getWeight() {
		return weight;
	}

	public void setWeight(Integer weight) {
		this.weight = weight;
	}

	public Integer getHeight() {
		return height;
	}

	public void setHeight(Integer height) {
		this.height = height;
	}

	public Set<TeamPlayer> getTeamplayers() {
		return teamplayers;
	}

	public void setTeamplayers(Set<TeamPlayer> teamplayers) {
		this.teamplayers = teamplayers;
	}

	public Set<Country> getNationalities() {
		return nationalities;
	}

	public void setNationalities(Set<Country> nationalities) {
		this.nationalities = nationalities;
	}

	public Set<Scorer> getScorers() {
		return scorers;
	}

	public void setScorers(Set<Scorer> scorers) {
		this.scorers = scorers;
	}
	
	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}
	
	@Override
	public String toString() {
		return playerId + "," + firstName + " " + lastName + ", " 
				+ DateUtil.dateToShortString(birthdate) + ", " + 
				position + ", " + weight + ", " + height;
	}
}
