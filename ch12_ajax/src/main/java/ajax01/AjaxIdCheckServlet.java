package ajax01;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ajax01/idCheck.me")
public class AjaxIdCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("checkId");
		MemberDao mem = new MemberDao();
		boolean result = mem.checkId(id);
		
		if(result) response.getWriter().print("No");
		else response.getWriter().print("Yes");
	}
}
