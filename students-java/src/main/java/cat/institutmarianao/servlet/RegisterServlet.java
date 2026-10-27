package cat.institutmarianao.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

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

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		String cicle = request.getParameter("cycle");

		try {
			// lista de todos los ciclos disponibles
			List<Cycle> listaDeCiclos = cycle.findAll();
			Map<String, Map<String, Module>> modules = module.findAll();
			Cycle cicloselect;
			if (cicle.equalsIgnoreCase("asix")) {
				
				for (Cycle ciclo : listaDeCiclos) {
					if ("ASIX".equalsIgnoreCase(ciclo.getCode())) {
						//Guardo los datos del ciclo seleccionado
						cicloselect = new Cycle();
						cicloselect.setCode(ciclo.getCode());
						cicloselect.setName(ciclo.getName());
					}
				}
				
				for ()

			}
			if (cicle.equalsIgnoreCase("dam")) {
			}
			if (cicle.equalsIgnoreCase("daw")) {
			}

			RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
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
