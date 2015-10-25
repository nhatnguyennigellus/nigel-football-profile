package nigel.footballprofile.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;

/**
 * Entity class for Work Log
 * 
 * @author Nigellus
 *
 * Oct 24, 2015 6:34:46 AM
 */
@Entity
@Table(name = "worklogs")
public class WorkLog {
	@Id
	@GeneratedValue
	@Column(name = "id")
	private Integer logId; 
	
	@NotEmpty
	private String description;
	
	@NotEmpty
	private String logType;
	
	@NotEmpty
	private Date datetime;
	
	public WorkLog() {
		// TODO Auto-generated constructor stub
	}

	public Integer getId() {
		return logId;
	}

	public void setId(Integer logId) {
		this.logId = logId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getLogType() {
		return logType;
	}

	public void setLogType(String logType) {
		this.logType = logType;
	}

	public Date getDatetime() {
		return datetime;
	}

	public void setDatetime(Date datetime) {
		this.datetime = datetime;
	}
	
	
}
