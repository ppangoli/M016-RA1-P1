package cat.institutmarianao.servlet;

import java.io.IOException;
import java.util.List;

import cat.institutmarianao.model.Cycle;
import cat.institutmarianao.model.Module;
import cat.institutmarianao.service.CycleService;
import cat.institutmarianao.service.ModuleService;
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
	private CycleService cycle;
	private ModuleService module;

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
		response.setContentType("text/html;charset=UTF-8");
		String cicle = request.getParameter("cycle");
		try {
			List<Module> mismodulos = listaModulosEnBaseAlCiclo(cicle);
		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
		dispatcher.forward(request, response);
	}
}
