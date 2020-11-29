package model;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
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
	
	@Column(name = "userid")
	private int userid;
	
	@Column(name = "bookingemail", length=30)
	private String bookingemail;
	
	@Column(name="traveldate")
	@Type(type="date")
	private Date traveldate;
	
	@Column(name = "personsno")
	private int personsno;
	
	@OneToMany(cascade=CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name="personid")
	private Set<person> persons;
	
	@OneToOne(cascade=CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name="fid")
	private flight flight;
	
	@Column(name = "bookingtime", length=20)
	private String bookingtime;
	
	@Column(name = "cardno", length=20)
	private String cardno;
	
	public booking() {
		super();
	}

	public booking(int flightid, int userid, String bookingemail, Date traveldate, int personsno, model.flight flight, String bookingtime,
			String cardno) {
		super();
		this.flightid = flightid;
		this.userid = userid;
		this.bookingemail = bookingemail;
		this.traveldate = traveldate;
		this.personsno = personsno;
		this.flight = flight;
		this.bookingtime = bookingtime;
		this.cardno = cardno;
	}
	
	public booking(int flightid, int userid, String bookingemail, Date traveldate, int personsno, Set<person> persons,
			String bookingtime, String cardno) {
		super();
		this.flightid = flightid;
		this.userid = userid;
		this.bookingemail = bookingemail;
		this.traveldate = traveldate;
		this.personsno = personsno;
		this.persons = persons;
		this.bookingtime = bookingtime;
		this.cardno = cardno;
	}
	
	public booking(int flightid, int userid, String bookingemail, Date traveldate, int personsno, Set<person> persons,
			model.flight flight, String bookingtime, String cardno) {
		super();
		this.flightid = flightid;
		this.userid = userid;
		this.bookingemail = bookingemail;
		this.traveldate = traveldate;
		this.personsno = personsno;
		this.persons = persons;
		this.flight = flight;
		this.bookingtime = bookingtime;
		this.cardno = cardno;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getFlightid() {
		return flightid;
	}

	public void setFlightid(int flightid) {
		this.flightid = flightid;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
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

	public Set<person> getPersons() {
		return persons;
	}

	public void setPersons(Set<person> persons) {
		this.persons = persons;
	}
	
	public flight getFlight() {
		return flight;
	}

	public void setFlight(flight flight) {
		this.flight = flight;
	}

	@Override
	public String toString() {
		return "booking [id=" + id + ", flightid=" + flightid + ", userid=" + userid + ", bookingemail=" + bookingemail
				+ ", traveldate=" + traveldate + ", personsno=" + personsno + ", persons=" + persons + ", bookingtime="
				+ bookingtime + ", cardno=" + cardno + "]";
	}
	
	
}