package UserController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class otp
 */
@WebServlet("/otp")
public class otp extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public otp() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException {
		int userotp = Integer.parseInt(request.getParameter("otp"));
      HttpSession session = request.getSession();
		// otp which we store in forgotpassword.jsp (mail otp)
      int otp =  (int) session.getAttribute("otp");
      
      
      if(userotp==otp){
    	  System.out.println("otp"+otp);
		   request.setAttribute("email", request.getParameter("email"));
		   request.setAttribute("messege", "success");
    	  response.sendRedirect("newPassword.jsp");
    	  
      }
      else{
    	  
    	  response.sendRedirect("otp.jsp");
    	  request.setAttribute("messege", "please enter valid otp");
    	  
    	  
      }
      
      
	}

}
