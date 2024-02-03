package com.Userdao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;

import com.connection.ProjectConnection;
import com.entities.Admincoupon;
import com.entities.Cart;
import com.entities.Category;
import com.entities.Checkout;
import com.entities.Contact;
import com.entities.Order;
import com.entities.Product;
import com.entities.Rating;
import com.entities.User;
import com.entities.Usercoupon;
import com.entities.Wishlist;

public class Userdao {

	SessionFactory sf = new Configuration().configure().buildSessionFactory();

	public void doRegister(User u) {

		Session ses = sf.openSession();
		Transaction tr = ses.beginTransaction();
		ses.saveOrUpdate(u);
		tr.commit();
		ses.close();
	}

	public User userlogin(String email, String password) {

		Session ses = sf.openSession();
		Transaction tr = ses.beginTransaction();
		Query query = ses.createQuery("from User where email=: email and password=: password");
		query.setParameter("email", email);
		query.setParameter("password", password);
		User u = (User) query.uniqueResult();
		tr.commit();
		ses.close();
		return u;

	}

	// <======================================= contact method  ====================================================================>

	public void contactUs(Contact c) {

		Session ses = sf.openSession();
		Transaction tr = ses.beginTransaction();
		ses.saveOrUpdate(c);
		tr.commit();
		ses.close();
	}

	// <========================================================== Product
	// ====================================================================>
	public Product getproductbyid(int id) {
		Session ses = sf.openSession();
		Criteria cr = ses.createCriteria(Product.class);
		cr.add(Restrictions.eq("id", id));
		Product p = (Product) cr.uniqueResult();
		return p;
	}

	public Product getproductbyname(String pname) {
		Session ses = sf.openSession();
		Criteria cr = ses.createCriteria(Product.class);
		cr.add(Restrictions.eq("pname", pname));
		Product p = (Product) cr.uniqueResult();
		return p;
	}

	public User getuserbyid(int id) {
		Session ses = sf.openSession();
		Criteria cr = ses.createCriteria(User.class);
		cr.add(Restrictions.eq("id", id));
		User u = (User) cr.uniqueResult();
		return u;
	}

	// <====================================================== Add to Cart
	// =======================================================>

	// add to cart method which we implement in index page where our product div
	// is present and create a hidden form so when user click add to cart we
	// fetch user all detAils
	public void addtocart(Cart c) {
		Session ses = sf.openSession();
		Transaction tr = ses.beginTransaction();
		ses.saveOrUpdate(c);
		tr.commit();
		ses.close();

	}

	// user show cart method

	public List<Cart> viewCart(int uid) {
		Session ses = sf.openSession();
		Query<Cart> query = ses.createQuery("from Cart where uid=:uid", Cart.class);
		query.setParameter("uid", uid);
		return query.getResultList();

	}

	// product qty increase and decrease method and also

	public static void updateCart(int id, int qty, int total) {
		
		try {
			Connection conn = ProjectConnection.getConnection();
			String sql = "update cart set qty=?,total=? where id=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, qty);
			pst.setInt(2, total);
			pst.setInt(3, id);
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public Cart getcartbyid(int id) {
		Session ses = sf.openSession();
		Criteria cr = ses.createCriteria(Cart.class);
		cr.add(Restrictions.eq("id", id));
		Cart c = (Cart) cr.uniqueResult();
		return c;
 
	}

	// cart product price total method
	public double gettotalprice(List<Cart> cartlist) {

		double sum = 0;

		try {
			if (cartlist.size() > 0) {

				for (Cart item : cartlist) {

					Connection con = ProjectConnection.getConnection();
					String sql = "select price from cart where id=?";
					PreparedStatement pst = con.prepareStatement(sql);
					pst.setInt(1, item.getId());
					ResultSet rs = pst.executeQuery();
					while (rs.next()) {
						sum += rs.getDouble("price") * item.getQty();
					}

				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sum;
	}

	public void removeCart(int id) {

		Session ses = sf.openSession();
		Transaction tr = ses.beginTransaction();
		Cart c = ses.get(Cart.class, id);
		ses.delete(c);
		tr.commit();
		ses.close();

	}
	
	public boolean checkCouponMatch(Usercoupon uc){
		
		String enteredCoupon = uc.getCoupon();
		
		try {
			Connection con = ProjectConnection.getConnection();
			String query = "SELECT coupon FROM coupon WHERE coupon=?";
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, enteredCoupon);
			ResultSet resultset = pst.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	


	// <========================================================= wishList ===========================================================>

	public void addWishlist(Wishlist w) {

		Session ses = sf.openSession();
		Transaction tr = ses.beginTransaction();
		ses.saveOrUpdate(w);
		tr.commit();
		ses.close();

	}

	public List<Wishlist> showWishlist(int uid) {

		Session ses = sf.openSession();
		Query<Wishlist> query = ses.createQuery("from Wishlist where uid=:uid", Wishlist.class);
		query.setParameter("uid", uid);
		
		return query.getResultList();

	}
	
	
	/*public List<Order> yourOrder(int uid){
		
		Session ses = sf.openSession();
		Query<Order> query = ses.createQuery("form Order where uid=:uid", Order.class);
		query.setParameter("uid", uid);
		
		return query.getResultList();
	}*/
	
	
	public List<Order> viewYourOrder(int uid){
		
		Session ses = sf.openSession();
		Query<Order> query = ses.createQuery("from Order where uid=:uid", Order.class);
		query.setParameter("uid", uid);
		return query.getResultList();
		
	}

// <========================================================== User Checkout=========================================================>

	public void userCheckout(Checkout c) {

		Session ses = sf.openSession();
		Transaction tr = ses.beginTransaction();
		ses.saveOrUpdate(c);
		tr.commit();
		ses.close();
	}

	public Checkout getCheckoutbyid(int id) {
		Session ses = sf.openSession();
		Criteria cr = ses.createCriteria(Checkout.class);
		cr.add(Restrictions.eq("id", id));
		Checkout ch = (Checkout) cr.uniqueResult();
		return ch;

	}

	public Admincoupon checkCoupon(int id) {

		Session ses = sf.openSession();
		Transaction tr = ses.beginTransaction();
		Query query = ses.createQuery("from Admincoupon where id=?");
		query.setParameter(1, id);
		Admincoupon ac = (Admincoupon) query.uniqueResult();
		return ac;
	}

// <================================================================= order=================================================================>

	public void addOrder(Order o) {

		Session ses = sf.openSession();
		Transaction tr = ses.beginTransaction();
		ses.saveOrUpdate(o);
		tr.commit();
		ses.close();

	}

	public List<Order> showAllOrder() {
		Session ses = sf.openSession();
		Criteria cr = ses.createCriteria(Order.class);
		List<Order> list = cr.list();
		return list;
	}

	public void activeOrder(Order o) {
		Session ses = sf.openSession();
		Transaction tr = ses.beginTransaction();
		Query query = ses.createQuery("UPDATE Order set status=:status " + " where id= :id");
		query.setParameter("status", 2);
		query.setParameter("id", o.getId());
		int result = query.executeUpdate();
		System.out.println("row affected: " + result);
		tr.commit();
		ses.close();

	}

	public void shippingOrder(Order o) {

		Session ses = sf.openSession();
		Transaction tr = ses.beginTransaction();
		Query query = ses.createQuery("UPDATE Order set status= :status " + " where id= :id");
		query.setParameter("status", 3);
		query.setParameter("id", o.getId());
		int result = query.executeUpdate();
		System.out.println("row affected: " + result);
		tr.commit();
		ses.close();

	}
	
	public void deliveredOrder(Order o ){
		
		Session ses =sf.openSession();
		Transaction tr = ses.beginTransaction();
		Query query = ses.createQuery("UPDATE Order set status= :status "+" where id= :id");
		query.setParameter("status", 4);
		query.setParameter("id", o.getId());
		int result = query.executeUpdate();
		System.out.println("row affected: " + result);
		tr.commit();
		ses.close();
	}
	
	
	
	public void addUserCoupon(Usercoupon uc){
		Session ses = sf.openSession();
		Transaction tr = ses.beginTransaction();
		ses.saveOrUpdate(uc);
		tr.commit();
		ses.close();
		
	}
	
	
	public List<Product> showLatestProduct(){
		
		    Session ses = sf.openSession();
		    Transaction tr = ses.beginTransaction();
		    Query<Product> query = ses.createQuery("FROM Product ORDER BY timedurestion DESC");
		    query.setMaxResults(3);
		    List<Product> list = query.getResultList();
		    tr.commit();
		    ses.close();
		    return list;
	}
	
	
	
	public void userRating(Rating r){
		
		Session ses = sf.openSession();
		Transaction tr = ses.beginTransaction();
		ses.saveOrUpdate(r);
		tr.commit();
		ses.close();
	}
	
	
	
	

}
