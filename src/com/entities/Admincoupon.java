package com.entities;

// Generated 19 Oct, 2023 4:05:56 PM by Hibernate Tools 3.4.0.CR1

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Admincoupon generated by hbm2java
 */
@Entity
@Table(name = "admincoupon", catalog = "perfumer")
public class Admincoupon implements java.io.Serializable {

	private Integer id;
	private String coupon;
	private String value;
	private String mvalue;

	public Admincoupon() {
	}

	public Admincoupon(String coupon, String value, String mvalue) {
		this.coupon = coupon;
		this.value = value;
		this.mvalue = mvalue;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "coupon", length = 100)
	public String getCoupon() {
		return this.coupon;
	}

	public void setCoupon(String coupon) {
		this.coupon = coupon;
	}

	@Column(name = "value", length = 100)
	public String getValue() {
		return this.value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	@Column(name = "mvalue", length = 100)
	public String getMvalue() {
		return this.mvalue;
	}

	public void setMvalue(String mvalue) {
		this.mvalue = mvalue;
	}

}
