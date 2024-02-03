package UserController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Userdao.Userdao;
import com.admindao.Admindao;
import com.entities.Checkout;
import com.entities.Product;
import com.entities.User;

/**
 * Servlet implementation class Order
 */
@WebServlet("/Order")
public class Order extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Order() {
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
		int uid = Integer.parseInt(request.getParameter("uid"));
		int pid = Integer.parseInt(request.getParameter("pid"));
		int cid = Integer.parseInt(request.getParameter("cid"));
	    int qty = Integer.parseInt(request.getParameter("qty")); 
	    int amount = Integer.parseInt(request.getParameter("amount"));
	    int status = Integer.parseInt(request.getParameter("status"));
	    String date = request.getParameter("date");
	
	
	com.entities.Order o = new com.entities.Order();
	
	Admindao adao = new Admindao();
	Product p = adao.getbetailsbyid(pid);
	
	Userdao udao = new Userdao();
	User u =udao.getuserbyid(uid);
	Checkout ch =udao.getCheckoutbyid(cid);
	
	
	o.setUser(u);
	o.setProduct(p);
	o.setCheckout(ch);
	o.setQty(qty);
	o.setAmount(amount);
	o.setStatus(status);
	o.setDate(date);
	
	udao.addOrder(o);
	response.sendRedirect("index.jsp");
	
	
	
	}

}
