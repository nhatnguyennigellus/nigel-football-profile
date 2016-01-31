package nigel.footballprofile.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import nigel.footballprofile.dao.ChampionshipDAO;
import nigel.footballprofile.dao.CityDAO;
import nigel.footballprofile.dao.CountryDAO;
import nigel.footballprofile.dao.ItemDAO;
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
import nigel.footballprofile.entity.Item;
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
	@Autowired
	private ItemDAO itemDAO;

	public ProfileService() {
	}

	/*
	 * Work Log
	 */

	/**
	 * 
	 * @return
	 *
	 *         Oct 29, 2015 12:15:59 AM
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
	 *         Oct 29, 2015 12:16:03 AM
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
	 *         Oct 29, 2015 12:16:06 AM
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
	 *         Oct 29, 2015 12:16:10 AM
	 * @author Nigellus
	 */
	public boolean addWorkLog(String logType, String desc) {
		WorkLog log = new WorkLog();
		log.setDatetime(new Date());
		log.setLogType(logType);
		log.setDescription(desc);
		return workLogDAO.add(log);
	}

	/**
	 * 
	 * @param workLog
	 * @return
	 *
	 *         Oct 29, 2015 12:16:14 AM
	 * @author Nigellus
	 */
	public boolean updateWorkLog(WorkLog workLog) {
		return workLogDAO.update(workLog);
	}

	/**
	 * 
	 * @return
	 *
	 *         Oct 29, 2015 12:16:17 AM
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
	 *         Oct 29, 2015 12:16:21 AM
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
	 *         Oct 29, 2015 1:15:25 AM
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
	 *         Oct 29, 2015 7:54:12 AM
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
	 *         Oct 29, 2015 12:16:24 AM
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
	 *         Oct 29, 2015 12:16:27 AM
	 * @author Nigellus
	 */
	public boolean updateCountry(Country country) {
		return countryDAO.update(country);
	}

	/**
	 * 
	 * @return
	 *
	 *         Oct 29, 2015 12:16:30 AM
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
	 *         Oct 30, 2015 8:11:15 PM
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
	 *         Oct 30, 2015 8:11:34 PM
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
	 *         Oct 30, 2015 8:11:37 PM
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
	 *         Nov 3, 2015 7:53:20 AM
	 * @author Nigellus
	 */
	public List<City> getCityByName(String name) {
		return cityDAO.getByName(name);
	}

	/**
	 * 
	 * @return
	 *
	 *         Nov 4, 2015 9:20:33 PM
	 * @author Nigellus
	 */
	public List<Stadium> getStadiumList() {
		return stadiumDAO.getList();
	}

	/**
	 * 
	 * @param id
	 * @return
	 *
	 *         Nov 4, 2015 9:21:49 PM
	 * @author Nigellus
	 */
	public Stadium getStadiumById(String id) {
		return stadiumDAO.getById(id);
	}

	/**
	 * 
	 * @param stadium
	 * @return
	 *
	 *         Nov 4, 2015 9:21:52 PM
	 * @author Nigellus
	 */
	public boolean addStadium(Stadium stadium) {
		return stadiumDAO.add(stadium);
	}

	/**
	 * 
	 * @param stadium
	 * @return
	 *
	 *         Nov 4, 2015 9:21:56 PM
	 * @author Nigellus
	 */
	public boolean updateStadium(Stadium stadium) {
		return stadiumDAO.update(stadium);
	}

	/**
	 * 
	 * @return
	 *
	 *         Nov 8, 2015 2:17:04 PM
	 * @author Nigellus
	 */
	public List<Team> getTeamList() {
		return teamDAO.getList();
	}

	/**
	 * 
	 * @param type
	 * @return
	 *
	 *         Nov 27, 2015 11:07:37 PM
	 * @author Nigellus
	 */
	public List<Team> getTeamByType(String type) {
		return teamDAO.getTeamByType(type);
	}

	/**
	 * 
	 * @param id
	 * @return
	 *
	 *         Nov 8, 2015 2:17:08 PM
	 * @author Nigellus
	 */
	public Team getTeamById(String id) {
		return teamDAO.getById(id);
	}

	/**
	 * 
	 * @param team
	 * @return
	 *
	 *         Nov 8, 2015 2:17:11 PM
	 * @author Nigellus
	 */
	public boolean addTeam(Team team) {
		return teamDAO.add(team);
	}

	/**
	 * 
	 * @param team
	 * @return
	 *
	 *         Nov 8, 2015 2:17:16 PM
	 * @author Nigellus
	 */
	public boolean updateTeam(Team team) {
		return teamDAO.update(team);
	}

	/**
	 * 
	 * @return
	 *
	 * Jan 13, 2016 9:25:56 PM
	 * @author Nigellus
	 */
	public List<State> getStateList() {
		return stateDAO.getList();
	}

	/**
	 * 
	 * @param id
	 * @return
	 *
	 * Jan 13, 2016 9:25:59 PM
	 * @author Nigellus
	 */
	public State getStateById(Integer id) {
		return stateDAO.getById(id);
	}

	/**
	 * 
	 * @param state
	 * @return
	 *
	 * Jan 13, 2016 9:26:04 PM
	 * @author Nigellus
	 */
	public boolean addState(State state) {
		return stateDAO.add(state);
	}

	/**
	 * 
	 * @param state
	 * @return
	 *
	 * Jan 13, 2016 9:26:09 PM
	 * @author Nigellus
	 */
	public boolean updateState(State state) {
		return stateDAO.update(state);
	}

	/**
	 * 
	 * @param team
	 * @return
	 *
	 * Jan 13, 2016 9:28:16 PM
	 * @author Nigellus
	 */
	public List<State> getStateListByTeam(Team team) {
		return stateDAO.getListByTeam(team);
	}
	
	/**
	 * 
	 * @param champ
	 * @return
	 *
	 * Jan 13, 2016 9:28:45 PM
	 * @author Nigellus
	 */
	public List<State> getStateListByChamp(Championship champ) {
		List<State> list = new ArrayList<State>();
		for(State state : stateDAO.getListByChamp(champ)) {
			if (!state.getStatuz().contains("OFFL")) {
				list.add(state);
			}
		}
		return list;
	}
	
	
	/**
	 * 
	 * @return
	 *
	 *         Nov 21, 2015 4:52:03 PM
	 * @author Nigellus
	 */
	public List<Player> getPlayerList() {
		return playerDAO.getList();
	}

	/**
	 * 
	 * @param team
	 * @return
	 *
	 *         Nov 26, 2015 11:36:35 PM
	 * @author Nigellus
	 */
	public List<Player> getPlayerListByTeam(Team team) {
		List<TeamPlayer> listTP = this.getTeamPlayerList();
		List<Player> listPlayer = new ArrayList<Player>();
		for (TeamPlayer tp : listTP) {
			if (tp.getTeam().getTeamId().equals(team.getTeamId())) {
				listPlayer.add(tp.getPlayer());
			}
		}
		return listPlayer;
	}

	/**
	 * 
	 * @param id
	 * @return
	 *
	 *         Nov 21, 2015 4:52:07 PM
	 * @author Nigellus
	 */
	public Player getPlayerById(String id) {
		return playerDAO.getById(id);
	}

	/**
	 * 
	 * @param player
	 * @return
	 *
	 *         Nov 21, 2015 4:52:10 PM
	 * @author Nigellus
	 */
	public boolean addPlayer(Player player) {
		return playerDAO.add(player);
	}

	/**
	 * 
	 * @param player
	 * @return
	 *
	 *         Nov 21, 2015 4:52:50 PM
	 * @author Nigellus
	 */
	public boolean updatePlayer(Player player) {
		return playerDAO.update(player);
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

	/**
	 * 
	 * @return
	 *
	 * Jan 10, 2016 9:58:45 PM
	 * @author Nigellus
	 */
	public List<Match> getMatchList() {
		return matchDAO.getList();
	}

	/**
	 * 
	 * @param id
	 * @return
	 *
	 * Jan 10, 2016 10:00:41 PM
	 * @author Nigellus
	 */
	public Match getMatchById(String id) {
		return matchDAO.getById(id);
	}
	
	/**
	 * 
	 * @return
	 *
	 * Jan 12, 2016 7:50:55 AM
	 * @author Nigellus
	 */
	public List<Match> getMatchListByChamp(int champId) {
		return matchDAO.getByChamp(champId);
	}

	/**
	 * 
	 * @param match
	 * @return
	 *
	 * Jan 10, 2016 10:00:44 PM
	 * @author Nigellus
	 */
	public boolean addMatch(Match match) {
		return matchDAO.add(match);
	}

	/**
	 * 
	 * @param match
	 * @return
	 *
	 * Jan 10, 2016 10:00:54 PM
	 * @author Nigellus
	 */
	public boolean updateMatch(Match match) {
		return matchDAO.update(match);
	}

	/**
	 * 
	 * @return
	 *
	 * Jan 10, 2016 10:01:19 PM
	 * @author Nigellus
	 */
	public List<MatchTeam> getMatchTeamList() {
		return matchTeamDAO.getList();
	}

	/**
	 * 
	 * @param id
	 * @return
	 *
	 * Jan 10, 2016 10:02:52 PM
	 * @author Nigellus
	 */
	public MatchTeam getMatchTeamById(int id) {
		return matchTeamDAO.getById(id);
	}
	
	/**
	 * 
	 * @param side
	 * @param match
	 * @return
	 *
	 * Jan 30, 2016 2:19:21 PM
	 * @author Nigellus
	 */
	public MatchTeam getMatchTeamBySide(String side, Match match) {
		return matchTeamDAO.getBySide(side, match);
	}

	/**
	 * 
	 * @param matchTeam
	 * @return
	 *
	 * Jan 10, 2016 10:03:30 PM
	 * @author Nigellus
	 */
	public boolean addMatchTeam(MatchTeam matchTeam) {
		return matchTeamDAO.add(matchTeam);
	}

	/**
	 * 
	 * @param matchTeam
	 * @return
	 *
	 * Jan 10, 2016 10:05:03 PM
	 * @author Nigellus
	 */
	public boolean updateMatchTeam(MatchTeam matchTeam) {
		return matchTeamDAO.update(matchTeam);
	}

	/**
	 * 
	 * @return
	 *
	 *         Nov 26, 2015 11:58:23 PM
	 * @author Nigellus
	 */
	public List<TeamPlayer> getTeamPlayerList() {
		return teamPlayerDAO.getList();
	}

	/**
	 * 
	 * @param id
	 * @return
	 *
	 *         Nov 26, 2015 11:58:26 PM
	 * @author Nigellus
	 */
	public TeamPlayer getTeamPlayerById(Integer id) {
		return teamPlayerDAO.getById(id);
	}

	/**
	 * 
	 * @param teamPlayer
	 * @return
	 *
	 *         Nov 26, 2015 11:58:41 PM
	 * @author Nigellus
	 */
	public boolean addTeamPlayer(TeamPlayer teamPlayer) {
		return teamPlayerDAO.add(teamPlayer);
	}

	/**
	 * 
	 * @param teamPlayer
	 * @return
	 *
	 *         Nov 26, 2015 11:58:45 PM
	 * @author Nigellus
	 */
	public boolean updateTeamPlayer(TeamPlayer teamPlayer) {
		return teamPlayerDAO.update(teamPlayer);
	}

	/**
	 * 
	 * @param request
	 * @return
	 *
	 *         Nov 28, 2015 11:31:47 AM
	 * @author Nigellus
	 */
	public boolean callPlayerToTeam(HttpServletRequest request) {
		Player player = this.getPlayerById(request.getParameter("playerId"));
		String clubId = request.getParameter("club");
		String natlId = request.getParameter("natl");

		Team club = new Team();
		Team natl = new Team();
		if (!clubId.equals("No")) {
			club = this.getTeamById(clubId);
		}
		if (!natlId.equals("No")) {
			natl = this.getTeamById(natlId);
		}

		// Club
		TeamPlayer teamPlayer = this.findByPlayer(player.getPlayerId(),
				AppConstant.TEAM_CLUB);
		if (!clubId.equals("No")) {
			if (teamPlayer == null) {
				teamPlayer = new TeamPlayer();
				
			}
			teamPlayer.setPlayer(player);
			// Get data
			teamPlayer.setCaptain(request.getParameter("clubCap") != null);
			teamPlayer.setKitNumber(Integer.parseInt(request
					.getParameter("clubKit")));
			teamPlayer.setTeam(club);
			// If this is the new captain, find the current captain and
			// set his captain to "false"
			if (teamPlayer.isCaptain()) {
				Player currCap = this.findCaptain(club);
				
				if (currCap != null) {
					TeamPlayer currCapTP = this.findByPlayer(currCap.getPlayerId(),
							AppConstant.TEAM_CLUB);
					currCapTP.setCaptain(false);
					this.updateTeamPlayer(currCapTP);
				}
			}
			// If this kit number exists in team, find and replace it with the
			// least number in the list of available kit numbers (except for the
			// new kit number.
			List<Integer> clubAvailKitNo = this.availableKitNo(club);
			if (!clubAvailKitNo.contains(Integer.parseInt(request
					.getParameter("clubKit")))) {
				TeamPlayer currKitTP = this.findByKitNo(clubId,
						Integer.parseInt(request.getParameter("clubKit")));
				if (currKitTP != null && !currKitTP.getPlayer().getPlayerId()
						.equals(player.getPlayerId())) {
					currKitTP.setKitNumber(clubAvailKitNo.get(0));
					this.updateTeamPlayer(currKitTP);
				}
				
			}
		}
		if (!this.isInTeamType(player, AppConstant.TEAM_CLUB)) {
			if (!clubId.equals("No")) {
				teamPlayer.setStatus(true);
				this.addTeamPlayer(teamPlayer);
			}
		} else {
			if (clubId.equals("No")) {
				if(teamPlayer != null) {
					teamPlayer.setStatus(false);
				}
			} else {
				teamPlayer.setStatus(true);
			}
			if(teamPlayer != null) {
				this.updateTeamPlayer(teamPlayer);
			}
		}

		// National
		teamPlayer = this.findByPlayer(player.getPlayerId(),
				AppConstant.TEAM_NATIONAL);
		if (!natlId.equals("No")) {
			if (teamPlayer == null) {
				teamPlayer = new TeamPlayer();
				
			}
			teamPlayer.setPlayer(player);
			teamPlayer.setCaptain(request.getParameter("natlCap") != null);
			teamPlayer.setKitNumber(Integer.parseInt(request
					.getParameter("natlKit")));
			teamPlayer.setTeam(natl);
			// If this is the new captain, find the current captain and
			// set his captain to "false"
			if (teamPlayer.isCaptain()) {
				Player currCap = this.findCaptain(natl);
				
				if (currCap != null) {
					TeamPlayer currCapTP = this.findByPlayer(currCap.getPlayerId(),
							AppConstant.TEAM_NATIONAL);
					currCapTP.setCaptain(false);
					this.updateTeamPlayer(currCapTP);
				}
				
			}
			// If this kit number exists in team, find and replace it with the
			// least number in the list of available kit numbers (except for the
			// new kit number.
			List<Integer> natlAvailKitNo = this.availableKitNo(natl);
			if (!natlAvailKitNo.contains(Integer.parseInt(request
					.getParameter("natlKit")))) {
				TeamPlayer currKitTP = this.findByKitNo(clubId,
						Integer.parseInt(request.getParameter("natlKit")));
				if (currKitTP != null
						&& !currKitTP.getPlayer().getPlayerId()
								.equals(player.getPlayerId())) {
					currKitTP.setKitNumber(natlAvailKitNo.get(0));
					this.updateTeamPlayer(currKitTP);
				}
				
			}
		}
		if (!this.isInTeamType(player, AppConstant.TEAM_NATIONAL)) {
			if (!natlId.equals("No")) {
				teamPlayer.setStatus(true);
				this.addTeamPlayer(teamPlayer);
			}
		} else {
			if (natlId.equals("No")) {
				if(teamPlayer != null) {
					teamPlayer.setStatus(false);
				}
			} else {
				teamPlayer.setStatus(true);
			}
			if(teamPlayer != null) {
				this.updateTeamPlayer(teamPlayer);
			}
		}

		return true;
	}

	/**
	 * 
	 * @param team
	 * @return
	 *
	 *         Nov 29, 2015 1:09:42 PM
	 * @author Nigellus
	 */
	private List<Integer> availableKitNo(Team team) {
		List<Integer> listAvailKitNo = new ArrayList<Integer>();

		boolean yes = false;
		for (int i = 1; i <= 99; i++) {
			yes = false;
			for (TeamPlayer tp : this.findByTeam(team.getTeamId())) {
				if (tp.getKitNumber() == i) {
					yes = true;
					break;
				}
			}
			if (!yes) {
				listAvailKitNo.add(i);
			}
		}

		return listAvailKitNo;
	}

	/**
	 * 
	 * @param team
	 * @return
	 *
	 *         Nov 29, 2015 1:41:23 PM
	 * @author Nigellus
	 */
	public Player findCaptain(Team team) {
		Player player = null;
		for (TeamPlayer tp : this.findByTeam(team.getTeamId())) {
			if (tp.isCaptain()) {
				player = tp.getPlayer();
				break;
			}
		}

		return player;
	}

	/**
	 * 
	 * @param playerId
	 * @return
	 *
	 *         Nov 29, 2015 1:37:48 PM
	 * @author Nigellus
	 */
	public TeamPlayer findByPlayer(String playerId, String teamType) {
		List<TeamPlayer> list = teamPlayerDAO.getByPlayer(playerId);
		for (TeamPlayer tp : list) {
			if (tp.getTeam().getTeamType().equals(teamType)) {
				return tp;
			}
		}
		return null;
	}

	/**
	 * 
	 * @param teamId
	 * @return
	 *
	 *         Nov 29, 2015 1:38:24 PM
	 * @author Nigellus
	 */
	public List<TeamPlayer> findByTeam(String teamId) {
		return teamPlayerDAO.getByTeam(teamId);
	}

	/**
	 * 
	 * @param teamId
	 * @param kitNo
	 * @return
	 *
	 *         Nov 29, 2015 2:16:23 PM
	 * @author Nigellus
	 */
	public TeamPlayer findByKitNo(String teamId, Integer kitNo) {
		for (TeamPlayer tp : this.findByTeam(teamId)) {
			if (tp.getKitNumber() == kitNo) {
				return tp;
			}
		}
		return null;
	}

	/**
	 * 
	 * @param player
	 * @param type
	 * @return
	 *
	 *         Nov 28, 2015 12:18:32 AM
	 * @author Nigellus
	 */
	private boolean isInTeamType(Player player, String type) {

		for (TeamPlayer tp : player.getTeamplayers()) {
			if (tp.getTeam().getTeamType().equals(type)) {
				return true;
			}
		}

		return false;
	}

	/**
	 * 
	 * @return
	 *
	 *         Nov 10, 2015 7:37:17 AM
	 * @author Nigellus
	 */
	public List<Championship> getChampionshipList() {
		return championshipDAO.getList();
	}

	/**
	 * 
	 * @return
	 *
	 *         Nov 10, 2015 7:37:36 AM
	 * @author Nigellus
	 */
	public Championship getChampionshipByShortName(String shortName) {
		return championshipDAO.getChampByShortName(shortName);
	}

	/**
	 * 
	 * @param id
	 * @return
	 *
	 *         Nov 10, 2015 7:38:09 AM
	 * @author Nigellus
	 */
	public Championship getChampionshipById(int id) {
		return championshipDAO.getById(id);
	}

	/**
	 * 
	 * @param championship
	 * @return
	 *
	 *         Nov 10, 2015 7:43:01 AM
	 * @author Nigellus
	 */
	public boolean addChampionship(Championship championship) {
		return championshipDAO.add(championship);
	}

	/**
	 * 
	 * @param championship
	 * @return
	 *
	 *         Nov 10, 2015 7:43:09 AM
	 * @author Nigellus
	 */
	public boolean updateChampionship(Championship championship) {
		return championshipDAO.update(championship);
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
	 * @param lang
	 * @return
	 *
	 * Jan 11, 2016 10:40:20 PM
	 * @author Nigellus
	 */
	public List<Item> getItemList(String lang) {
		return itemDAO.getList(lang);
	}
	
	/**
	 * 
	 * @return
	 *
	 * Jan 11, 2016 10:40:26 PM
	 * @author Nigellus
	 */
	public List<Item> getItemList() {
		return itemDAO.getList();
	}

	/**
	 * 
	 * @param id
	 * @return
	 *
	 * Jan 11, 2016 8:44:52 PM
	 * @author Nigellus
	 */
	public Item getItemById(int id) {
		return itemDAO.getById(id);
	}

	/**
	 * 
	 * @param item
	 * @param lang
	 * @return
	 *
	 * Jan 11, 2016 8:45:23 PM
	 * @author Nigellus
	 */
	public Item getItemByItem(String item, String lang) {
		return itemDAO.getByItem(item, lang);
	}
	
	/**
	 * 
	 * @param lang
	 * @param type
	 * @return
	 *
	 * Jan 15, 2016 7:50:28 AM
	 * @author Nigellus
	 */
	public List<Item> getItemByType(String type, String lang) {
		return itemDAO.getByType(type, lang);
	}
	
	/**
	 * 
	 * @param type
	 * @return
	 *
	 * Jan 24, 2016 10:45:10 AM
	 * @author Nigellus
	 */
	public List<Item> getItemByType(String type) {
		return itemDAO.getByType(type);
	}

	/**
	 * 
	 * @param Item
	 * @return
	 *
	 * Jan 11, 2016 8:43:33 PM
	 * @author Nigellus
	 */
	public boolean addItem(Item item) {
		return itemDAO.add(item);
	}

	/**
	 * 
	 * @param Item
	 * @return
	 *
	 * Jan 11, 2016 8:43:38 PM
	 * @author Nigellus
	 */
	public boolean updateItem(Item item) {
		return itemDAO.update(item);
	}

	/**
	 * 
	 * @param shortName
	 * @param name
	 * @return
	 *
	 *         Oct 31, 2015 1:19:42 PM
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
	 *         Oct 31, 2015 1:19:45 PM
	 * @author Nigellus
	 */
	public boolean existedCity(String name) {
		return (this.getCityByName(name).size() > 0);
	}

	/**
	 * 
	 * @param name
	 * @param uefaName
	 * @return
	 *
	 *         Nov 5, 2015 11:17:00 PM
	 * @author Nigellus
	 */
	public boolean existedStadium(String name, String uefaName) {
		return (stadiumDAO.getByName(name, uefaName) != null);
	}

	/**
	 * 
	 * @param fullName
	 * @param shortName
	 * @return
	 *
	 *         Nov 9, 2015 7:36:01 AM
	 * @author Nigellus
	 */
	public boolean existedTeam(String fullName, String shortName) {
		return (teamDAO.getByName(fullName, shortName) != null);
	}

	/**
	 * 
	 * @param coach
	 * @return
	 *
	 *         Nov 9, 2015 7:36:05 AM
	 * @author Nigellus
	 */
	public boolean existedCoach(String coach) {
		List<Team> list = this.getTeamList();
		for (Team team : list) {
			if (team.getCoach().equals(coach)) {
				return true;
			}

		}
		return false;
	}

	/**
	 * 
	 * @param shortName
	 * @param name
	 * @return
	 *
	 *         Nov 11, 2015 7:53:33 PM
	 * @author Nigellus
	 */
	public boolean existedChamp(String shortName, String name) {
		return (this.getChampionshipByShortName(shortName) != null)
				|| (championshipDAO.getChampByName(name) != null);
	}
	
	/**
	 * 
	 * @param team
	 * @param champ
	 * @return
	 *
	 * Jan 14, 2016 12:20:45 AM
	 * @author Nigellus
	 */
	public boolean existedTeamInChamp(Team team, Championship champ) {
		List<State> partChamp = stateDAO.getListByChamp(champ);
		for (State state : partChamp) {
			if (team.getTeamId().equals(state.getTeam().getTeamId())
					&& !state.getStatuz().equals("OFFL")) {
				return true;
			}
		}
		
		return false;
	}
}
