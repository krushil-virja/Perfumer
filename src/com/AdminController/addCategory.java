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
import javax.servlet.http.Part;

import com.admindao.Admindao;
import com.entities.Category;

/**
 * Servlet implementation class addCategory
 */
@WebServlet("/addCategory")
@MultipartConfig
public class addCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addCategory() {
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
		String cname = request.getParameter("cname");
		Part cimage = request.getPart("cimage");
		
		Category c = new Category();
		c.setCname(cname);
		c.setCimage(cimage.getSubmittedFileName());
		
		
		
		String path = request.getRealPath("img")+File.separator+"categories"+File.separator+cimage.getSubmittedFileName();
		System.out.println(path);
		FileOutputStream fos = new FileOutputStream(path);
		InputStream is = cimage.getInputStream();
		byte [] data = new byte[is.available()];
		is.read(data);
		fos.write(data); 
		fos.close();
		
		
		Admindao adao = new Admindao();
		adao.addCategory(c);
		
		response.sendRedirect("admin-Category.jsp");
	}

}
