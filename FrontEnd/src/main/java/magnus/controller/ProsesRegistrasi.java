package magnus.controller;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import magnus.model.Pelanggan;
import magnus.service.LayananPelanggan;

@Controller
public class ProsesRegistrasi {
	  
	  @RequestMapping(value = "/daftar", method = RequestMethod.GET)
	  public ModelAndView formRegistrasi(HttpServletRequest request, HttpServletResponse response) {
		  ModelAndView mv = new ModelAndView("daftar");
		  mv.addObject("pelanggan", new Pelanggan());
		  return mv;
	  }
	  
	  @RequestMapping(value = "/prosesRegistrasi", method = RequestMethod.POST)
	  public ModelAndView prosesRegistrasi(HttpServletRequest request, HttpServletResponse response,
	  @ModelAttribute("pelanggan") Pelanggan pelanggan) {
		  LayananPelanggan.daftarBaru(pelanggan);
		  Map<String,Object> data = new HashMap<String,Object>();
		  data.put("namaPelanggan",pelanggan.getNamaPelanggan());
		  data.put("jenisKelamin",pelanggan.getJenisKelamin());
		  data.put("hobi",pelanggan.getHobi());
		  data.put("email",pelanggan.getEmail());
		  data.put("telp",pelanggan.getTelp());
		  data.put("userName",pelanggan.getUserName());
		  data.put("password",pelanggan.getPassword());
		  data.put("semuaPelanggan",LayananPelanggan.getSemuaPelanggan());
		  return new ModelAndView("sukses","data",data);
	  }
	  
}




