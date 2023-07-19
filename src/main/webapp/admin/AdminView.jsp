<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
	crossorigin="anonymous"></script>
<body>
	<% String user = (String)session.getAttribute("user"); if(user == null){
	request.setAttribute("message", "CHUA DANG NHAP"); RequestDispatcher
	dispatcher = request.getRequestDispatcher("../login/login.jsp"); if
	(dispatcher != null) { dispatcher.forward(request, response); } }

	String msg = (String) request.getAttribute("message"); if(msg != null){
	out.print(msg); } %>
	<div class="container">
		<h2>Form Nhập Thông Tin Sản Phẩm</h2>
		<form id="adminform" action="AdminController.jsp" method="POST">

			<div class="form-group">
				<label for="tensp">Tên Sản Phẩm:</label> <input type="text"
					class="form-control" id="tensp" name="tensp"
					placeholder="Nhập Tên Sản Phẩm " onblur="validateTenSp()"> <span
					id="tenspError" class="text-danger"></span>
				<div class="form-group">
					<label for="size">Size:</label> <input type="text"
						class="form-control" id="size" name="size"
						placeholder="Nhập Size" onblur="validateSize()"> <span
						id="sizeError" class="text-danger"></span>
				</div>
				<div class="form-group">
					<label for="giaban">Giá Bán :</label> <input type="text"
						class="form-control" id="giaban" name="giaban"
						placeholder="Nhập Giá Bán" onblur="validateGiaBan()"> <span
						id="giabanError" class="text-danger"></span>
				</div>
				<div class="form-group">
					<label for="soluong">Số Lượng:</label> <input type="text"
						class="form-control" id="soluong" name="soluong"
						placeholder="Nhập  Số Lượng" onblur="validateSoLuong()"> <span
						id="soluongError" class="text-danger"></span>
				</div>
				<div class="form-group">
					<label for="mota">Mô tả :</label> <input type="text"
						class="form-control" id="mota" name="mota"
						placeholder="Nhập họ tên" onblur="validateMoTa()"> <span
						id="motaError" class="text-danger"></span>
				</div>
				<div class="form-group">
					<label for="anhsp">Ảnh Sản Phẩm:</label> <input type="text"
						class="form-control" id="anhsp name="anhsp"
						placeholder="Nhập họ tên" onblur="validateAnhSp()"> <span
						id="anhspError" class="text-danger"></span>
				</div>
				<div class="form-group">
					<label for="is_Alive">is_Alive:</label> <input type="text"
						class="form-control" id="is_Alive" name="is_Alive"
						placeholder="Nhập is_Alive" onblur="validateis_Alive()"> <span
						id="is_AliveError" class="text-danger"></span>
				</div>
				<button type="submit" class="btn btn-primary">Submit</button>
		</form>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script>
		$(document)
				.ready(
						
							// Validate function for Họ tên
							function validateHoTen() {
								var hoten = $('#hoten').val().trim();
								if (hoten === '') {
									$('#hotenError').text(
											'Vui lòng nhập Họ tên');
								} else {
									$('#hotenError').text('');
								}
							}

							function validateNgaySinh() {
								  var ngaysinh = $('#ngaysinh').val().trim();
if (ngaysinh === '') {
								    $('#ngaysinhError').text('Vui lòng chọn Ngày sinh');
								  } else {
								    var selectedDate = new Date(ngaysinh);
								    var currentDate = new Date();
								    if (selectedDate > currentDate) {
								      $('#ngaysinhError').text('Ngày sinh không được trong tương lai');
								    } else {
								      $('#ngaysinhError').text('');
								    }
								  }
								}


							// Validate function for Số điện thoại
							function validateSDT() {
								var sdt = $('#sdt').val().trim();
								if (sdt === '') {
									$('#sdtError').text(
											'Vui lòng nhập Số điện thoại');
								} else if (sdt.length !== 10) {
									$('#sdtError')
											.text(
													'Số điện thoại phải có đúng 10 kí tự');
								} else {
									$('#sdtError').text('');
								}
							}
							// Bind blur event handler to the input fields
							$('#idstudent').on('blur', validateIDStudent);
							$('#hoten').on('blur', validateHoTen);
							$('#ngaysinh').on('blur', validateNgaySinh);
							$('#sdt').on('blur', validateSDT);

							// Submit event handler for the form
							$('#studentForm')
									.on(
											'submit',
											function(event) {
												// Perform validation for all fields
												validateIDStudent();
												validateHoTen();
												validateNgaySinh();
												validateSDT();

												// Prevent form submission if any field is invalid
												if ($('#idstudentError').text() !== ''
														|| $('#hotenError')
																.text() !== ''
														|| $('#ngaysinhError')
																.text() !== ''
														|| $('#sdtError')
																.text() !== '') {
													event.preventDefault();
												}
											});
						});
	</script>
</body>
</html>