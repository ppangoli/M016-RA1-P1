package cat.institutmarianao.auth.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//TODO Implement the servlet to handle login errors
@WebServlet({ "/loginerror" })
public class LoginErrorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String field = request.getParameter("field");
		String prepareMethod = request.getParameter("prepare_method");

		switch (prepareMethod) {
		case "prepare_url_rewrite":
			// No break here, we want to do the same as the next case
		case "prepare_hidden_field":
			request.setAttribute("field", field);
			request.getRequestDispatcher(prepareMethod + ".jsp").forward(request, response);
			break;
		default:
			throw new IllegalArgumentException("Unexpected value: " + prepareMethod);
		}
	}
}