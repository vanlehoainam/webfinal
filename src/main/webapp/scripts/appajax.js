$(document).ready(function() {

	
		var dataTable = $('#studentTable').DataTable({
			"serverSide": true,
			ajax: {
				url: 'getStudent.jsp',
				dataSrc: ''
			},
			columns: [{
				data: 'idstudent'
			},
			{
				data: 'hoten'
			},
			{
				data: 'gioitinh'
			},
			{
				data: 'ngaysinh'
			},
			{
				data: 'sdt'
			},
			{
				data: null,
				render: function(data, type, row) {
					return '<button class="btn btn-warning editBtn mr-2" data-bs-toggle="modal" data-bs-target="#editStudentModal" data-id="' + row.idstudent + '">Edit</button>'
						+ '<button class="btn btn-danger deleteBtn" data-id="' + row.idstudent + '">Delete</button>'
				}
			}

			]
		});
	/*displayStudents();*/

	$('#addStudentBtn').click(function() {
		var formData = $('#addStudentForm').serialize();

		$.ajax({
			type: 'POST',
			url: 'addStudent.jsp',
			data: formData,
			dataType: 'json',
			success: function(response) {
				if (response.success) {
					displayStudents();
					$('#addStudentModal').modal('hide');
				} else {
					alert('Error adding student.');
				}
			},
			error: function() {
				alert('Error adding student.');
			}
		});
	});


	$('#studentTable').on('click', '.editBtn', function() {
		var id = $(this).data('id');

		$.ajax({
			type: 'POST',
			data: { id: id },
			url: 'getStudentById.jsp',
			dataType: 'json',
			success: function(response) {
				if (response) {
					console.log(response);
					$('#editStudentModal').modal('show'); // Show the edit modal here

					$('#editId').val(response.id);
					$('#editFullname').val(response.fullname);
					$('#editGender').val(response.gender);
					$('#editBirthday').val(response.birthday);
					$('#editPhoneNumber').val(response.phonenumber);
				} else {
					alert('Error editing student.')
				}
			}
		})
	});
	// Function to populate the edit modal form with student data

	$('#editStudentModal').on('click', '#editStudentBtn', function() {
		var formData = $('#editStudentForm').serialize();

		$.ajax({
			type: 'POST',
			url: 'editStudent.jsp',
			data: formData,
			dataType: 'json',
			success: function(response) {
				if (response.success) {
					displayStudents();
					$('#editStudentModal').modal('hide');
				} else {
					alert('Error editing student.');
				}
			},
			error: function() {
				alert('Error editing student.');
			}
		});
	});

	$('#studentTable').on('click', '.deleteBtn', function() {
		var id = $(this).data('id');
		deleteStudent(id);
	});

	function deleteStudent(id) {
		$.ajax({
			type: 'POST',
			url: 'delete.jsp',
			data: { id: id },
			dataType: 'json',
			success: function(response) {
				if (response.success) {
					dataTable.ajax.reload()
				} else {
					alert('Error deleting student.');
				}
			},
			error: function() {
				alert('Error deleting student.');
			}
		});
	}
});
