package UserController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Userdao.Userdao;
import com.admindao.Admindao;
import com.entities.Cart;
import com.entities.Product;
import com.entities.User;

/**
 * Servlet implementation class addToCart
 */
@WebServlet("/addToCart")
public class addToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addToCart() {
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
	
		
		int uid = Integer.parseInt(request.getParameter("id"));
		int pid = Integer.parseInt(request.getParameter("pid"));
		String pname = request.getParameter("pname");
		int qty = Integer.parseInt(request.getParameter("qty"));
		int price = Integer.parseInt(request.getParameter("price"));
		
		int total = price *qty;
		
		
		
	 Cart c = new Cart();
	 Userdao udao = new Userdao();
	Product p =  udao.getproductbyid(pid);
	
	User u = udao.getuserbyid(uid);
	
	
	
	
	c.setProduct(p);
	c.setPname(pname);
	c.setUser(u);
	c.setQty(qty);
	c.setPrice(price);
	c.setTotal(total);
	
	udao.addtocart(c);
	
	response.sendRedirect("shoping-cart.jsp");

	}

}

