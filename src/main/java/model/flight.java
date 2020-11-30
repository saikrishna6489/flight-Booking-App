package model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Type;

@Entity
@Table( name = "flights")
public class flight implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "flightno", length=20)
	private String flightno;
	
	@Column(name = "airline", length=20)
	private String airline;
	
	@Column(name="traveldate")
	@Type(type="date")
	private Date traveldate;
	
	@Column(name = "starttime", length=10)
	private String starttime;
	
	@Column(name = "endtime", length=10)
	private String endtime;
	
	@Column(name = "source", length=20)
	private String source;
	
	@Column(name = "destination", length=20)
	private String destination;
	
	@Column(name = "ticketprice", length=10)
	private String ticketprice;
	
	@Column(name = "duration", length=10)
	private String duration;
	
	public flight() {
		super();
	}

	

	public flight(int id, String flightno, String airline, Date traveldate, String starttime,
			String endtime, String source, String destination, String ticketprice, String duration) {
		super();
		this.id = id;
		this.flightno = flightno;
		this.airline = airline;
		this.traveldate = traveldate;
		this.starttime = starttime;
		this.endtime = endtime;
		this.source = source;
		this.destination = destination;
		this.ticketprice = ticketprice;
		this.duration = duration;
	}



	public flight(String flightno, String airline, Date traveldate, String starttime, String endtime,
			String source, String destination, String ticketprice, String duration) {
		super();
		this.flightno = flightno;
		this.airline = airline;
		this.traveldate = traveldate;
		this.starttime = starttime;
		this.endtime = endtime;
		this.source = source;
		this.destination = destination;
		this.ticketprice = ticketprice;
		this.duration = duration;
	}
	

	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getFlightno() {
		return flightno;
	}


	public void setFlightno(String flightno) {
		this.flightno = flightno;
	}


	public String getAirline() {
		return airline;
	}


	public void setAirline(String airline) {
		this.airline = airline;
	}


	public Date getTraveldate() {
		return traveldate;
	}


	public void setTraveldate(Date traveldate) {
		this.traveldate = traveldate;
	}
	

	public String getStarttime() {
		return starttime;
	}


	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}


	public String getEndtime() {
		return endtime;
	}


	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}


	public String getSource() {
		return source;
	}


	public void setSource(String source) {
		this.source = source;
	}


	public String getDestination() {
		return destination;
	}


	public void setDestination(String destination) {
		this.destination = destination;
	}


	public String getTicketprice() {
		return ticketprice;
	}


	public void setTicketprice(String ticketprice) {
		this.ticketprice = ticketprice;
	}


	public String getDuration() {
		return duration;
	}


	public void setDuration(String duration) {
		this.duration = duration;
	}


	@Override
	public String toString() {
		return "flight [id=" + id + ", flightno=" + flightno + ", airline=" + airline + ", traveldate=" + traveldate
				 + ", starttime=" + starttime + ", endtime=" + endtime + ", source="
				+ source + ", destination=" + destination + ", ticketprice=" + ticketprice + ", duration=" + duration
				+ "]";
	}
	
	
	
}