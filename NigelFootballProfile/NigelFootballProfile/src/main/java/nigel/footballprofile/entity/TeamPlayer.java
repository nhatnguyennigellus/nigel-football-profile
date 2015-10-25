package nigel.footballprofile.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;

/**
 * Relational tables between Team and Player with attributes
 * 
 * @author Nigellus
 *
 * Oct 24, 2015 6:30:12 AM
 */
@Entity
@Table(name = "teamplayer")
public class TeamPlayer {
	@Id
	@GeneratedValue
	private Integer id;
	
	@ManyToOne
	@JoinColumn(name = "player")
	private Player player;
	
	@ManyToOne
	@JoinColumn(name = "team")
	private Team team;
	
	@NotEmpty
	private boolean isCaptain;
	
	@NotEmpty
	private Integer kitNumber;
	
	public TeamPlayer() {
		// TODO Auto-generated constructor stub
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Player getPlayer() {
		return player;
	}

	public void setPlayer(Player player) {
		this.player = player;
	}

	public Team getTeam() {
		return team;
	}

	public void setTeam(Team team) {
		this.team = team;
	}

	public boolean isCaptain() {
		return isCaptain;
	}

	public void setCaptain(boolean isCaptain) {
		this.isCaptain = isCaptain;
	}

	public Integer getKitNumber() {
		return kitNumber;
	}

	public void setKitNumber(Integer kitNumber) {
		this.kitNumber = kitNumber;
	}
	
	
}