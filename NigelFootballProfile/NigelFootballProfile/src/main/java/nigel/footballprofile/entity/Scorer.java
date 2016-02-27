package nigel.footballprofile.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

/**
 * Entity class for Scorer
 * 
 * @author Nigellus
 *
 * Oct 24, 2015 6:36:31 AM
 */
@Entity
@Table(name = "scorer")
public class Scorer {
	@Id
	@GeneratedValue
	private Integer id;
	
	@NotEmpty
	private String team;
	
	
	@NotNull
	private Integer time;
	
	@NotNull
	private Integer addedTime;
	
	@NotNull
	private boolean isOwnGoal;
	
	@NotNull
	private boolean isPenalty;
	
	@ManyToOne
	@JoinColumn(name = "playerId")
	private Player player;
	
	@ManyToOne
	@JoinColumn(name = "matchId")
	private Match match;
	
	public Scorer() {
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTeam() {
		return team;
	}

	public void setTeam(String team) {
		this.team = team;
	}

	public Integer getTime() {
		return time;
	}

	public void setTime(Integer time) {
		this.time = time;
	}

	public Integer getAddedTime() {
		return addedTime;
	}

	public void setAddedTime(Integer addedTime) {
		this.addedTime = addedTime;
	}

	public boolean isOwnGoal() {
		return isOwnGoal;
	}

	public void setOwnGoal(boolean isOwnGoal) {
		this.isOwnGoal = isOwnGoal;
	}

	public boolean isPenalty() {
		return isPenalty;
	}

	public void setPenalty(boolean isPenalty) {
		this.isPenalty = isPenalty;
	}

	public Player getPlayer() {
		return player;
	}

	public void setPlayer(Player player) {
		this.player = player;
	}

	public Match getMatch() {
		return match;
	}

	public void setMatch(Match match) {
		this.match = match;
	}
	
	
}
