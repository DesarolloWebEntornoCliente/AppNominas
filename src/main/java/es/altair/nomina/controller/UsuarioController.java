package es.altair.nomina.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import es.altair.nomina.bean.Concepto;
import es.altair.nomina.bean.Nomina;
import es.altair.nomina.bean.Usuario;
import es.altair.nomina.dao.ConceptoDAO;
import es.altair.nomina.dao.NominaDAO;
import es.altair.nomina.dao.UsuarioDAO;

@Controller
@SessionAttributes("usuLogeado")
public class UsuarioController {

	@Autowired
	private UsuarioDAO usuarioDAO;
	
	@Autowired
	private ConceptoDAO conceptoDAO;
	
	@Autowired
	private NominaDAO nominaDAO;
	
	
	@RequestMapping(value = "/comprobarUsuario", method = RequestMethod.POST)
	public String login(@ModelAttribute Usuario usu, HttpSession sesion) {
		usu = usuarioDAO.comprobarUsuario(usu.getLogin(), usu.getPassword());
		if (usu != null) {
			sesion.setAttribute("usuLogeado", usu);
			switch (usu.getTipo()) {
			case 1:
				//return "redirect:/principalUsu?mensaje=Sesion Iniciada Con exito";
				return "redirect:/listarUsuarios";
			case 2:
				return "redirect:/principalAdmin?mensaje=Sesion Iniciada Con exito";
			}
		}
		return "redirect:/?mensaje=Usuario y/o Password Incorrecto";
	}
	
	@RequestMapping(value="/", method = RequestMethod.GET)
	public ModelAndView inicio(Model model,@RequestParam(value="mensaje", required=false, defaultValue="") String mensaje) {
		
		model.addAttribute("mensaje", mensaje);
		model.addAttribute("listarJ", nominaDAO.listarTodos());
		 
		for (Nomina j : nominaDAO.listarTodos()) {
			System.out.println(j);
			
		}	
		
		return new ModelAndView("home", "command", new Usuario());
	}
	
	@RequestMapping(value="/listarUsuarios", method = RequestMethod.GET)
	public String listarUsuarios(Model model,HttpSession session) {
		
		if(noLogueado(session)) {
			model.addAttribute("errorLogin","Inicie sesión para entrar");
			return "redirect:/";
		}
	   	 model.addAttribute("listarU", usuarioDAO.listarUsuarios());
		 model.addAttribute("usu", new Usuario());
		
		return "listarUsuarios";
	}

	@RequestMapping(value="/cerrarSesion", method = RequestMethod.GET)
	public String cerrarSesion() {
		
		
		return "redirect:/";
	}
	
	/*
	@RequestMapping(value="/principalUsu", method = RequestMethod.GET)
	public String listarNominasPorUsuario(Model model,HttpSession session) {
		
		int idUsuario = 3, mes = 3;
		
	   	 model.addAttribute("listarU", nominaDAO.listarNominasPorUsuario(idUsuario, mes));
		 model.addAttribute("usu", new Usuario());
		
		return "listarNominasPorUsuario";
	}
	
	*/
	
	private boolean noLogueado(HttpSession session) {
		Usuario usuarioLogueado = (Usuario) session.getAttribute("usuLogeado");
		if (usuarioLogueado == null || session.isNew()) {
			return true;
		}
		return false;
	}
	
	@RequestMapping(value="/principalAdmin", method = RequestMethod.GET)
	public String principalAdmin(Model model,@ModelAttribute Usuario usu,HttpSession session,@RequestParam(value="mensaje", required=false, defaultValue="") String mensaje) {
		if(noLogueado(session)) {
			model.addAttribute("errorLogin","Inicie sesión para entrar");
			return "redirect:/";
		}
		model.addAttribute("mensaje", mensaje);
		//model.addAttribute("listarJ", JuegoDAO.listarTodos());
		 
		//for (Juego j : JuegoDAO.listarTodos()) {
		//	System.out.println(j);
			
		//}	
		model.addAttribute("usu", new Usuario());
		return "principalAdmin";
	}
	
}

	

