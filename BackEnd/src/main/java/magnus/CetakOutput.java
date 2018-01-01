package magnus;

// CONTOH
// ======
// java -jar BackEnd.jar "Jaka" "motor" 5

public class CetakOutput {

	public static void main(String[] args) {
		if (args.length==3) {
			try {
				HitungSewaKendaraan hitungSewaKendaraan = new HitungSewaKendaraan(args[0],args[1],Integer.valueOf(args[2]));
				hitungSewaKendaraan.cetakOutput();
			} catch (Exception e) {
				System.out.println("ERROR: "+e.getMessage());
			}
		}
	}

}

