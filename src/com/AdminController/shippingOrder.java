package com.AdminController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Userdao.Userdao;
import com.entities.Order;

/**
 * Servlet implementation class shippingOrder
 */
@WebServlet("/shippingOrder")
public class shippingOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public shippingOrder() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 int orderid= Integer.parseInt(request.getParameter("id"));
	 
	 Order o = new Order();
	 o.setId(orderid);
	 o.setStatus(3);
	 Userdao udao = new Userdao();
	 
	 udao.shippingOrder(o);
	 response.sendRedirect("admin-shippingOrder.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
