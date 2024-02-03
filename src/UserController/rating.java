package UserController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Userdao.Userdao;
import com.admindao.Admindao;
import com.entities.Product;
import com.entities.Rating;
import com.entities.User;

/**
 * Servlet implementation class rating
 */
@WebServlet("/rating")
public class rating extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public rating() {
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
		int rating = Integer.parseInt(request.getParameter("rating"));
		String opinion = request.getParameter("opinion");
		
		
		Admindao adao = new Admindao();
		Userdao udao = new Userdao();
		Product p = adao.getProductById(pid);
		User u = udao.getuserbyid(uid);
		
		Rating r = new Rating();
		r.setUser(u);
		r.setProduct(p);
		r.setRating(rating);
		r.setOpinion(opinion);
		
		udao.userRating(r);
		response.sendRedirect("ProductDetails.jsp");
		
}
}
