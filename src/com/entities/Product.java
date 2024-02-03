package com.entities;

// Generated 19 Oct, 2023 4:05:56 PM by Hibernate Tools 3.4.0.CR1

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Product generated by hbm2java
 */
@Entity
@Table(name = "product", catalog = "perfumer")
public class Product implements java.io.Serializable {

	private Integer id;
	private Category category;
	private String pname;
	private String pimage1;
	private String pbrand;
	private Integer price;
	private String discription;
	private String information;
	private String pimage2;
	private String pimage3;
	private String pimage4;
	private String timedurestion;
	private Set<Order> orders = new HashSet<Order>(0);
	private Set<Cart> carts = new HashSet<Cart>(0);
	private Set<Rating> ratings = new HashSet<Rating>(0);
	private Set<Wishlist> wishlists = new HashSet<Wishlist>(0);

	public Product() {
	}

	public Product(Category category, String pname, String pimage1, String pbrand, Integer price, String discription,
			String information, String pimage2, String pimage3, String pimage4, String timedurestion,
			Set<Order> orders, Set<Cart> carts, Set<Rating> ratings, Set<Wishlist> wishlists) {
		this.category = category;
		this.pname = pname;
		this.pimage1 = pimage1;
		this.pbrand = pbrand;
		this.price = price;
		this.discription = discription;
		this.information = information;
		this.pimage2 = pimage2;
		this.pimage3 = pimage3;
		this.pimage4 = pimage4;
		this.timedurestion = timedurestion;
		this.orders = orders;
		this.carts = carts;
		this.ratings = ratings;
		this.wishlists = wishlists;
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

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "cid")
	public Category getCategory() {
		return this.category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	@Column(name = "pname", length = 100)
	public String getPname() {
		return this.pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	@Column(name = "pimage1", length = 100)
	public String getPimage1() {
		return this.pimage1;
	}

	public void setPimage1(String pimage1) {
		this.pimage1 = pimage1;
	}

	@Column(name = "pbrand", length = 100)
	public String getPbrand() {
		return this.pbrand;
	}

	public void setPbrand(String pbrand) {
		this.pbrand = pbrand;
	}

	@Column(name = "price")
	public Integer getPrice() {
		return this.price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	@Column(name = "discription", length = 2000)
	public String getDiscription() {
		return this.discription;
	}

	public void setDiscription(String discription) {
		this.discription = discription;
	}

	@Column(name = "information", length = 2000)
	public String getInformation() {
		return this.information;
	}

	public void setInformation(String information) {
		this.information = information;
	}

	@Column(name = "pimage2", length = 100)
	public String getPimage2() {
		return this.pimage2;
	}

	public void setPimage2(String pimage2) {
		this.pimage2 = pimage2;
	}

	@Column(name = "pimage3", length = 100)
	public String getPimage3() {
		return this.pimage3;
	}

	public void setPimage3(String pimage3) {
		this.pimage3 = pimage3;
	}

	@Column(name = "pimage4", length = 100)
	public String getPimage4() {
		return this.pimage4;
	}

	public void setPimage4(String pimage4) {
		this.pimage4 = pimage4;
	}

	@Column(name = "timedurestion", length = 100)
	public String getTimedurestion() {
		return this.timedurestion;
	}

	public void setTimedurestion(String timedurestion) {
		this.timedurestion = timedurestion;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "product")
	public Set<Order> getOrders() {
		return this.orders;
	}

	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "product")
	public Set<Cart> getCarts() {
		return this.carts;
	}

	public void setCarts(Set<Cart> carts) {
		this.carts = carts;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "product")
	public Set<Rating> getRatings() {
		return this.ratings;
	}

	public void setRatings(Set<Rating> ratings) {
		this.ratings = ratings;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "product")
	public Set<Wishlist> getWishlists() {
		return this.wishlists;
	}

	public void setWishlists(Set<Wishlist> wishlists) {
		this.wishlists = wishlists;
	}

}
