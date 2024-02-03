	package UserController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Userdao.Userdao;
import com.entities.Checkout;
import com.entities.User;

/**
 * Servlet implementation class userCheckout
 */
@WebServlet("/userCheckout")
public class userCheckout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userCheckout() {
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
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String contact = request.getParameter("contact");
		String pincode = request.getParameter("pincode");
		String state = request.getParameter("state");
		String country = request.getParameter("country");
		String  landmark = request.getParameter("landmark");
		String address = request.getParameter("address");
		
		
		Checkout c = new Checkout();
		Userdao udao = new Userdao();
		User u = udao.getuserbyid(uid);
		
		c.setUser(u);
		c.setName(name);
		c.setEmail(email);
		c.setContact(contact);
		c.setPincode(pincode);
		c.setState(state);
		c.setCountry(country);
		c.setLandmark(landmark);
		c.setAddress(address);
		
		udao.userCheckout(c);
		HttpSession ses = request.getSession();
		ses.setAttribute("checkout", c);
		
		response.sendRedirect("order.jsp");
	    
		
	} 

}
