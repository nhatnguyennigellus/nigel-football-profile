package nigel.footballprofile.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;

/**
 * Entity class for Championship
 * 
 * @author Nigellus
 *
 * Oct 24, 2015 6:33:29 AM
 */
@Entity
@Table(name = "championships")
public class Championship {
	@Id
	@GeneratedValue
	private Integer champId;
	
	@NotEmpty		
	private String fullName;
	
	@NotEmpty
	private String shortName;
	
	@OneToMany(mappedBy = "championship")
	private Set<StandingsData> standingDatas = new HashSet<StandingsData>();
	
	@OneToMany(mappedBy = "championship")
	private Set<Match> matches = new HashSet<Match>();
	
	public Championship() {
		// TODO Auto-generated constructor stub
	}

	public Integer getChampId() {
		return champId;
	}

	public void setChampId(Integer champId) {
		this.champId = champId;
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

	public Set<StandingsData> getStandingDatas() {
		return standingDatas;
	}

	public void setStandingDatas(Set<StandingsData> standingDatas) {
		this.standingDatas = standingDatas;
	}

	public Set<Match> getMatches() {
		return matches;
	}

	public void setMatches(Set<Match> matches) {
		this.matches = matches;
	}
	
	
}
