package UserController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Userdao.Userdao;
import com.entities.Product;
import com.entities.User;
import com.entities.Usercoupon;

/**
 * Servlet implementation class userCoupon
 */
@WebServlet("/userCoupon")
public class userCoupon extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userCoupon() {
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
		String coupon = request.getParameter("coupon");
		
		Usercoupon uc = new Usercoupon();
		
		Userdao udao = new Userdao();
	User u = udao.getuserbyid(uid);
	
	  uc.setUser(u);
	  uc.setCoupon(coupon);
	  
	  boolean couponMatched = udao.checkCouponMatch(uc);
	  
	  if(couponMatched){
		  udao.addUserCoupon(uc);
		  request.setAttribute("userCoupon", uc.getCoupon());
		  response.sendRedirect("shoping-cart.jsp");
	  }
	  else{
		  response.sendRedirect("shoping-cart.jsp");
	  }
	
		
	
	}

}
