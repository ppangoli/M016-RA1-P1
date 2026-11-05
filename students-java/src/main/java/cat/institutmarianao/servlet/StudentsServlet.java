package cat.institutmarianao.servlet;

import java.io.IOException;

import cat.institutmarianao.service.CycleService;
import cat.institutmarianao.service.StudentService;
import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({ "/students" })
//TODO Implement the servlet to handle student listing
public class StudentsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB
	private CycleService cycleService;
	@EJB
	private StudentService studentService;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		student(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		student(request, response);
	}

	private void student(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		if (request.isUserInRole("admin")) {
			try {
				request.setAttribute("listadealumnos", studentService.findAll());
				request.setAttribute("ciclos", cycleService.findAll());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			RequestDispatcher dispatcher = request.getRequestDispatcher("students.jsp");
			dispatcher.forward(request, response);
		}
	}
}
