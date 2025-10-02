package ch04;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet05 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id= request.getParameter("id");
		String pw= request.getParameter("pw");
		
		response.setContentType("text/html; charset=UTF-8");
		
		if(id!=null && pw!=null) {
			HttpSession session = request.getSession();  
			session.setAttribute("idkey",id);
			session.setMaxInactiveInterval(1);
		}
		
		response.sendRedirect("05.login.jsp");
		
	}

}
