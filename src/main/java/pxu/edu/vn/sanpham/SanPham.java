package pxu.edu.vn.sanpham;

public class SanPham {
	private int ID_QA;
	private String Ten_QA;
	private String Size;
	private Double GiaBan;
	private int SoLuong;
	private String MoTa;
	private String anhSP;

	public SanPham() {
		super();
	}

	public SanPham(int iD_QA, String ten_QA, String size, Double giaBan, int soLuong, String moTa, String anhSP) {
		super();
		ID_QA = iD_QA;
		Ten_QA = ten_QA;
		Size = size;
		GiaBan = giaBan;
		SoLuong = soLuong;
		MoTa = moTa;
		this.anhSP = anhSP;
	}

	public int getID_QA() {
		return ID_QA;
	}

	public void setID_QA(int iD_QA) {
		ID_QA = iD_QA;
	}

	public String getTen_QA() {
		return Ten_QA;
	}

	public void setTen_QA(String ten_QA) {
		Ten_QA = ten_QA;
	}

	public String getSize() {
		return Size;
	}

	public void setSize(String size) {
		Size = size;
	}

	public Double getGiaBan() {
		return GiaBan;
	}

	public void setGiaBan(Double giaBan) {
		GiaBan = giaBan;
	}

	public int getSoLuong() {
		return SoLuong;
	}

	public void setSoLuong(int soLuong) {
		SoLuong = soLuong;
	}

	public String getMoTa() {
		return MoTa;
	}

	public void setMoTa(String moTa) {
		MoTa = moTa;
	}

	public String getAnhSP() {
		return anhSP;
	}

	public void setAnhSP(String anhSP) {
		this.anhSP = anhSP;
	}

	@Override
	public String toString() {
		return "SanPham [ID_QA=" + ID_QA + ", Ten_QA=" + Ten_QA + ", Size=" + Size + ", GiaBan=" + GiaBan + ", SoLuong="
				+ SoLuong + ", MoTa=" + MoTa + ", anhSP=" + anhSP + "]";
	}

}
