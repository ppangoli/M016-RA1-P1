<%@ page contentType="text/html" pageEncoding="UTF-8"%>
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


<style type="text/css">
div.scroll {
	height: 200px;
	overflow-y: auto;
}
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
					<li class="navbar-brand"><i class="bi bi-person-fill"></i> <span>xavi</span></li>
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
	




		


		<h2 class="mb-4">New DAW register</h2>


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
							value="DAW" readonly>
					</div>


					<div class="input-group mb-3">
						<span class="input-group-text"><i class="bi bi-list-task"></i></span>
						<div class="scroll form-control ">
							
								<div class="form-check">
									<input class="form-check-input" type="checkbox" name="modules"
										id="module_0179" value="0179"
										>
									<label class="form-check-label" for="module_0179">
										0179 - Anglès professional
									</label>
								</div>
							
								<div class="form-check">
									<input class="form-check-input" type="checkbox" name="modules"
										id="module_0373" value="0373"
										>
									<label class="form-check-label" for="module_0373">
										0373 - Llenguatges de marques i sistemes de gestió d'informació
									</label>
								</div>
							
								<div class="form-check">
									<input class="form-check-input" type="checkbox" name="modules"
										id="module_0483" value="0483"
										>
									<label class="form-check-label" for="module_0483">
										0483 - Sistemes informàtics
									</label>
								</div>
							
								<div class="form-check">
									<input class="form-check-input" type="checkbox" name="modules"
										id="module_0484" value="0484"
										>
									<label class="form-check-label" for="module_0484">
										0484 - Bases de dades
									</label>
								</div>
							
								<div class="form-check">
									<input class="form-check-input" type="checkbox" name="modules"
										id="module_0485" value="0485"
										>
									<label class="form-check-label" for="module_0485">
										0485 - Programació
									</label>
								</div>
							
								<div class="form-check">
									<input class="form-check-input" type="checkbox" name="modules"
										id="module_0487" value="0487"
										>
									<label class="form-check-label" for="module_0487">
										0487 - Entorns de desenvolupament
									</label>
								</div>
							
								<div class="form-check">
									<input class="form-check-input" type="checkbox" name="modules"
										id="module_0492" value="0492"
										>
									<label class="form-check-label" for="module_0492">
										0492 - Projecte intermodular de desenvolupament d'aplicacions multiplataforma
									</label>
								</div>
							
								<div class="form-check">
									<input class="form-check-input" type="checkbox" name="modules"
										id="module_0612" value="0612"
										>
									<label class="form-check-label" for="module_0612">
										0612 - Desenvolupament web en entorn client
									</label>
								</div>
							
								<div class="form-check">
									<input class="form-check-input" type="checkbox" name="modules"
										id="module_0613" value="0613"
										>
									<label class="form-check-label" for="module_0613">
										0613 - Desenvolupament web en entorn servidor
									</label>
								</div>
							
								<div class="form-check">
									<input class="form-check-input" type="checkbox" name="modules"
										id="module_0614" value="0614"
										>
									<label class="form-check-label" for="module_0614">
										0614 - Desplegament d'aplicacions web
									</label>
								</div>
							
								<div class="form-check">
									<input class="form-check-input" type="checkbox" name="modules"
										id="module_0615" value="0615"
										>
									<label class="form-check-label" for="module_0615">
										0615 - Disseny d'interfícies web
									</label>
								</div>
							
								<div class="form-check">
									<input class="form-check-input" type="checkbox" name="modules"
										id="module_1665" value="1665"
										>
									<label class="form-check-label" for="module_1665">
										1665 - Digitalització aplicada als sectors productius
									</label>
								</div>
							
								<div class="form-check">
									<input class="form-check-input" type="checkbox" name="modules"
										id="module_1708" value="1708"
										>
									<label class="form-check-label" for="module_1708">
										1708 - Sostenibilitat aplicada al sistema productiu
									</label>
								</div>
							
								<div class="form-check">
									<input class="form-check-input" type="checkbox" name="modules"
										id="module_1709" value="1709"
										>
									<label class="form-check-label" for="module_1709">
										1709 - Itinerari personal per a l'ocupabilitat I
									</label>
								</div>
							
								<div class="form-check">
									<input class="form-check-input" type="checkbox" name="modules"
										id="module_1710" value="1710"
										>
									<label class="form-check-label" for="module_1710">
										1710 - Itinerari personal per a l'ocupabilitat II
									</label>
								</div>
							
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


