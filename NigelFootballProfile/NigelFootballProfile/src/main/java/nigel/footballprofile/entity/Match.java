package nigel.footballprofile.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

/**
 * Entity class for Match
 * 
 * @author Nigellus
 *
 * Oct 24, 2015 6:33:57 AM
 */
@Entity
@Table(name = "matches")
public class Match {
	@Id
	@Length(max = 8)
	private String matchId;
	
	@NotNull
	private Date dateTime;
	
	@NotNull
	private boolean isPlayed;
	
	@NotEmpty
	private String round;
	
	@NotNull
	private Integer goalA;
	
	@NotNull
	private Integer goalB;
	
	private Integer aggA;
	
	private Integer aggB;
	
	@ManyToOne
	@JoinColumn(name = "stadiumId")
	private Stadium stadium;
	
	@ManyToOne
	@JoinColumn(name = "champId")
	private Championship championship;
	
	@OneToMany(mappedBy = "match", fetch = FetchType.EAGER)
	private Set<MatchTeam> matchTeams = new HashSet<MatchTeam>();
	
	@OneToMany(mappedBy = "match", fetch = FetchType.EAGER)
	private Set<Scorer> scorers = new HashSet<Scorer>();
	
	public Match() {
		// TODO Auto-generated constructor stub
	}

	public String getMatchId() {
		return matchId;
	}

	public void setMatchId(String matchId) {
		this.matchId = matchId;
	}

	public Date getDateTime() {
		return dateTime;
	}

	public void setDateTime(Date dateTime) {
		this.dateTime = dateTime;
	}

	public boolean isPlayed() {
		return isPlayed;
	}

	public void setPlayed(boolean isPlayed) {
		this.isPlayed = isPlayed;
	}

	public String getRound() {
		return round;
	}

	public void setRound(String round) {
		this.round = round;
	}

	public Integer getGoalA() {
		return goalA;
	}

	public void setGoalA(Integer goalA) {
		this.goalA = goalA;
	}

	public Integer getGoalB() {
		return goalB;
	}

	public void setGoalB(Integer goalB) {
		this.goalB = goalB;
	}

	public Integer getAggA() {
		return aggA;
	}

	public void setAggA(Integer aggA) {
		this.aggA = aggA;
	}

	public Integer getAggB() {
		return aggB;
	}

	public void setAggB(Integer aggB) {
		this.aggB = aggB;
	}

	public Stadium getStadium() {
		return stadium;
	}

	public void setStadium(Stadium stadium) {
		this.stadium = stadium;
	}

	public Championship getChampionship() {
		return championship;
	}

	public void setChampionship(Championship championship) {
		this.championship = championship;
	}

	public Set<MatchTeam> getMatchTeams() {
		return matchTeams;
	}

	public void setMatchTeams(Set<MatchTeam> matchTeams) {
		this.matchTeams = matchTeams;
	}

	public Set<Scorer> getScorers() {
		return scorers;
	}

	public void setScorers(Set<Scorer> scorers) {
		this.scorers = scorers;
	}
	
	@Override
	public String toString() {
		return "[" + matchId + ", ]";
	}
}
