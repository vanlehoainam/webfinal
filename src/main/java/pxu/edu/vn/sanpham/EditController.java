package pxu.edu.vn.sanpham;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pxu.edu.vn.sanpham.*;
/**
 * Servlet implementation class EditController
 */
@WebServlet("/EditController")
public class EditController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Handling GET requests (if needed)
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		String ID_QAStr = request.getParameter("ID_QA");
		int ID_QA = Integer.parseInt(ID_QAStr);
		String Ten_QA = request.getParameter("Ten_QA" + ID_QA);
		String Size = request.getParameter("Size" + ID_QA);
		Double GiaBan = Double.parseDouble(request.getParameter("GiaBan" + ID_QA));
		int SoLuong = Integer.parseInt(request.getParameter("SoLuong" + ID_QA));
		String MoTa = request.getParameter("MoTa" + ID_QA);

		// Assuming you have a valid JDBC connection
		try {
			SanPhamModel model = new SanPhamModel();
			model.updateSanPham(ID_QA, Ten_QA, Size, GiaBan, SoLuong, MoTa);
			response.sendRedirect(request.getContextPath() + "/NhaSanXuatController");
		} catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath() + "/error.jsp"); // Redirect to error page
		}
	}

}
