package sub1;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/*
	서블릿 등록(주소맵핑)
*/
@WebServlet(urlPatterns = "/greeting.do")
public class GreetingServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	@Override
	public void init() throws ServletException {
		// 서블릿이 최초 요청될때 한번만 실행
		System.out.println("GreetingServlet init...");
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// GET 요청 처리
		System.out.println("GreetingServlet doGet...");
		
		// HTML 생성
		resp.setContentType("text/html;charset=UTF-8");
		
		PrintWriter writer = resp.getWriter();
		writer.println("<html>");
		writer.println("<head>");
		writer.println("<meta charset='UTF-8'/>");
		writer.println("<title>GreetingServlet</title>");
		writer.println("</head>");
		writer.println("<body>");
		writer.println("<h3>GreetingServlet</h3>");
		writer.println("<a href='./1_ServletTest.jsp'>메인</a>");
		writer.println("<a href='./hello.do'>HelloServlet</a>");
		writer.println("<a href='./welcome.do'>WelcomeServlet</a>");
		writer.println("<a href='./greeting.do'>GreetingServlet</a>");
		writer.println("</body>");		
		writer.println("</html>");
		writer.close();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// POST 요청 처리
	}
	
	@Override
	public void destroy() {
		// 서블릿이 종료될때(WAS 종료될때)
		System.out.println("GreetingServlet destroy...");
	}
}










