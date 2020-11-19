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
@Table( name = "bookings")
public class booking implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column(name = "flightid")
	private int flightid;
	
	@Column(name = "bookingemail")
	private String bookingemail;
	
	@Column(name="traveldate")
	@Type(type="date")
	private Date traveldate;
	
	@Column(name = "personsno")
	private int personsno;
	
	@Column(name = "bookingtime")
	private String bookingtime;
	
	@Column(name = "cardno")
	private String cardno;
	
	public booking() {
		super();
	}
	
	public booking(int flightid, String bookingemail, Date traveldate, int personsno, String bookingtime,
			String cardno) {
		super();
		this.flightid = flightid;
		this.bookingemail = bookingemail;
		this.traveldate = traveldate;
		this.personsno = personsno;
		this.bookingtime = bookingtime;
		this.cardno = cardno;
	}

	public int getFlightid() {
		return flightid;
	}

	public void setFlightid(int flightid) {
		this.flightid = flightid;
	}

	public String getBookingemail() {
		return bookingemail;
	}

	public void setBookingemail(String bookingemail) {
		this.bookingemail = bookingemail;
	}

	public Date getTraveldate() {
		return traveldate;
	}

	public void setTraveldate(Date traveldate) {
		this.traveldate = traveldate;
	}

	public int getPersonsno() {
		return personsno;
	}

	public void setPersonsno(int personsno) {
		this.personsno = personsno;
	}

	public String getBookingtime() {
		return bookingtime;
	}

	public void setBookingtime(String bookingtime) {
		this.bookingtime = bookingtime;
	}

	public String getCardno() {
		return cardno;
	}

	public void setCardno(String cardno) {
		this.cardno = cardno;
	}

	public int getId() {
		return id;
	}
	
	
}