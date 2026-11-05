package cat.institutmarianao.servlet;

import java.io.IOException;

import cat.institutmarianao.service.StudentService;
import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//TODO Implement the servlet to handle student registration, including form validation
@WebServlet(urlPatterns = { "/remove" })
public class RemoveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB
	private StudentService studentService;

	// removeByDni(String dni);

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		if (request.isUserInRole("admin")) {
			try {
				String dni = request.getParameter("dni");

				studentService.removeByDni(dni);
				RequestDispatcher dispatcher;
				dispatcher = request.getRequestDispatcher("/students");
				dispatcher.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
