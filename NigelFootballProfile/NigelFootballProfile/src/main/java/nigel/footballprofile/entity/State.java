package nigel.footballprofile.entity;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
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
	@Length(max = 3)
	private String cupState;
	
	@NotEmpty
	@Length(max = 3)
	private String tourState;
	
	@NotEmpty
	@Length(max = 5)
	private String leagueState;
	
	@OneToOne(fetch = FetchType.LAZY, mappedBy = "state")
	@PrimaryKeyJoinColumn
	private Team team;
	
	public State() {
		// TODO Auto-generated constructor stub
	}

	public Integer getStateId() {
		return stateId;
	}

	public void setStateId(Integer stateId) {
		this.stateId = stateId;
	}

	public String getCupState() {
		return cupState;
	}

	public void setCupState(String cupState) {
		this.cupState = cupState;
	}

	public String getTourState() {
		return tourState;
	}

	public void setTourState(String tourState) {
		this.tourState = tourState;
	}

	public String getLeagueState() {
		return leagueState;
	}

	public void setLeagueState(String leagueState) {
		this.leagueState = leagueState;
	}

	public Team getTeam() {
		return team;
	}

	public void setTeam(Team team) {
		this.team = team;
	}
	
	
}
