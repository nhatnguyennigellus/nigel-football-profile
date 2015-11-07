package nigel.footballprofile.entity;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

/**
 * Entity class for State
 * 
 * @author Nigellus
 *
 * Oct 24, 2015 6:29:58 AM
 */
@Entity
@Table(name = "state")
public class State {
	@Id
	@GeneratedValue
	private Integer stateId;
	
	@NotEmpty
	@Length(max = 5)
	private String statuz;
	

	@ManyToOne
	@JoinColumn(name = "champId")
	private Championship championship;
	
	@ManyToOne
	@JoinColumn(name = "teamId")
	private Team team;
	
	public String getStatuz() {
		return statuz;
	}

	public void setStatuz(String statuz) {
		this.statuz = statuz;
	}

	public Championship getChampionship() {
		return championship;
	}

	public void setChampionship(Championship championship) {
		this.championship = championship;
	}

	
	public State() {
		// TODO Auto-generated constructor stub
	}

	public Integer getStateId() {
		return stateId;
	}

	public void setStateId(Integer stateId) {
		this.stateId = stateId;
	}

	public Team getTeam() {
		return team;
	}

	public void setTeam(Team team) {
		this.team = team;
	}
	
}
