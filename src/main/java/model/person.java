package model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table( name = "persons")
public class person implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "bookingid")
	private int bookingid;
	
	@Column(name = "firstname", length=20)
	private String firstname;

	@Column(name = "lastname", length=20)
	private String lastname;
	
	@Column(name = "gender", length=20)
	private String gender;
	
	@ManyToOne
    private booking booking;
	
	public person() {
		super();
	}
	
	public person(int bookingid, String firstname, String lastname, String gender) {
		super();
		this.bookingid = bookingid;
		this.firstname = firstname;
		this.lastname = lastname;
		this.gender = gender;
	}
	
	public person(int bookingid, String firstname, String lastname, String gender, model.booking booking) {
		super();
		this.bookingid = bookingid;
		this.firstname = firstname;
		this.lastname = lastname;
		this.gender = gender;
		this.booking = booking;
	}

	public int getBookingid() {
		return bookingid;
	}

	public void setBookingid(int bookingid) {
		this.bookingid = bookingid;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public booking getBooking() {
		return booking;
	}

	public void setBooking(booking booking) {
		this.booking = booking;
	}

	@Override
	public String toString() {
		return "person [id=" + id + ", bookingid=" + bookingid + ", firstname=" + firstname + ", lastname=" + lastname
				+ ", gender=" + gender + ", booking=" + booking + "]";
	}
	
}