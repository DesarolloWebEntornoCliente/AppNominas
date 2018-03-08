package es.altair.nomina.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import es.altair.nomina.bean.Concepto;
import es.altair.nomina.bean.Nomina;
import es.altair.nomina.bean.NominaRef;
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
	public String login(@ModelAttribute Usuario usu, HttpSession sesion, Model model) {
		usu = usuarioDAO.comprobarUsuario(usu.getLogin(), usu.getPassword());
		
		if (usu != null) {
			sesion.setAttribute("usuLogeado", usu);
			switch (usu.getTipo()) {
			case 1:
				model.addAttribute("usuario", usuarioDAO.obtenerUsuarioPorId(usu.getIdUsuario()));				
				return "redirect:/listarUsuarios/" + usu.getIdUsuario();
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
		 
		for (NominaRef j : nominaDAO.listarTodos()) {
			System.out.println(j);
			
		}	
		
		return new ModelAndView("home", "command", new Usuario());
	}
	
	@RequestMapping(value="/listarUsuarios/{id}", method = RequestMethod.GET)
	public String listarUsuarios(@PathVariable("id")int idUsuario, @ModelAttribute Usuario usuario, Model model, HttpSession session) {
		
		if(noLogueado(session)) {
			model.addAttribute("errorLogin","Inicie sesión para entrar");
			return "redirect:/";
		}
				
		 model.addAttribute("usu", new Usuario());
   		 model.addAttribute("usu1", usuarioDAO.obtenerUsuarioPorId(idUsuario));
   		 
		return "listarUsuarios";
	}

	@RequestMapping(value="/cerrarSesion", method = RequestMethod.GET)
	public String cerrarSesion(HttpSession session) {
				
		return "redirect:/";
	}
	
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
	
	
	@RequestMapping(value="/usuarios", method = RequestMethod.GET)
	public String inicio(Model model) {
		model.addAttribute("usuario", new Usuario());
		model.addAttribute("listUsuarios", usuarioDAO.listarUsuarios());
		
		return "usuarios";
	}
	
	@RequestMapping(value="/perfil/{id}", method = RequestMethod.GET)
	public String perfil(Model model, Usuario usuario, @PathVariable("id")int idUsuario) {
		model.addAttribute("usuario", usuarioDAO.obtenerUsuarioPorId(idUsuario));
		
		return "perfil";
	}
	
	@RequestMapping(value="/deleteUsuario/{id}") 
	public String delete1(@PathVariable("id")int idUsuario) {
		
		usuarioDAO.borrarUsuario(idUsuario);
		
		return "redirect:/usuarios";
	}
	
	@RequestMapping(value="/editUsuario/{id}") 
	public String editarUsuario(@PathVariable("id")int idUsuario, Model model) {
		Usuario u = usuarioDAO.obtenerUsuarioPorId(idUsuario);
		
		model.addAttribute("usuario", u);
		model.addAttribute("listUsuarios", usuarioDAO.listarUsuarios());
		
		return "usuarios";
	}
	
	@RequestMapping(value="/adicionaEditaUsuario/{control}", method= RequestMethod.POST)
	public String adicionarEditar1(@PathVariable("control")int control, @ModelAttribute Usuario u) {
		
		if(u.getIdUsuario() == 0)
			usuarioDAO.insertar(u);
		else
			usuarioDAO.ActualizarUsuario(u);
		
		if(control == 50)
			return "redirect:/usuarios";
		else
			return "redirect:/listarUsuarios/" + u.getIdUsuario();
		
	}
	
	@RequestMapping(value="/registraUsuario", method= RequestMethod.POST)
	public String registra(@ModelAttribute Usuario u) {
		
			usuarioDAO.insertar(u);
		
		return "redirect:/";
		
	}
	
}

	

