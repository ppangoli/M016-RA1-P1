<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="es">
<head>
<jsp:include page="sections/head.jsp" />
</head>

<body>
	<div class="container my-4">
		


<div class="container my-4">
		<jsp:include page="sections/header.jsp" />
		<h2 class="mb-4">New ${ciclo} register</h2>
</div>

<div>
<c:if test="${not empty errors}">
<h1>Hay errores</h1>
<c:forEach var="error" items="${errors}">
<p><c:out value="${error.message}" escapeXml="false"/></p>
</c:forEach>
</c:if>
</div>
		<form action="register" method="POST">
			<div class="row g-3">
				<div class="col-md-6 col-lg-5">
					<div class="input-group mb-3">
						<span class="input-group-text"><i class="bi bi-card-heading"></i></span>
						<input id="dni" type="text" class="form-control "
							name="dni" placeholder="Dni" value="">
					</div>


					<div class="input-group mb-3">
						<span class="input-group-text"><i class="bi bi-person"></i></span>
						<input id="name" type="text" class="form-control "
							name="name" placeholder="Name" value="">
					</div>


					<div class="input-group mb-3">
						<span class="input-group-text"><i class="bi bi-person-fill"></i></span>
						<input id="surname" type="text" class="form-control "
							name="surname" placeholder="Surname" value="">
					</div>


					<div class="input-group mb-3">
						<span class="input-group-text"><i class="bi bi-envelope"></i></span>
						<input id="email" type="text" class="form-control "
							name="email" placeholder="Email" value="">
					</div>
				</div>


				<div class="col-md-6 col-lg-7">
					<div class="input-group mb-3">
						<span class="input-group-text"><i class="bi bi-mortarboard"></i></span>
						<input id="cycle" type="text" class="form-control" name="cycle"
							value="${ciclo}" readonly>
					</div>


					<div class="input-group mb-3">
						<span class="input-group-text"><i class="bi bi-list-task"></i></span>
						<div class="scroll form-control ">
						
							<c:forEach var="modulo" items="${mismodulos}">
							<div class="form-check">
									<input class="form-check-input" type="checkbox" name="modules"
										id="module_${modulo.code}" value="${modulo.code}"
										>
									<label class="form-check-label" for="module_${modulo.code}">
										${modulo.code} - ${modulo.name}
									</label>
								</div>
							</c:forEach>
							
						</div>
					</div>
				</div>
			</div>


			<div class="mt-4 d-flex gap-2">
				
				<a href="students" class="btn btn-outline-secondary">Cancel</a>
				<button type="submit" class="btn btn-primary">Submit</button>
			</div>
		</form>
	</div>
</body>
</html>


