package magnus;

public class HitungSewaKendaraan extends SewaKendaraan {

	private String namaPelanggan;
	
	public HitungSewaKendaraan(String namaPelanggan, String tipeKendaraan, int lamaSewa) {
		super(tipeKendaraan, lamaSewa);
		this.namaPelanggan = namaPelanggan;
	}
		
	public void cetakOutput() {
		System.out.println(namaPelanggan+" harus membayar Rp. "+super.hitungSewa());
	}
	
}

