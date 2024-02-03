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
import com.entities.Product;

/**
 * Servlet implementation class addProduct
 */
@WebServlet("/addProduct")
@MultipartConfig
public class addProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addProduct() {
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
		
		String pname= request.getParameter("pname");
		String cname = request.getParameter("cname");
		Part pimage1 = request.getPart("pimage1");
		Part pimage2 = request.getPart("pimage2");
		Part pimage3 = request.getPart("pimage3");
		Part pimage4 = request.getPart("pimage4");
		String pbrand =  request.getParameter("pbrand");
		String timedurestion = request.getParameter("timedurestion");
		int price = Integer.parseInt(request.getParameter("price"));
		
		String discription = request.getParameter("discription");
		String information = request.getParameter("information");
		
		Product p = new Product();
		Admindao adao = new Admindao();
		Category c = adao.getcategorybyname(cname);
		
		p.setCategory(c);
		p.setPname(pname);
		p.setPimage1(pimage1.getSubmittedFileName());
		p.setPimage2(pimage2.getSubmittedFileName());
		p.setPimage3(pimage3.getSubmittedFileName());
		p.setPimage4(pimage4.getSubmittedFileName());
		p.setPbrand(pbrand);
		p.setPrice(price);
		p.setTimedurestion(timedurestion);
		p.setDiscription(discription);
		p.setInformation(information);
		
		String path1 = request.getRealPath("img")+File.separator+"product"+File.separator+pimage1.getSubmittedFileName();
		System.out.println(path1);
		FileOutputStream fos1 = new FileOutputStream(path1);
		InputStream is1 = pimage1.getInputStream();
		byte [] data1 = new byte[is1.available()];
		is1.read(data1);
		fos1.write(data1); 
		fos1.close();
		
		String path2 = request.getRealPath("img")+File.separator+"product"+File.separator+pimage2.getSubmittedFileName();
		System.out.println(path2);
		FileOutputStream fos2 = new FileOutputStream(path2);
		InputStream is2 = pimage2.getInputStream();
		byte [] data2 = new byte[is2.available()];
		is2.read(data2);
		fos2.write(data2); 
		fos2.close();
		
		String path3 = request.getRealPath("img")+File.separator+"product"+File.separator+pimage3.getSubmittedFileName();
		System.out.println(path3);
		FileOutputStream fos3 = new FileOutputStream(path3);
		InputStream is3 = pimage3.getInputStream();
		byte [] data3 = new byte[is3.available()];
		is3.read(data3);
		fos3.write(data3); 
		fos3.close();
		
		String path4 = request.getRealPath("img")+File.separator+"product"+File.separator+pimage4.getSubmittedFileName();
		System.out.println(path4);
		FileOutputStream fos4 = new FileOutputStream(path4);
		InputStream is4 = pimage4.getInputStream();
		byte [] data4 = new byte[is4.available()];
		is4.read(data4);
		fos4.write(data4); 
		fos4.close();
		
		
		adao.addProduct(p);
		response.sendRedirect("admin-Product.jsp");
	}

}
