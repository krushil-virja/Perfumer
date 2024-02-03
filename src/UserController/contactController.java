package UserController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Userdao.Userdao;
import com.entities.Contact;

/**
 * Servlet implementation class contactController
 */
@WebServlet("/contactController")
public class contactController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String messege = request.getParameter("messege");
		
		Contact c = new Contact();
		c.setName(name);
		c.setEmail(email);
		c.setMessege(messege);
		
		Userdao udao = new Userdao();
		udao.contactUs(c);
		
		response.sendRedirect("index.jsp");
		
	}

}
