package cat.institutmarianao.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import cat.institutmarianao.dao.CycleDao;
import cat.institutmarianao.dao.ModuleDao;
import cat.institutmarianao.dao.StudentDao;
import cat.institutmarianao.model.Cycle;
import cat.institutmarianao.model.Module;
import cat.institutmarianao.model.Student;
import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//TODO Implement the servlet to handle student registration, including form validation
@WebServlet(urlPatterns = { "/register" })
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB
	private CycleDao cycle;
	@EJB
	private ModuleDao module;
	@EJB
	private StudentDao student;

	private List<Module> listaModulosEnBaseAlCiclo(String ciclorequest) throws Exception {
		List<Cycle> listaDeCiclos = cycle.findAll();
		Cycle cicloselect = null;
		for (Cycle ciclo : listaDeCiclos) {
			if (ciclorequest.equalsIgnoreCase(ciclo.getCode())) {
				// Guardo los datos del ciclo seleccionado
				cicloselect = new Cycle();
				cicloselect.setCode(ciclo.getCode());
				cicloselect.setName(ciclo.getName());
			}
		}
		// Lista con todos los modulos donde el codigo del ciclo es el de Asix
		List<Module> mismodulos = module.findAllByCycleCode(cicloselect.getCode());
		return mismodulos;
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.isUserInRole("admin")) {
			response.setContentType("text/html;charset=UTF-8");
			String cicle = request.getParameter("cycle");
			try {
				List<Module> mismodulos = listaModulosEnBaseAlCiclo(cicle);
				request.setAttribute("mismodulos", mismodulos);
				request.setAttribute("ciclo", cicle);
			} catch (Exception e) {
				e.printStackTrace();
			}
			RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
			dispatcher.forward(request, response);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		String dni = request.getParameter("dni");
		String name = request.getParameter("name");
		String surname = request.getParameter("surname");
		String email = request.getParameter("email");

		Student estudiante = new Student();
		estudiante.setDni(dni);
		estudiante.setName(surname);
		estudiante.setSurname(surname);
		estudiante.setEmail(email);
		estudiante.setModules(null);

		List<String> errors = validarStudent(estudiante);

		RequestDispatcher dispatcher;
		if (errors.isEmpty()) {
			// Si pasa todas las validaciónes
			dispatcher = request.getRequestDispatcher("/students");

			try {
				student.add(estudiante);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else {
			// Si no pasa todas las validaciónes
			dispatcher = request.getRequestDispatcher("register.jsp");
			request.setAttribute("errors", errors);
		}

		dispatcher.forward(request, response);
	}

	private List<String> validarStudent(Student student) {
		List<String> errores = new ArrayList<>();
		if (student.getDni().isBlank()) {
			errores.add("El camp dni esta vuit");
		}
		return errores;
	}
}
