<%@ page contentType="text/html" pageEncoding="UTF-8"%>
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
