package pxu.edu.vn.sanpham;

public class SanPham {
	private String Ten_QA;
	private String Size;
	private float GiaBan;
	private int SoLuong;
	private String MoTa;
	private String anhSP;
	private String Is_Alive;

	public SanPham() {
		super();
	}

	public SanPham(String ten_QA, String size, float giaBan, int soLuong, String moTa, String anhSP, String is_Alive) {
		super();
		this.Ten_QA = ten_QA;
		this.Size = size;
		this.GiaBan = giaBan;
		this.SoLuong = soLuong;
		this.MoTa = moTa;
		this.anhSP = anhSP;
		this.Is_Alive = is_Alive;
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

	public float getGiaBan() {
		return GiaBan;
	}

	public void setGiaBan(float giaBan) {
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

	public String getIs_Alive() {
		return Is_Alive;
	}

	public void setIs_Alive(String is_Alive) {
		Is_Alive = is_Alive;
	}

	@Override
	public String toString() {
		return "SanPham [Ten_QA=" + Ten_QA + ", Size=" + Size +  ", GiaBan=" + GiaBan
				+ ", SoLuong=" + SoLuong + ", MoTa=" + MoTa + ", anhSP=" + anhSP + ", Is_Alive=" + Is_Alive + "]";
	}

}
