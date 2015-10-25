package nigel.footballprofile.service;

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
	
	/**
	 * Common services
	 */
	public String generateId(String prefix, int length) {
		String id = "";
		
		StringBuilder idBuilder = new StringBuilder();
		/* Add prefix */
		idBuilder.append(prefix);
		
		/* Add suffix */
		
		return id;
	}
}
