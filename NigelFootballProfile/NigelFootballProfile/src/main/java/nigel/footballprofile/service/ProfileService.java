package nigel.footballprofile.service;

import java.util.List;

import javax.transaction.Transactional;

import nigel.footballprofile.dao.ChampionshipDAO;
import nigel.footballprofile.dao.CityDAO;
import nigel.footballprofile.dao.CountryDAO;
import nigel.footballprofile.dao.MatchDAO;
import nigel.footballprofile.dao.MatchTeamDAO;
import nigel.footballprofile.dao.PlayerDAO;
import nigel.footballprofile.dao.ScorerDAO;
import nigel.footballprofile.dao.StadiumDAO;
import nigel.footballprofile.dao.StandingDAO;
import nigel.footballprofile.dao.StateDAO;
import nigel.footballprofile.dao.TeamDAO;
import nigel.footballprofile.dao.TeamPlayerDAO;
import nigel.footballprofile.dao.WorkLogDAO;
import nigel.footballprofile.entity.Championship;
import nigel.footballprofile.entity.City;
import nigel.footballprofile.entity.Country;
import nigel.footballprofile.entity.Match;
import nigel.footballprofile.entity.MatchTeam;
import nigel.footballprofile.entity.Player;
import nigel.footballprofile.entity.Scorer;
import nigel.footballprofile.entity.Stadium;
import nigel.footballprofile.entity.StandingsData;
import nigel.footballprofile.entity.State;
import nigel.footballprofile.entity.Team;
import nigel.footballprofile.entity.TeamPlayer;
import nigel.footballprofile.entity.WorkLog;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Provides services for this application
 * 
 * @author Nigellus
 *
 *         Oct 24, 2015 10:04:15 PM
 */
@Service("profileService")
public class ProfileService {
	@Autowired
	private CountryDAO countryDAO;
	@Autowired
	private CityDAO cityDAO;
	@Autowired
	private StadiumDAO stadiumDAO;
	@Autowired
	private TeamDAO teamDAO;
	@Autowired
	private PlayerDAO playerDAO;
	@Autowired
	private MatchDAO matchDAO;
	@Autowired
	private WorkLogDAO workLogDAO;
	@Autowired
	private StateDAO stateDAO;
	@Autowired
	private ChampionshipDAO championshipDAO;
	@Autowired
	private StandingDAO standingDAO;
	@Autowired
	private MatchTeamDAO matchTeamDAO;
	@Autowired
	private TeamPlayerDAO teamPlayerDAO;
	@Autowired
	private ScorerDAO scorerDAO;

	public ProfileService() {
	} 
	/*
	 * Work Log
	 */
	
	/**
	 * 
	 * @return
	 *
	 * Oct 29, 2015 12:15:59 AM
	 * @author Nigellus
	 */
	public List<WorkLog> getWorkLogList() {
		return workLogDAO.getList();
	}

	/**
	 * 
	 * @param id
	 * @return
	 *
	 * Oct 29, 2015 12:16:03 AM
	 * @author Nigellus
	 */
	public WorkLog getWorkLogById(Integer id) {
		return workLogDAO.getById(id);
	}

	/**
	 * 
	 * @param type
	 * @return
	 *
	 * Oct 29, 2015 12:16:06 AM
	 * @author Nigellus
	 */
	public List<WorkLog> getWorkLogByType(String type) {
		return workLogDAO.getByType(type);
	}

	/**
	 * 
	 * @param workLog
	 * @return
	 *
	 * Oct 29, 2015 12:16:10 AM
	 * @author Nigellus
	 */
	public boolean addWorkLog(WorkLog workLog) {
		return workLogDAO.add(workLog);
	}

	/**
	 * 
	 * @param workLog
	 * @return
	 *
	 * Oct 29, 2015 12:16:14 AM
	 * @author Nigellus
	 */
	public boolean updateWorkLog(WorkLog workLog) {
		return workLogDAO.update(workLog);
	}

	/**
	 * 
	 * @return
	 *
	 * Oct 29, 2015 12:16:17 AM
	 * @author Nigellus
	 */
	public List<Country> getCountryList() {
		return countryDAO.getList();
	}

	/**
	 * 
	 * @param id
	 * @return
	 *
	 * Oct 29, 2015 12:16:21 AM
	 * @author Nigellus
	 */
	public Country getCountryById(String id) {
		return countryDAO.getById(id);
	}
	
	/**
	 * 
	 * @param shortName
	 * @return
	 *
	 * Oct 29, 2015 1:15:25 AM
	 * @author Nigellus
	 */
	public Country getCountryByShortname(String shortName) {
		return countryDAO.getByShortname(shortName);
	}
	
	/**
	 * 
	 * @param name
	 * @return
	 *
	 * Oct 29, 2015 7:54:12 AM
	 * @author Nigellus
	 */
	public Country getCountryByName(String name) {
		return countryDAO.getByName(name);
	}

	/**
	 * 
	 * @param country
	 * @return
	 *
	 * Oct 29, 2015 12:16:24 AM
	 * @author Nigellus
	 */
	public boolean addCountry(Country country) {
		return countryDAO.add(country);
	}

	/**
	 * 
	 * @param country
	 * @return
	 *
	 * Oct 29, 2015 12:16:27 AM
	 * @author Nigellus
	 */
	public boolean updateCountry(Country country) {
		return countryDAO.update(country);
	}

	/**
	 * 
	 * @return
	 *
	 * Oct 29, 2015 12:16:30 AM
	 * @author Nigellus
	 */
	public List<City> getCityList() {
		return cityDAO.getList();
	}

	/**
	 * 
	 * @param id
	 * @return
	 *
	 * Oct 30, 2015 8:11:15 PM
	 * @author Nigellus
	 */
	public City getCityById(String id) {
		return cityDAO.getById(id);
	}

	/**
	 * 
	 * @param city
	 * @return
	 *
	 * Oct 30, 2015 8:11:34 PM
	 * @author Nigellus
	 */
	public boolean addCity(City city) {
		return cityDAO.add(city);
	}

	/**
	 * 
	 * @param city
	 * @return
	 *
	 * Oct 30, 2015 8:11:37 PM
	 * @author Nigellus
	 */
	public boolean updateCity(City city) {
		return cityDAO.update(city);
	}
	
	/**
	 * 
	 * @param name
	 * @return
	 *
	 * Nov 3, 2015 7:53:20 AM
	 * @author Nigellus
	 */
	public List<City> getCityByName(String name) {
		return cityDAO.getByName(name);
	}

	public List<Stadium> getStadiumList() {
		return null;
	}

	public Stadium getStadiumById(String id) {
		return null;
	}

	public boolean addStadium(Stadium stadium) {
		return false;
	}

	public boolean updateStadium(Stadium stadium) {
		return false;
	}

	public List<Team> getTeamList() {
		return null;
	}

	public Team getTeamById(String id) {
		return null;
	}

	public boolean addTeam(Team team) {
		return false;
	}

	public boolean updateTeam(Team team) {
		return false;
	}

	public List<State> getStateList() {
		return null;
	}

	public State getStateById(String id) {
		return null;
	}

	public boolean addState(State state) {
		return false;
	}

	public boolean updateState(State state) {
		return false;
	}

	public List<Player> getPlayerList() {
		return null;
	}

	public Player getPlayerById(String id) {
		return null;
	}

	public boolean addPlayer(Player player) {
		return false;
	}

	public boolean updatePlayer(Player player) {
		return false;
	}

	public List<Scorer> getScorerList() {
		return null;
	}

	public Scorer getScorerById(String id) {
		return null;
	}

	public boolean addScorer(Scorer scorer) {
		return false;
	}

	public boolean updateScorer(Scorer scorer) {
		return false;
	}

	public List<Match> getMatchList() {
		return null;
	}

	public Match getMatchById(String id) {
		return null;
	}

	public boolean addMatch(Match match) {
		return false;
	}

	public boolean updateMatch(Match match) {
		return false;
	}

	public List<MatchTeam> getMatchTeamList() {
		return null;
	}

	public MatchTeam getMatchTeamById(String id) {
		return null;
	}

	public boolean addMatchTeam(MatchTeam matchTeam) {
		return false;
	}

	public boolean updateMatchTeam(MatchTeam matchTeam) {
		return false;
	}

	public List<TeamPlayer> getTeamPlayerList() {
		return null;
	}

	public TeamPlayer getTeamPlayerById(String id) {
		return null;
	}

	public boolean addTeamPlayer(TeamPlayer teamPlayer) {
		return false;
	}

	public boolean updateTeamPlayer(TeamPlayer teamPlayer) {
		return false;
	}

	public List<Championship> getChampionshipList() {
		return null;
	}

	public Championship getChampionshipListByShortName() {
		return null;
	}

	public Championship getChampionshipById(String id) {
		return null;
	}

	public boolean addChampionship(Championship championship) {
		return false;
	}

	public boolean updateChampionship(Championship championship) {
		return false;
	}

	public List<StandingsData> getChampionshipStanding(String champShortName) {
		return null;
	}

	public StandingsData getStandingsDataById(String id) {
		return null;
	}

	public StandingsData getStandingsDataByTeam(Team team, String champShortName) {
		return null;
	}

	public boolean addStandingsData(StandingsData StandingsData) {
		return false;
	}

	public boolean updateStandingsData(StandingsData StandingsData) {
		return false;
	}

	/**
	 * 
	 * @param shortName
	 * @param name
	 * @return
	 *
	 * Oct 31, 2015 1:19:42 PM
	 * @author Nigellus
	 */
	public boolean existedCountry(String shortName, String name) {
		return (this.getCountryByShortname(shortName) != null)
				&& (this.getCountryByName(name) != null);
	}

	/**
	 * 
	 * @param city
	 * @return
	 *
	 * Oct 31, 2015 1:19:45 PM
	 * @author Nigellus
	 */
	public boolean existedCity(String name) {
		return (this.getCityByName(name).size() > 0);
	}
}
