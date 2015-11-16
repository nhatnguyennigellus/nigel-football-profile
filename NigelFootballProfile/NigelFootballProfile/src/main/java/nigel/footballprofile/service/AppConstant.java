package nigel.footballprofile.service;

/**
 * Constant for this application
 * 
 * @author Nigellus
 *
 * Oct 24, 2015 1:58:19 PM
 */
public class AppConstant {
	/**
	 * Prefix
	 */
	static public String PRE_COUNTRY_ID = "L";
	static public String PRE_CITY_ID = "C";
	static public String PRE_STADIUM_ID = "S";
	static public String PRE_PLAYER_ID = "P";
	static public String PRE_MATCH_ID = "M";
	static public String PRE_TEAM_ID = "T";
	
	/**
	 * ID Length
	 */
	static public int LEN_COUNTRY_ID = 5;
	static public int LEN_CITY_ID = 5;
	static public int LEN_STADIUM_ID = 5;
	static public int LEN_PLAYER_ID = 8;
	static public int LEN_MATCH_ID = 8;
	static public int LEN_TEAM_ID = 7;
	
	/**
	 * Team State
	 */
	static public String LEAGUE_CHAMP = "LCHMP";
	static public String LEAGUE_CL_DIRECT = "LCLDR";
	static public String LEAGUE_CL_QUALIFIERS = "LCLQL";
	static public String LEAGUE_EL_DIRECT = "LELDR";
	static public String LEAGUE_EL_QUALIFIERS = "LELQL";
	static public String LEAGUE_NORMAL = "LNORM";
	static public String LEAGUE_PLAY_OFF = "LPOFF";
	static public String LEAGUE_RELEGATION = "LRLGN";
	
	static public String TOUR_GROUP_STAGE = "TGRST";
	static public String TOUR_ELIMINATED = "TELMD";
	static public String TOUR_ROUND_OF_16 = "TRO16";
	static public String TOUR_QUARTER_FINAL = "T14FN";
	static public String TOUR_SEMI_FINAL = "T12FN";
	static public String TOUR_FINAL = "TFINL";
	static public String TOUR_THIRD_PLACE = "T3PLC";
	
	static public String CUP_ROUND_OF_64 = "CRO64";
	static public String CUP_ROUND_OF_32 = "CRO32";
	static public String CUP_ROUND_OF_16 = "CRO16";
	static public String CUP_QUARTER_FINAL = "C14FN";
	static public String CUP_SEMI_FINAL = "C12FN";
	static public String CUP_FINAL = "CFINL";
	
	/**
	 * Work Log Type
	 */
	static public String WLOG_ADD = "ADDI";
	static public String WLOG_UPDATE = "UPDT";
	static public String WLOG_SUBMIT_SCORE = "SSCR";
	static public String WLOG_IMPORT = "IMPT";
	static public String WLOG_SUBMIT_QUALIFIERS = "SQLR";
	// more
	
	/**
	 * Team Type
	 */
	static public String TEAM_CLUB = "TCLUB";
	static public String TEAM_NATIONAL = "TNATL";
	
	/**
	 * Championship Formula
	 */
	static public String CHAMP_FORM_TOUR = "FTOUR";
	static public String CHAMP_FORM_LEAGUE = "FLEAG";
	static public String CHAMP_FORM_PLAY_OFF = "FPOFF";
}
