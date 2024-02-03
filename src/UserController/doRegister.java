package UserController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Userdao.Userdao;
import com.entities.User;

/**
 * Servlet implementation class doRegister
 */
@WebServlet("/doRegister")
public class doRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public doRegister() {
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
		
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		long number  = Long.parseLong(request.getParameter("number"));
		String address = request.getParameter("address");
		String state = request.getParameter("state");
		String country = request.getParameter("country");
		int pincode = Integer.parseInt(request.getParameter("pincode"));
		
		User u = new User();
		u.setName(name);
		u.setEmail(email);
		u.setPassword(password);
		u.setNumber(number);
		u.setAddress(address);
		u.setState(state);
		u.setCountry(country);
		u.setPincode(pincode);
		
		
		Userdao udao = new Userdao();
		udao.doRegister(u);
		
		response.sendRedirect("contact.jsp");
	}

}
