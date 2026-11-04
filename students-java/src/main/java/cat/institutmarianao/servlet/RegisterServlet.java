package cat.institutmarianao.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import cat.institutmarianao.dao.CycleDao;
import cat.institutmarianao.dao.ModuleDao;
import cat.institutmarianao.dao.StudentDao;
import cat.institutmarianao.model.Cycle;
import cat.institutmarianao.model.Module;
import cat.institutmarianao.model.Student;
import jakarta.annotation.Resource;
import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.ConstraintViolation;
import jakarta.validation.Validator;

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

	@Resource
	private Validator validator;

	private Student postBean;

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
		// recogida de datos
		String cicle = request.getParameter("cycle");
		String dni = request.getParameter("dni");
		String name = request.getParameter("name");
		String surname = request.getParameter("surname");
		String email = request.getParameter("email");
		String[] moduloCodes = request.getParameterValues("modules");
		List<Module> modulos = new ArrayList<>();
		if (moduloCodes != null) {
			for (int i = 0; i > moduloCodes.length; i++) {
				try {
					modulos.add(module.findByPk(moduloCodes[i], cicle));
				} catch (Exception e) {
				}
			}
		}

		Student estudiante = new Student();
		estudiante.setDni(dni);
		estudiante.setName(name);
		estudiante.setSurname(surname);
		estudiante.setEmail(email);
		estudiante.setModules(modulos);

		postBean = new Student();
		postBean.setDni(dni);
		postBean.setName(name);
		postBean.setSurname(surname);
		postBean.setEmail(email);
		postBean.setModules(modulos);

		Set<ConstraintViolation<Student>> errors = validator.validate(postBean);

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
			dispatcher = request.getRequestDispatcher("/register.jsp");
			request.setAttribute("errors", errors);
			request.setAttribute("cycle", cicle);
		}

		request.setAttribute("postBean", postBean);
		dispatcher.forward(request, response);
	}
}
