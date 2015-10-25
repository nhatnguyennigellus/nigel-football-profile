package nigel.footballprofile.service;

import java.util.List;

import org.springframework.stereotype.Service;

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

/**
 * Inteface for ProfileService class
 * 
 * @author Nigellus
 *
 *         Oct 25, 2015 12:13:00 PM
 */
@Service
public interface IProfileService {
	
	<T> String generateId(String prefix, int length, List<T> list);
	
	/**
	 * Work Log 
	 */
	List<WorkLog> getWorkLogList();

	WorkLog getWorkLogById(String id);

	boolean addWorkLog(WorkLog workLog);

	boolean updateWorkLog(WorkLog workLog);

	/**
	 * Country
	 */
	List<Country> getCountryList();

	Country getCountryById(String id);

	boolean addCountry(Country country);

	boolean updateCountry(Country country);

	/**
	 * City
	 */
	List<Country> getCityList();

	Country getCityById(String id);

	boolean addCity(City city);

	boolean updateCity(City city);

	/**
	 * Stadium
	 */
	List<Stadium> getStadiumList();

	Stadium getStadiumById(String id);

	boolean addStadium(Stadium stadium);

	boolean updateStadium(Stadium stadium);

	/**
	 * Team
	 */
	List<Team> getTeamList();

	Team getTeamById(String id);

	boolean addTeam(Team team);

	boolean updateTeam(Team team);

	/**
	 * State
	 */
	List<State> getStateList();

	State getStateById(String id);

	boolean addState(State state);

	boolean updateState(State state);

	/**
	 * Player
	 */
	List<Player> getPlayerList();

	Player getPlayerById(String id);

	boolean addPlayer(Player player);

	boolean updatePlayer(Player player);

	/**
	 * Scorer
	 */
	List<Scorer> getScorerList();

	Scorer getScorerById(String id);

	boolean addScorer(Scorer scorer);

	boolean updateScorer(Scorer scorer);

	/**
	 * Match
	 */
	List<Match> getMatchList();

	Match getMatchById(String id);

	boolean addMatch(Match match);

	boolean updateMatch(Match match);

	/**
	 * Match Team
	 */
	List<MatchTeam> getMatchTeamList();

	MatchTeam getMatchTeamById(String id);

	boolean addMatchTeam(MatchTeam matchTeam);

	boolean updateMatchTeam(MatchTeam matchTeam);

	/**
	 * Team Player
	 */
	List<TeamPlayer> getTeamPlayerList();

	TeamPlayer getTeamPlayerById(String id);

	boolean addTeamPlayer(TeamPlayer teamPlayer);

	boolean updateTeamPlayer(TeamPlayer teamPlayer);

	/**
	 * Championship
	 */
	List<Championship> getChampionshipList();

	Championship getChampionshipListByShortName();

	Championship getChampionshipById(String id);

	boolean addChampionship(Championship championship);

	boolean updateChampionship(Championship championship);
	
	/**
	 * Standing Data
	 */
	List<StandingsData> getChampionshipStanding(String champShortName);
	
	StandingsData getStandingsDataById(String id);

	StandingsData getStandingsDataByTeam(Team team, String champShortName);
	
	boolean addStandingsData(StandingsData StandingsData);
	
	boolean updateStandingsData(StandingsData StandingsData);
}
