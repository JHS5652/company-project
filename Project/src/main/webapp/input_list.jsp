<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">

<link rel="stylesheet" href="input_list.css">
</head>


<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	%>
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid">
			<a class="navbar-brand" href="main.jsp">학생 물품 대여 시스템</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
				aria-controls="navbarNavDropdown" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavDropdown">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="goodsList.jsp">중고
							물품 리스트</a></li>
					<li class="nav-item"><a class="nav-link" href="input_list.jsp">물품
							추가</a></li>
					<li class="nav-item"><a class="nav-link"
						href="myGoods.jsp?ID=<%=userID%>">내 물품</a></li>
					<%
					if (userID != null) {
						if (userID.equals("tmskdlvj124")) {
					%>
					<li class="nav-item"><a class="nav-link"
						href="accountPage.jsp">관리자 페이지</a></li>
					<%
					}
					}
					%>
				</ul>
				<%
				if (userID != null) {
				%>
				<ul class="navbar-nav">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="true"> <%=userID%>님
							안녕하세요
					</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="logoutAction.jsp">로그아웃</a></li>
							<li><a class="dropdown-item" href="deleteUserID.jsp">회원탈퇴</a></li>
						</ul></li>

				</ul>
				<%
				} else {
				%>
				<ul class="navbar-nav ">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="true"> 접속하기 </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="index.jsp">로그인</a></li>
							<li><a class="dropdown-item" href="register.jsp">회원가입</a></li>
						</ul></li>
				</ul>

				<%
				}
				%>
			</div>
		</div>
	</nav>
	
	<section class="container mt-4">
		<div class="row justify-content-md-center">

			<div class="col-md-6">
				<form action="uploadAction.jsp" method="post"
					enctype="multipart/form-data">
					<h1>제품 등록</h1>
					<label for="formGroupExampleInput" class="form-label">상품 사진
						등록</label> <input type="file" class=" form-control real-upload mb-3"
						accept="image/*" name="file"> <label
						for="formGroupExampleInput " class="form-label">글제목</label> <input
						type="text" class="form-control mb-3" id="formGroupExampleInput"
						placeholder="Subject" name="subject"> <label
						for="formGroupExampleInput " class="form-label">가격</label> <input
						type="text" class="form-control mb-3" id="formGroupExampleInput"
						placeholder="Price" name="price"><label
						for="formGroupExampleInput " class="form-label">대여 가능 날짜</label> <input
						type="text" class="form-control mb-3" id="formGroupExampleInput"
						placeholder="Price" name="date"><label
						for="formGroupExampleInput" class="form-label">내용 추가</label>
					<div class="form-floating">
						<textarea class="form-control" placeholder="Leave a comment here"
							id="floatingTextarea2" style="height: 100px" name="content"></textarea>
						<label for="floatingTextarea2">Comments</label>
					</div>
					<div>
						<input type="submit"
							class="btn btn-outline-primary mt-3 float-end" value="업로드"
							id="sub" />
					</div>
				</form>
			</div>
		</div>
	</section>


	<div class="container">
		<footer
			class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
			<div class="col-md-4 d-flex align-items-center">
				<a href="/"
					class="mb-3 me-2 mb-md-0 text-muted text-decoration-none lh-1">
					<svg class="bi" width="30" height="24">
						<use xlink:href="#bootstrap" /></svg>
				</a> <span class="mb-3 mb-md-0 text-muted"> 2023
					copyright&copy;지현석 </span>
			</div>

			<ul class="nav col-md-4 justify-content-end list-unstyled d-flex">
				<li class="ms-3"><a class="text-muted" href="#"><svg
							class="bi" width="24" height="24">
							<use xlink:href="#twitter" /></svg></a></li>
				<li class="ms-3"><a class="text-muted" href="#"><svg
							class="bi" width="24" height="24">
							<use xlink:href="#instagram" /></svg></a></li>
				<li class="ms-3"><a class="text-muted" href="#"><svg
							class="bi" width="24" height="24">
							<use xlink:href="#facebook" /></svg></a></li>
			</ul>
		</footer>
	</div>

	<%-- 	<div class="container">
		<form action="uploadAction.jsp" method="post"
			enctype="multipart/form-data">

			파일 : <input type="file" name="file"><br> <input
				type="submit" value="업로드"><br>

		</form>




		<%
	String uploadDir = this.getClass().getResource("").getPath();
	uploadDir = uploadDir.substring(1, uploadDir.indexOf(".metadata")) + "Project/src/main/webapp/uploadImage/";
	out.println("절대경로 : " + uploadDir + "<br/>");

	String imgFile = uploadDir + "hero_header.JPG";
	out.println("이미지파일 경로 : " + imgFile + "<br/>");

	imgFile = "hero_header.jpg";

	String imgFile2 = uploadDir + "아이유IMAGE.JPG";
	out.println("이미지파일 경로 : " + imgFile2 + "<br/>");
	%>
		<img src="uploadImage/<%=imgFile%>" width="300px" height="300px"></img>
		<img src="<%=imgFile2%>" width="300px" height="300px"></img>

	</div>
 --%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
</body>
</body>
</html>