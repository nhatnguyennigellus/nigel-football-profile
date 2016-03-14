package nigel.footballprofile.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

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
	private String rounds;

	@NotEmpty
	private String logoUrl;
	
	@NotNull
	private Integer participantNo;
	
	@NotNull
	private Integer groupNo;
	
	@NotNull
	private Integer teamsPerGroup;
	
	@NotEmpty
	private String language;

	@OneToMany(mappedBy = "championship")
	private Set<StandingsData> standingDatas = new HashSet<StandingsData>();

	@OneToMany(mappedBy = "championship")
	private Set<Match> matches = new HashSet<Match>();

	@OneToMany(mappedBy = "championship")
	private Set<State> states = new HashSet<State>();

	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "champstadium", joinColumns = { @JoinColumn(name = "champId") }, inverseJoinColumns = { @JoinColumn(name = "stadiumId") })
	private Set<Stadium> stadiums = new HashSet<Stadium>();
	
	public Championship() {
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
	
	public Set<Stadium> getStadiums() {
		return stadiums;
	}

	public void setStadiums(Set<Stadium> stadiums) {
		this.stadiums = stadiums;
	}

	public Integer getParticipantNo() {
		return participantNo;
	}

	public void setParticipantNo(Integer participantNo) {
		this.participantNo = participantNo;
	}

	public Integer getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(Integer groupNo) {
		this.groupNo = groupNo;
	}

	public Integer getTeamsPerGroup() {
		return teamsPerGroup;
	}

	public void setTeamsPerGroup(Integer teamsPerGroup) {
		this.teamsPerGroup = teamsPerGroup;
	}

	public String getRounds() {
		return rounds;
	}

	public void setRounds(String rounds) {
		this.rounds = rounds;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	@Override
	public String toString() {
		return "[" + champId + ", " + fullName + ", " + shortName + ", "
				+ season + ", " + formula + "]";
	}
}
