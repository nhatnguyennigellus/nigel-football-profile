package nigel.footballprofile.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

/**
 * Entity class for Team
 * 
 * @author Nigellus
 *
 * Oct 24, 2015 6:29:28 AM
 */

@Entity
@Table(name = "teams")
public class Team {
	@Id
	@Column(name = "id")
	@Length(max = 7)
	private String teamId;
	
	@NotEmpty
	private String fullName;
	
	@NotEmpty
	private String shortName;
	
	@NotEmpty
	private String coach;
	
	@NotEmpty
	private String logoUrl;
	
	@OneToMany(mappedBy = "team")
	private Set<TeamPlayer> teamplayers = new HashSet<TeamPlayer>();
	
	@OneToMany(mappedBy = "team")
	private Set<StandingsData> standingdatas = new HashSet<StandingsData>();
	
	@OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@PrimaryKeyJoinColumn
	private State state;
	
	@OneToMany(mappedBy = "team")
	private Set<MatchTeam> matchTeams = new HashSet<MatchTeam>();
	
	@ManyToOne
	@JoinColumn(name = "stadiumId")
	private Stadium stadium;
	
	public Team() {
		// TODO Auto-generated constructor stub
	}

	public String getTeamId() {
		return teamId;
	}

	public void setTeamId(String teamId) {
		this.teamId = teamId;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getShortName() {
		return shortName;
	}

	public void setShortName(String shortName) {
		this.shortName = shortName;
	}

	public String getCoach() {
		return coach;
	}

	public void setCoach(String coach) {
		this.coach = coach;
	}

	public Set<TeamPlayer> getTeamplayers() {
		return teamplayers;
	}

	public void setTeamplayers(Set<TeamPlayer> teamplayers) {
		this.teamplayers = teamplayers;
	}

	public State getState() {
		return state;
	}

	public void setState(State state) {
		this.state = state;
	}

	public Set<StandingsData> getStandingdatas() {
		return standingdatas;
	}

	public void setStandingdatas(Set<StandingsData> standingdatas) {
		this.standingdatas = standingdatas;
	}

	public Set<MatchTeam> getMatchTeams() {
		return matchTeams;
	}

	public void setMatchTeams(Set<MatchTeam> matchTeams) {
		this.matchTeams = matchTeams;
	}

	public Stadium getStadium() {
		return stadium;
	}

	public void setStadium(Stadium stadium) {
		this.stadium = stadium;
	}

	public String getLogoUrl() {
		return logoUrl;
	}

	public void setLogoUrl(String logoUrl) {
		this.logoUrl = logoUrl;
	}
	
}