package UserController;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class forgotPassword
 */
@WebServlet("/forgotPassword")
public class forgotPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public forgotPassword() {
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


  String email = request.getParameter("email"); // get user email vai forgotpassword jsp
  int otpvalue=0;
  HttpSession mysession = request.getSession();
	
  
  // now we generate ramdom otp 
  

	  
try {
	  if(email.equals(email)) {
			// sending otp
			Random rand = new Random();
			otpvalue = rand.nextInt(99999);

			 // now we configure email property where we send our otp 
			
			String to = email;// change accordingly
			// Get the session object
			Properties props = new Properties();
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.port", "465");
			Session session = Session.getDefaultInstance(props, new Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("krushil1362002@gmail.com", "xtiwiqilauvfwpei");	// mail send via this email
														
				}
			});
			
			//messege show in mail 
			try {
				
				MimeMessage message = new MimeMessage(session);
					message.setFrom(new InternetAddress(email));// change accordingly
					message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
					message.setSubject("Reset password");
					message.setText("your otp is: " + otpvalue);
					Transport.send(message)	;
					System.out.println("messege send successfully");
					
			} catch (MessagingException e) {
				throw new RuntimeException(e) ;
			}
			
			response.sendRedirect("otp.jsp?msg=done");
			request.setAttribute("messege", "otp is sent on your email id");
			// now we set session of mail id and otp so we can use  this in otp controller 
			mysession.setAttribute("otp", otpvalue);
            mysession.setAttribute("email", email);	
} 
} catch (Exception e) {
	e.printStackTrace();
}
  
 
  

	}
}



