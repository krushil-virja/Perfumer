package com.AdminController;

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
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.admindao.Admindao;
import com.entities.Category;
import com.entities.Product;

/**
 * Servlet implementation class updateCategory
 */
@WebServlet("/updateCategory")
@MultipartConfig

public class updateCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	Category c = new Category();
	Admindao adao = new Admindao();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateCategory() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id =  Integer.parseInt(request.getParameter("id"));
		
		c = adao.getcategorybyid(id);
		
		HttpSession session = request.getSession();
		session.setAttribute("c", c);
		
		response.sendRedirect("admin-UpdateCategory.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		String cname = request.getParameter("cname");
		Part cimage = request.getPart("cimage");
		
		c.setId(id);
		c.setCname(cname);
		c.setCimage(cimage.getSubmittedFileName());
		
		adao.addCategory(c);
		
		String path = request.getRealPath("img")+File.separator+"categories"+File.separator+cimage.getSubmittedFileName();
		System.out.println(path);
		FileOutputStream fos = new FileOutputStream(path);
		InputStream is = cimage.getInputStream();
		byte [] data = new byte[is.available()];
		is.read(data);
		fos.write(data);
		fos.close();
		
		response.sendRedirect("admin-Category.jsp");
	}

}
