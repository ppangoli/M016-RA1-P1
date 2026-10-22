<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html lang="es">
<head>




<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<title>Students</title>


<script type="text/javascript">
	function changeDni(dni, dniHref) {
		document.getElementById("dni").innerHTML = "Are you sure you wish to delete student with dni=<strong>"
				+ dni + "</strong>?";
		document.getElementById("dniHref").href = dniHref;
	}
</script>
<style type="text/css">
</style>
</head>
<body>
	<div class="container my-4">
		


<header class="mb-4 p-5 bg-secondary-subtle bg-gradient rounded">
	<p class="display-1">
		<strong>Students</strong>
	</p>
	<h3>By Institut Marianao</h3>
</header>


	
	
		<nav
			class="navbar navbar-expand-lg sticky-top mb-4 bg-secondary-subtle bg-gradient rounded">
			<div class="container-fluid">
				<ul class="navbar-nav">
					<li class="navbar-brand"><i class="bi bi-person-fill"></i> <span><c:if test="${not empty pageContext.request.remoteUser}">
		${pageContext.request.remoteUser}
	</c:if></span></li>
				</ul>
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="/logout"
						data-bs-toggle="modal" data-bs-target="#confirmLogout"> <i
							class="bi bi-box-arrow-right"></i> <span>Logout</span>
					</a></li>
				</ul>
			</div>
		</nav>


		<!-- Confirm Logout Modal -->
		<div class="modal fade" id="confirmLogout" tabindex="-1"
			aria-labelledby="confirmLogoutLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="confirmLogoutLabel">Confirm
							logout</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<p>Are you sure you wish to logout?</p>
					</div>
					<div class="modal-footer">
						
						<a class="btn btn-danger" href="/students-java/logout">Logout</a>
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	




		<ul class="list-inline">
			
				
				<li class="list-inline-item"><a href="register?cycle=ASIX"
					class="btn btn-light"> New ASIX register </a></li>
			
				
				<li class="list-inline-item"><a href="register?cycle=DAW"
					class="btn btn-light"> New DAW register </a></li>
			
				
				<li class="list-inline-item"><a href="register?cycle=DAM"
					class="btn btn-light"> New DAM register </a></li>
			
		</ul>


		<h2 class="mt-4">Students</h2>


		<div class="table-responsive">
			<table
				class="table table-striped table-bordered table-sm align-middle">
				<thead>
					<tr>
						<th>Dni</th>
						<th>Name</th>
						<th>Surname</th>
						<th>Email</th>
						<th>Cycle</th>
						<th>Modules</th>
						<th>Actions</th>
					</tr>
					
 <c:if test="${not empty listadealumnos}">
    <c:forEach items="${listadealumnos}" var="alumno">
        <tr>
            <td>${alumno.dni}</td>
            <td>${alumno.name}</td>
            <td>${alumno.surname}</td>
            <td>${alumno.email}</td>
        </tr>
    </c:forEach>
</c:if>
					
				</thead>
				<tbody>
					
				</tbody>
			</table>
		</div>
	</div>


	<!-- Confirm Remove Modal -->
	<div class="modal fade" id="confirmRemove" tabindex="-1"
		aria-labelledby="confirmRemoveLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="confirmRemoveLabel">Confirm remove</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<p id="dni">99999999X</p>
				</div>
				<div class="modal-footer">
					<a id="dniHref" class="btn btn-danger" href="#">Remove</a>
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>


