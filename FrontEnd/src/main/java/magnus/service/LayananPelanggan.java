package magnus.service;

import java.util.ArrayList;
import java.util.List;
import magnus.model.Pelanggan;

public class LayananPelanggan {

	 public static List<Pelanggan> semuaPelanggan = new ArrayList<Pelanggan>();
	 
	 public static void daftarBaru(Pelanggan pelanggan) {
		 semuaPelanggan.add(pelanggan);			    
	 }
	 
	 public static List<Pelanggan> getSemuaPelanggan() {
		 return semuaPelanggan;
	 }

}

