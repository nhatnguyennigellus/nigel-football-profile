package nigel.footballprofile.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

/**
 * 
 * Entity class for Standing Data
 * 
 * @author Nigellus
 *
 * Oct 24, 2015 6:35:02 AM
 */
@Entity
@Table(name = "standingsdata")
public class StandingsData {
	@Id
	@GeneratedValue
	private Integer id;
	
	@NotEmpty
	@Column(name = "groupName")
	private String group;
	
	@NotNull
	private Integer rank;
	
	@NotNull
	private Integer played;
	
	@NotNull
	private Integer win;
	
	@NotNull
	private Integer loss;
	
	@NotNull
	private Integer draw;
	
	@NotNull
	@Column(name = "goalsFor")
	private Integer forGoals;
	
	@NotNull
	@Column(name = "goalsAgainst")
	private Integer againstGoals;
	
	@NotNull
	@Column(name = "goalsDiff")
	private Integer diffGoals;
	
	@NotNull
	private Integer points;
	
	@ManyToOne
	@JoinColumn(name = "champId")
	private Championship championship;
	
	@ManyToOne
	@JoinColumn(name = "teamId")
	private Team team;

	
	public StandingsData() {
		this.points = 0;
		this.played = 0;
		this.forGoals = 0;
		this.againstGoals = 0;
		this.diffGoals = 0;
		this.win= 0;
		this.loss = 0;
		this.draw = 0;
				
	}


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public String getGroup() {
		return group;
	}


	public void setGroup(String group) {
		this.group = group;
	}

	public Integer getRank() {
		return rank;
	}


	public void setRank(Integer rank) {
		this.rank = rank;
	}


	public Integer getPlayed() {
		return played;
	}


	public void setPlayed(Integer played) {
		this.played = played;
	}


	public Integer getWin() {
		return win;
	}


	public void setWin(Integer win) {
		this.win = win;
	}


	public Integer getLoss() {
		return loss;
	}


	public void setLoss(Integer loss) {
		this.loss = loss;
	}


	public Integer getDraw() {
		return draw;
	}


	public void setDraw(Integer draw) {
		this.draw = draw;
	}


	public Integer getForGoals() {
		return forGoals;
	}


	public void setForGoals(Integer forGoals) {
		this.forGoals = forGoals;
	}


	public Integer getAgainstGoals() {
		return againstGoals;
	}


	public void setAgainstGoals(Integer againstGoals) {
		this.againstGoals = againstGoals;
	}


	public Integer getDiffGoals() {
		return diffGoals;
	}


	public void setDiffGoals(Integer diffGoals) {
		this.diffGoals = diffGoals;
	}


	public Integer getPoints() {
		return points;
	}


	public void setPoints(Integer points) {
		this.points = points;
	}


	public Championship getChampionship() {
		return championship;
	}


	public void setChampionship(Championship championship) {
		this.championship = championship;
	}


	public Team getTeam() {
		return team;
	}


	public void setTeam(Team team) {
		this.team = team;
	}
	
	
}
