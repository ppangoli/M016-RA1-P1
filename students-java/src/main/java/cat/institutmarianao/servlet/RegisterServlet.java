package cat.institutmarianao.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//TODO Implement the servlet to handle student registration, including form validation
@WebServlet(urlPatterns = { "/guess-color" })
public class RegisterServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		String cicle = request.getParameter("cycle");

		if (cicle.equalsIgnoreCase("asix")) {
		}
		if (cicle.equalsIgnoreCase("dam")) {
		}
		if (cicle.equalsIgnoreCase("daw")) {
		}

//	private String initColor;
//		try (PrintWriter out = response.getWriter()) {
//			String result;
//
//			// Get the color parameter from the request
//			String paramColor = request.getParameter("color");
//
//			if (initColor.equalsIgnoreCase(paramColor)) {
//				result = "Congratulations! You guess the color";
//			} else {
//				result = "Sorry, you lost!";
//			}
//
//		}
	}

}
