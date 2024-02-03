package UserController;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.Userdao.Userdao;
import com.admindao.Admindao;
import com.entities.Product;
import com.entities.User;
import com.entities.Wishlist;

/**
 * Servlet implementation class addToWishlist
 */
@WebServlet("/addToWishlist")
@MultipartConfig
public class addToWishlist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addToWishlist() {
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
	 
		int pid = Integer.parseInt(request.getParameter("pid"));
		int uid = Integer.parseInt(request.getParameter("uid"));
		String price =request.getParameter("price");
		
		Admindao adao = new Admindao();
		Product p = adao.getbetailsbyid(pid);
		
		Userdao udao = new Userdao();
		User u = udao.getuserbyid(uid);
		
		Wishlist w = new Wishlist();
		w.setProduct(p);
		w.setUser(u);
		
		w.setPrice(price);
		
		udao.addWishlist(w);
		response.sendRedirect("wishList.jsp");
		
		
	
		
		
	}

}
