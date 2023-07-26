<%@page import="pxu.edu.vn.sanpham.SanPham"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
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
	<%
	String user = (String) session.getAttribute("user");
	if (user == null) {
		request.setAttribute("message", "CHUA DANG NHAP");
		RequestDispatcher dispatcher = request.getRequestDispatcher("../login/login.jsp");
		if (dispatcher != null) {
			dispatcher.forward(request, response);
		}
	}

	String msg = (String) request.getAttribute("message");
	if (msg != null) {
		out.print(msg);
	}
	%>
	<div style="padding: 22px 32px;">
		<div class="text">
			<h1>
				<center>THÔNG TIN SẢN PHẨM</center>
			</h1>
			</br>
			<button class="btn btn-primary" data-bs-toggle="modal"
				data-bs-target="#addModal">Thêm Mới</button>

			<div class="panel-body">
				<table id="productTable"
					class="table table-responsive table-bordered" cellpadding="0"
					width="100%">
					<table border="1">
						<tr>
							<th>ID</th>
							<th>Tên Sản Phẩm</th>
							<th>Giá Bán	</th>
							<th> Số Lượng </th>
							<th> Mô Tả </th>
							<th> Cập Nhật  </th>
							<th> Xoá </th>
						</tr>
						<%
						// Mở kết nối tới cơ sở dữ liệu
						Connection conn = null;
						Statement stmt = null;
						try {
							Class.forName("com.mysql.cj.jdbc.Driver");
							String URL = "jdbc:mysql://localhost:3306/db_shopthoitrang";
							String dbUsername = "root";
							String dbPassword = "123456";
							conn = DriverManager.getConnection(URL, dbUsername, dbPassword);
							stmt = conn.createStatement();
							// Truy vấn lấy danh sách sinh viên từ cơ sở dữ liệu
							String sql = "SELECT * FROM quanao";
							ResultSet rs = stmt.executeQuery(sql);
							while (rs.next()) {
								int id = rs.getInt("ID_QA");
								String name = rs.getString("Ten_QA");
								Double giaban = rs.getDouble("GiaBan");
								int soluong = rs.getInt("SoLuong");
								String mota = rs.getString("MoTa");
						%>

						<tr>
							<td><%=id%></td>
							<td><%=name%></td>
							<td><%=giaban%></td>
							<td><%=soluong%></td>
							<td><%=mota%></td>
							<td><a href="edit.jsp?id=<%=id%>">Sửa</a> </td>
							<td>| <a
								href="delete.jsp?id=<%=id%>">Xoá</a></td>
						</tr>
						<%
						}
						} catch (Exception e) {
						e.printStackTrace();
						} finally {
						// Đóng kết nối
						try {
						if (stmt != null)
							stmt.close();
						if (conn != null)
							conn.close();
						} catch (SQLException se) {
						se.printStackTrace();
						}
						}
						%>
					</table>
			</div>
			<!-- Add Product Modal -->
			<form id="studentForm" action="SanPhamController.jsp" method="POST">
				<div class="modal fade" id="addModal" tabindex="-1"
					aria-labelledby="addModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="addModalLabel">Thêm Sản Phẩm</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<form action="addsp" method="POST">
									<div class="mb-3">
										<label for="tensp" class="form-label">Tên Quần Áo</label> <input
											type="text" class="form-control" id="tensp" name="tensp">
									</div>
									<div class="mb-3">
										<label for="size" class="form-label">Size</label> <input
											type="text" class="form-control" id="size" name="size">
									</div>
									<div class="mb-3">
										<label for="giaban" class="form-label">Giá Bán</label> <input
											type="text" class="form-control" id="giaban" name="giaban">
									</div>
									<div class="mb-3">
										<label for="soluong class="form-label">Số Lượng</label> <input
											type="text" class="form-control" id="soluong" name="soluong">
									</div>
									<div class="mb-3">
										<label for="mota" class="form-label">Mô Tả</label>
										<textarea class="form-control" id="mota" name="mota"></textarea>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">Đóng</button>
										<button type="submit" class="btn btn-primary">Thêm
											sản phẩm</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</form>
			<!-- Modal -->
			<c:forEach var="sp" items="${quanaoListt}">
				<div class="modal fade" id="editModal${sp.ID_QA}" tabindex="-1"
					aria-labelledby="editModalLabel${sp.iD_QA}" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="editModalLabel${sp.iD_QA}">
									Chỉnh Sửa Thông Tin Sản Phẩm</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<form action="uppdatesp" method="POST">
									<input type="hidden" name="iD_QAStr" value="${sp.iD_QA}">
									<div class="mb-3">
										<label for="ten_nhasx_${sp.iD_QA}" class="form-label">Tên
											quần áo</label> <input type="text" class="form-control"
											id="ten_nhasx_${sp.iD_QA}" name="ten_nhasx_${sp.iD_QA}"
											value="${sp.ten_QA}">
									</div>

									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">Đóng</button>
										<button type="submit" class="btn btn-primary">Lưu</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<style>
th {
	border-top: 1px solid #ccc;
	border-left: 1px solid #ccc;
	border-right: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}

th:last-child {
	border-right: none;
}

td {
	border-left: 1px solid #ccc;
	border-right: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}

.table-bordered {
	border: 1px solid #ccc;
}

.table-bordered th, .table-bordered td {
	border: 1px solid #ccc;
}

.table-bordered th:last-child, .table-bordered td:last-child {
	border-right: none;
}
</style>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js"></script>
	<script>
		$(document).ready(function() {
			$('#productTable').DataTable();
		});
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
</body>
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