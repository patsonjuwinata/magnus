package magnus;

public class SewaKendaraan implements Kendaraan {

	private String tipeKendaraan;
	private int lamaSewa;
	
	public SewaKendaraan(String tipeKendaraan, int lamaSewa) {
		this.tipeKendaraan = tipeKendaraan;
		this.lamaSewa = lamaSewa;
	}
	
	public int hitungSewa() {
		int result = 0;
		int maksimumJamSewa = 10;
		int tipe = getTipeKendaraan();
		if (tipe>0 && tipe<3) {
			int hargaSewa = getHargaSewa(tipe);
			if (lamaSewa<=maksimumJamSewa) {
				result = hargaSewa*lamaSewa;
			} else {
				int pokok = hargaSewa*lamaSewa;
				int denda = getNominalDendaPerJam(tipe)*(lamaSewa-maksimumJamSewa);
				result = pokok+denda;
			}
		}
		return result;
	}
	
	@Override
	public int getTipeKendaraan() {
		if (tipeKendaraan.equalsIgnoreCase("motor")) {
			return 1;
		} else if (tipeKendaraan.equalsIgnoreCase("mobil")) {
			return 2;
		} else {
			return 0;
		}
	}

	@Override
	public int getHargaSewa(int tipeKendaraan) {
		int harga = 0;
		if (tipeKendaraan>0 && tipeKendaraan<3) {
			if (tipeKendaraan==1) {
				harga = 100000;
			} else {
				harga = 300000;
			}
		}
		return harga;
	}

	@Override
	public int getNominalDendaPerJam(int tipeKendaraan) {
		int denda = 0;
		if (tipeKendaraan>0 && tipeKendaraan<3) {
			if (tipeKendaraan==1) {
				denda = 20000;
			} else {
				denda = 50000;
			}
		}
		return denda;
	}

}



