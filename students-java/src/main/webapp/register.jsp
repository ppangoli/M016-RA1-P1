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


		<c:if test="${not empty errors}">
			<div class="alert alert-danger alert-dismissible fade show"
				role="alert">
				<button type="button" class="btn-close" data-bs-dismiss="alert"
					aria-label="Close"></button>
				<c:forEach var="error" items="${errors}">
					<p class="mb-1">
						<strong style="text-transform: capitalize;"><c:out value="${error.propertyPath}"
								escapeXml="false" />:</strong>
						<c:out value="${error.message}" escapeXml="false" />
					</p>

				</c:forEach>
			</div>
		</c:if>

		<form action="register" method="POST">
			<div class="row g-3">
				<div class="col-md-6 col-lg-5">
					<div class="input-group mb-3">
						<span class="input-group-text"><i
							class="bi bi-card-heading"></i></span> <input id="dni" type="text"
							class="form-control " name="dni" placeholder="Dni"
							value="${estudiante.dni}">
					</div>


					<div class="input-group mb-3">
						<span class="input-group-text"><i class="bi bi-person"></i></span>
						<input id="name" type="text" class="form-control " name="name"
							placeholder="Name" value="${estudiante.name}">
					</div>


					<div class="input-group mb-3">
						<span class="input-group-text"><i class="bi bi-person-fill"></i></span>
						<input id="surname" type="text" class="form-control "
							name="surname" placeholder="Surname"
							value="${estudiante.surname}">
					</div>


					<div class="input-group mb-3">
						<span class="input-group-text"><i class="bi bi-envelope"></i></span>
						<input id="email" type="text" class="form-control " name="email"
							placeholder="Email" value="${estudiante.email}">
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
										<c:if test="${selectedModules.contains(modulo.code)}">
										checked
										</c:if>>
									<label class="form-check-label" for="module_${modulo.code}">
										${modulo.code} - ${modulo.name} </label>
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


