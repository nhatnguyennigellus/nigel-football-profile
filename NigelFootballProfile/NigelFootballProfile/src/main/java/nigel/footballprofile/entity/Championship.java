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
 *         Oct 24, 2015 6:33:29 AM
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

	@NotEmpty
	private String season;

	@NotEmpty
	private String formula;

	@NotEmpty
	private String logoUrl;

	@OneToMany(mappedBy = "championship")
	private Set<StandingsData> standingDatas = new HashSet<StandingsData>();

	@OneToMany(mappedBy = "championship")
	private Set<Match> matches = new HashSet<Match>();

	@OneToMany(mappedBy = "championship")
	private Set<State> states = new HashSet<State>();

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

	public String getSeason() {
		return season;
	}

	public void setSeason(String season) {
		this.season = season;
	}

	public String getLogoUrl() {
		return logoUrl;
	}

	public void setLogoUrl(String logoUrl) {
		this.logoUrl = logoUrl;
	}

	public Set<State> getStates() {
		return states;
	}

	public void setStates(Set<State> states) {
		this.states = states;
	}

	public String getFormula() {
		return formula;
	}

	public void setFormula(String formula) {
		this.formula = formula;
	}

	@Override
	public String toString() {
		return "[" + champId + ", " + fullName + ", " + shortName + ", "
				+ season + ", " + formula + "]";
	}
}
