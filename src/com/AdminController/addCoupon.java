package com.AdminController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.admindao.Admindao;
import com.entities.Admincoupon;

/**
 * Servlet implementation class addCoupon
 */
@WebServlet("/addCoupon")
public class addCoupon extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addCoupon() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String  coupon = request.getParameter("coupon");
		String value = request.getParameter("value");
		String mvalue = request.getParameter("mvalue");
		
		Admincoupon ac = new Admincoupon();
		ac.setCoupon(coupon);
		ac.setValue(value);
		ac.setMvalue(mvalue);
		
		Admindao adao = new Admindao();
		adao.addCoupon(ac);
		
		response.sendRedirect("admin-addCoupon.jsp");
	}

}
