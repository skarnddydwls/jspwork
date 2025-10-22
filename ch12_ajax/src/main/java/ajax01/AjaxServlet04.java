package ajax01;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ajax01/ajax4.do")
public class AjaxServlet04 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id= request.getParameter("id");
		
		MemberDao md = new MemberDao();
		Member m = new Member();
		
		m = md.SearchId(id);
		
		// JSONObject ({key: value, key: valeu...)}
		
		// 2.
		/*
		JSONObject jObj = new JSONObject();
		if(m.getId() == null) { // m으로 하게되면 주소가 들어가서 null이 안 나오는 듯
			jObj.put("status", "fail");
			jObj.put("message", "안녕");
		} else {
			jObj.put("id",m.getId());
			jObj.put("name",m.getName());
			jObj.put("gender",m.getGender());
			jObj.put("email",m.getEmail());
		}
		
		response.setContentType("application/json; charset=UTF8");
		response.getWriter().print(jObj);
		*/
		
		
		// 3.
		// GSON: 객체를 알아서 JSONObject로 변경해줌
		//Gson gson = new Gson();
		// toJson(응답할 자바객체, 응답할 스트림);
		//gson.toJson(m, response.getWriter());
		
		// 위의 두 줄을 한 줄로
		/*
		 * response.setContentType("application/json; charset=UTF8"); // json으로 보내려면 이거
		 * 있어야 됨 new Gson().toJson(m, response.getWriter());
		 */
		
		// 4. GSON으로 fail과 success 넣기
		response.setContentType("application/json; charset=UTF8");
		Gson gson = new Gson();
		
		if(m.getId() == null) {
			Map<String, String> result = new HashMap<>();
			result.put("status", "fail");
			result.put("message", "해당 id를 찾을 수 없습니다.");
			gson.toJson(result, response.getWriter());
		} else {
			Map<String, Object> result = new HashMap<>();
			result.put("status", "success");
			result.put("member", m);
			gson.toJson(result, response.getWriter());
		}
	}
}
















