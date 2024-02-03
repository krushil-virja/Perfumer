package UserController;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.ProjectConnection;

/**
 * Servlet implementation class newPassword
 */
@WebServlet("/newPassword")
public class newPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public newPassword() {
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
		String newPassword = request.getParameter("newPassword");
		String  cPassword =  request.getParameter("cPassword");
		
		HttpSession session = request.getSession();
		
		if(newPassword != null && cPassword!= null && newPassword.equals(cPassword)){
			
			Connection con = null;
			try {
	
			 con = ProjectConnection.getConnection();
			 PreparedStatement pst = con.prepareStatement("update User set  password=? where email=? ");
			 pst.setString(1 , newPassword);
			 pst.setString(2, (String) session.getAttribute("email")); // get email from forgotPassword.jsp
			 int rowCount = pst.executeUpdate();
			 
			if(rowCount>0){
				response.sendRedirect("Login.jsp?msg=done");
				request.setAttribute("messege", "reset successfully");
				
			}
			else{
				response.sendRedirect("index.jsp");
					
				
			}
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
			
			
		}
		else{
			
			response.sendRedirect("newPassword");
		}
	}

}
