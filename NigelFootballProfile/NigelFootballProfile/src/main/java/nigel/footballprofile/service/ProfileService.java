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
 * Oct 24, 2015 10:04:15 PM
 */
@Service("profileService")
@Transactional
public class ProfileService implements IProfileService {
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
	
	/**
	 * Common services
	 */
	
	public <T> String generateId(String prefix, int length, List<T> list) {
		String id = "";
		
		StringBuilder idBuilder = new StringBuilder();
		/* Add prefix */
		idBuilder.append(prefix);
		
		/* Add suffix */
		
		return id;
	}

	public List<WorkLog> getWorkLogList() {
		return null;
	}

	public WorkLog getWorkLogById(String id) {
		return null;
	}

	public boolean addWorkLog(WorkLog workLog) {
		return false;
	}

	public boolean updateWorkLog(WorkLog workLog) {
		return false;
	}

	public List<Country> getCountryList() {
		return null;
	}

	public Country getCountryById(String id) {
		return null;
	}

	public boolean addCountry(Country country) {
		return false;
	}

	public boolean updateCountry(Country country) {
		return false;
	}

	public List<Country> getCityList() {
		return null;
	}

	public Country getCityById(String id) {
		return null;
	}

	public boolean addCity(City city) {
		return false;
	}

	public boolean updateCity(City city) {
		return false;
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
}
