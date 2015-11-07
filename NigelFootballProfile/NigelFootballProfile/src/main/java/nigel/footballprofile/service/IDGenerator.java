package nigel.footballprofile.service;

import java.text.DecimalFormat;
import java.util.List;

import nigel.footballprofile.entity.City;
import nigel.footballprofile.entity.Country;
import nigel.footballprofile.entity.Match;
import nigel.footballprofile.entity.Player;
import nigel.footballprofile.entity.Stadium;
import nigel.footballprofile.entity.Team;

public class IDGenerator {
	public static String genCountryId(List<Country> list) {
		String id = "";

		StringBuilder idBuilder = new StringBuilder();
		/* Add prefix */
		String prefix = AppConstant.PRE_COUNTRY_ID;
		idBuilder.append(prefix);

		/* Add suffix */
		String suffix = "";
		StringBuilder formatPattern = new StringBuilder();
		for (int i = 0; i < AppConstant.LEN_COUNTRY_ID - 1; i++) {
			formatPattern.append("0");
		}

		if (list.size() == 0) {
			suffix = formatPattern.toString();
		} else {
			suffix = list.get(list.size() - 1).getId().substring(1);
			int next = Integer.parseInt(suffix) + 1;
			DecimalFormat fmtDigits = new DecimalFormat(
					formatPattern.toString());
			suffix = fmtDigits.format(next);
		}
		
		id = prefix + suffix; 
		return id;
		
	}
	public static String genCityId(List<City> list) {
		String id = "";

		StringBuilder idBuilder = new StringBuilder();
		/* Add prefix */
		String prefix = AppConstant.PRE_CITY_ID;
		idBuilder.append(prefix);

		/* Add suffix */
		String suffix = "";
		StringBuilder formatPattern = new StringBuilder();
		for (int i = 0; i < AppConstant.LEN_CITY_ID - 1; i++) {
			formatPattern.append("0");
		}

		if (list.size() == 0) {
			suffix = formatPattern.toString();
		} else {
			int size = list.size();
			City city = list.get(size - 1);
			suffix = city.getId().substring(1);
			int next = Integer.parseInt(suffix) + 1;
			DecimalFormat fmtDigits = new DecimalFormat(
					formatPattern.toString());
			suffix = fmtDigits.format(next);
		}
		
		id = prefix + suffix; 
		return id;
		
	}
	public static String genTeamId(List<Team> list) {
		String id = "";

		StringBuilder idBuilder = new StringBuilder();
		/* Add prefix */
		String prefix = AppConstant.PRE_TEAM_ID;
		idBuilder.append(prefix);

		/* Add suffix */
		String suffix = "";
		StringBuilder formatPattern = new StringBuilder();
		for (int i = 0; i < AppConstant.LEN_TEAM_ID - 1; i++) {
			formatPattern.append("0");
		}

		if (list.size() == 0) {
			suffix = formatPattern.toString();
		} else {
			suffix = list.get(list.size() - 1).getId().substring(1);
			int next = Integer.parseInt(suffix) + 1;
			DecimalFormat fmtDigits = new DecimalFormat(
					formatPattern.toString());
			suffix = fmtDigits.format(next);
		}
		
		id = prefix + suffix; 
		return id;
		
	}
	public static String genMatchId(List<Match> list) {
		String id = "";

		StringBuilder idBuilder = new StringBuilder();
		/* Add prefix */
		String prefix = AppConstant.PRE_COUNTRY_ID;
		idBuilder.append(prefix);

		/* Add suffix */
		String suffix = "";
		StringBuilder formatPattern = new StringBuilder();
		for (int i = 0; i < AppConstant.LEN_COUNTRY_ID - 1; i++) {
			formatPattern.append("0");
		}

		if (list.size() == 0) {
			suffix = formatPattern.toString();
		} else {
			suffix = list.get(list.size() - 1).getId().substring(1);
			int next = Integer.parseInt(suffix) + 1;
			DecimalFormat fmtDigits = new DecimalFormat(
					formatPattern.toString());
			suffix = fmtDigits.format(next);
		}
		
		id = prefix + suffix; 
		return id;
	}
	public static String genPlayerId(List<Player> list) {
		String id = "";

		StringBuilder idBuilder = new StringBuilder();
		/* Add prefix */
		String prefix = AppConstant.PRE_PLAYER_ID;
		idBuilder.append(prefix);

		/* Add suffix */
		String suffix = "";
		StringBuilder formatPattern = new StringBuilder();
		for (int i = 0; i < AppConstant.LEN_PLAYER_ID - 1; i++) {
			formatPattern.append("0");
		}

		if (list.size() == 0) {
			suffix = formatPattern.toString();
		} else {
			suffix = list.get(list.size() - 1).getId().substring(1);
			int next = Integer.parseInt(suffix) + 1;
			DecimalFormat fmtDigits = new DecimalFormat(
					formatPattern.toString());
			suffix = fmtDigits.format(next);
		}
		
		id = prefix + suffix; 
		return id;
	}
	public static String genStadiumId(List<Stadium> list) {
		String id = "";

		StringBuilder idBuilder = new StringBuilder();
		/* Add prefix */
		String prefix = AppConstant.PRE_STADIUM_ID;
		idBuilder.append(prefix);

		/* Add suffix */
		String suffix = "";
		StringBuilder formatPattern = new StringBuilder();
		for (int i = 0; i < AppConstant.LEN_STADIUM_ID - 1; i++) {
			formatPattern.append("0");
		}

		if (list.size() == 0) {
			suffix = formatPattern.toString();
		} else {
			suffix = list.get(list.size() - 1).getId().substring(1);
			int next = Integer.parseInt(suffix) + 1;
			DecimalFormat fmtDigits = new DecimalFormat(
					formatPattern.toString());
			suffix = fmtDigits.format(next);
		}
		
		id = prefix + suffix; 
		return id;
		
	}
}
