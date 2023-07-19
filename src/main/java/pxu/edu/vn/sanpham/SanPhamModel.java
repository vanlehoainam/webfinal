package pxu.edu.vn.sanpham;

import java.sql.Connection;
import java.sql.PreparedStatement;



public class SanPhamModel {
	static Connection conn=null;
public SanPhamModel () {
	
}
public boolean addStudent(SanPham input , Connection dbConnection) {
	boolean flag = true;
	try {

		String sql = "insert into  quanao(ten_QA,size,GiaBan,SoLuong,MoTa,anhSP,Is_Alive) values(?,?,?,?,?,?,?)";

		PreparedStatement statement = dbConnection.prepareStatement(sql);
		statement.setString(1, input.getTen_QA());
		statement.setString(2, input.getSize());
		statement.setInt(3, input.getGiaBan());
		statement.setInt(4, input.getSoLuong());
		statement.setString(5, input.getMoTa());
		statement.setString(6, input.getAnhSP());
		statement.setString(7, input.getIs_Alive());
		
		
		// Step 6: Process the results
		statement.execute();
		statement.close();
	} catch (Exception e) {
		e.printStackTrace();
		flag = false;
	}
	return flag;
}
}
