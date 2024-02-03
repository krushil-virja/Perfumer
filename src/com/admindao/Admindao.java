 package com.admindao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;

import com.connection.ProjectConnection;
import com.entities.Admin;
import com.entities.Admincoupon;
import com.entities.Category;
import com.entities.Contact;
import com.entities.Product;
import com.entities.User;

@SuppressWarnings("deprecation")
public class Admindao {

	SessionFactory sf = new Configuration().configure().buildSessionFactory();

	// <============================================ ADMIN LOGIN  ===================================================================================>
	public Admin AdminLogin(String email, String password) {

		Session ses = sf.openSession();
		Transaction tr = ses.beginTransaction();
		Query query = ses.createQuery("from Admin where email=:email and password=:password");
		query.setParameter("email", email);
		query.setParameter("password", password);
		Admin a = (Admin) query.uniqueResult();
		tr.commit();
		ses.close();
		return a;

	}

	// <=============================================== CATEGORY  ==================================================================================>

	// ** add Category **
	public void addCategory(Category c) {

		Session ses = sf.openSession();
		Transaction tr = ses.beginTransaction();
		ses.saveOrUpdate(c);
		tr.commit();
		ses.close();
	}

	// ** show category **

	public List<Category> showCategory() {

		Session ses = sf.openSession();
		Criteria cr = ses.createCriteria(Category.class);
		List<Category> list = cr.list();
		return list;
	}

	public Category getcategorybyname(String cname) {
		Session ses = sf.openSession();
		Criteria cr = ses.createCriteria(Category.class);
		cr.add(Restrictions.eq("cname", cname));
		Category c = (Category) cr.uniqueResult();
		return c;
	}

	public Category getcategorybyid(int id) {
		Session ses = sf.openSession();
		Criteria cr = ses.createCriteria(Category.class);
		cr.add(Restrictions.eq("id", id));
		Category c = (Category) cr.uniqueResult();
		return c;
	}

	
	public void deleteCategory(int id){
		
		Session ses = sf.openSession();
		Transaction tr = ses.beginTransaction();
		Category c = ses.get(Category.class, id);
		ses.delete(c);
		tr.commit();
		ses.close();
	}
	
	public Category getCategoryById(int id){
		
		Session ses = sf.openSession();
		Criteria cr = ses.createCriteria(Category.class);
		cr.add(Restrictions.eq("id", id));
		Category c = (Category) cr.uniqueResult();
		return c;
	}
	// <================================================= Product ====================================================================================>

	public void addProduct(Product p) {

		Session ses = sf.openSession();
		Transaction tr = ses.beginTransaction();
		ses.saveOrUpdate(p);
		tr.commit();
		ses.close();

	}

	// ** show product **

	public List<Product> showProduct() {

		Session ses = sf.openSession();
		Criteria cr = ses.createCriteria(Product.class);
		List<Product> list = cr.list();
		return list;
	}

	


	// ** delete product **

	public void deleteProduct(int id) {

		Session ses = sf.openSession();
		Transaction tr = ses.beginTransaction();
		Product p = ses.get(Product.class, id);
		ses.delete(p);
		tr.commit();
		ses.close();

	}
	
	// ** update product **
	
	public Product getProductById(int id){
		
		Session ses = sf.openSession();
		Criteria cr = ses.createCriteria(Product.class);
		cr.add(Restrictions.eq("id", id));
		Product p = (Product) cr.uniqueResult();
		return p;
	}

	// **  update product (by misteck create 2 method for update)
	public Product updatebyid(int id) {

		Session ses = sf.openSession();
		Criteria cr = ses.createCriteria(Product.class);
		cr.add(Restrictions.eq("id", id));
		Product p = (Product) cr.uniqueResult();
		return p;
	}

	public Product getbetailsbyid(int id) {
		Session ses = sf.openSession();
		Criteria cr = ses.createCriteria(Product.class);
		cr.add(Restrictions.eq("id", id));
		Product p = (Product) cr.uniqueResult();
		return p;

	}

	// <============================================== Coupon
	// ============================================================>

	// add coupon method admin side

	public void addCoupon(Admincoupon ac) {

		Session ses = sf.openSession();
		Transaction tr = ses.beginTransaction();
		ses.saveOrUpdate(ac);
		tr.commit();
		ses.close();
	}

	public List<Admincoupon> showCoupon() {

		Session ses = sf.openSession();
		Criteria cr = ses.createCriteria(Admincoupon.class);
		List<Admincoupon> list = cr.list();
		return list;
	}

	// <====================================== All Inquiry ================================================================>

	public List<Contact> showInquiry() {

		Session ses = sf.openSession();
		Criteria cr = ses.createCriteria(Contact.class);
		List<Contact> list = cr.list();
		return list;
	}

}
