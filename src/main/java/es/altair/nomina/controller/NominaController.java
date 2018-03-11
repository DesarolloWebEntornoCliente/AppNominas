package es.altair.nomina.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import es.altair.nomina.bean.Concepto;
import es.altair.nomina.bean.Nomina;
import es.altair.nomina.bean.NominaRef;
import es.altair.nomina.bean.Usuario;
import es.altair.nomina.dao.ConceptoDAO;
import es.altair.nomina.dao.NominaDAO;
import es.altair.nomina.dao.UsuarioDAO;

@Controller
public class NominaController {

	@Autowired
	private NominaDAO nominaDAO;
	
	@Autowired
	private ConceptoDAO conceptoDAO;
	
	@Autowired
	private UsuarioDAO usuarioDAO;
	
	@RequestMapping(value="/nominasReferencia", method = RequestMethod.GET)
	public String inicio2(Model model) {
		model.addAttribute("nomina", new NominaRef());
		model.addAttribute("listNominasRef", nominaDAO.listarTodos());
		
		return "nominasReferencia";
	}
	
	@RequestMapping(value="/nominasReferenciaUsu/{idUsu}", method = RequestMethod.GET)
	public String nominasRefUsu(@PathVariable("idUsu")int idUsuario, Model model) {
		model.addAttribute("nomina", new NominaRef());
		model.addAttribute("idUsuario", idUsuario);
		model.addAttribute("listNominasRef", nominaDAO.listarNominasPorUsuario(idUsuario));
		
		return "nominasReferenciaUsu";
	}
	
	
	private boolean noLogueado(HttpSession session) {
		Usuario usuarioLogueado = (Usuario) session.getAttribute("usuLogeado");
		if (usuarioLogueado == null || session.isNew()) {
			return true;
		}
		return false;
	}
	
	@RequestMapping(value="/nominas/{idN}/{m}", method = RequestMethod.GET)
	public String inicioNominas(@PathVariable("idN")int idNom, @PathVariable("m")int mes, Model model,HttpSession session) {
		
		if(noLogueado(session)) {
			model.addAttribute("errorLogin","Inicie sesión para entrar");
			return "redirect:/";
		}
		
		model.addAttribute("nomina", new Nomina());
		model.addAttribute("listNominas", nominaDAO.obtenerNominas(idNom, mes));
		model.addAttribute("listaCon", conceptoDAO.listConceptos());
		model.addAttribute("listaUsu", usuarioDAO.listarUsuarios());
		model.addAttribute("usuario", usuarioDAO.obtenerUsuarioPorId(idNom));
		model.addAttribute("mesActual", nominaDAO.obtenerMes(mes));
		model.addAttribute("listaMes", nominaDAO.listaMeses());		
		
		return "nominas";
	}
	
	@RequestMapping(value="/verNomina/{idU}/{m}", method = RequestMethod.GET)
	public String verNominas(@PathVariable("idU")int idUsu, @PathVariable("m")int mes, Model model,HttpSession session) {
		
		if(noLogueado(session)) {
			model.addAttribute("errorLogin","Inicie sesión para entrar");
			return "redirect:/";
		}
		
		model.addAttribute("nomina", new Nomina());
		model.addAttribute("listaIrpf", nominaDAO.listaTablaIrpf());
		model.addAttribute("listNominas", nominaDAO.obtenerNominas(idUsu, mes));
		model.addAttribute("listaCon", conceptoDAO.listConceptos());
		model.addAttribute("listaUsu", usuarioDAO.listarUsuarios());
		model.addAttribute("usu", usuarioDAO.obtenerUsuarioPorId(idUsu));
		
		return "verNomina";
	}
	
	
	@RequestMapping(value="/verMiNomina/{idU}/{m}", method = RequestMethod.GET)
	public String verMiNominas(@PathVariable("idU")int idUsu, @PathVariable("m")int mes, Model model,HttpSession session) {
		
		if(noLogueado(session)) {
			model.addAttribute("errorLogin","Inicie sesión para entrar");
			return "redirect:/";
		}
		
		model.addAttribute("nomina", new Nomina());
		model.addAttribute("listNominas", nominaDAO.obtenerNominas(idUsu, mes));
		model.addAttribute("listaCon", conceptoDAO.listConceptos());
		model.addAttribute("listaUsu", usuarioDAO.listarUsuarios());
		model.addAttribute("usu", usuarioDAO.obtenerUsuarioPorId(idUsu));
		model.addAttribute("listaIrpf", nominaDAO.listaTablaIrpf());
		
		return "verMiNomina";
	}
	
	@RequestMapping(value="/deleteNomina") 
	public String delete1(@RequestParam int idNomina) {
		
		Nomina n = nominaDAO.obtenerNominaPorId(idNomina);
		
		int idU = n.getUsuarios().getIdUsuario();
		int m   = n.getMes(); 
		
		nominaDAO.delete(idNomina);
		
		return "redirect:/nominas/" + idU + "/" + m;
	}
	
	@RequestMapping(value="/editNomina/{id}", method = RequestMethod.GET) 
	public String editarNomina2(@PathVariable("id")int idNomina, Model model, Nomina u) {
		
		System.out.println("Aqui esta el ID: " + idNomina);

		u = nominaDAO.obtenerNominaPorId(idNomina);
		
		System.out.println("Aqui esta ella: " + u);
 		
		model.addAttribute("nomina", u);
		model.addAttribute("listaCon", conceptoDAO.listConceptos());
		model.addAttribute("listaUsu", usuarioDAO.listarUsuarios());
		
		return "redirect:/nominas/" +  u.getUsuarios().getIdUsuario() + "/" + u.getMes();				
	}
	
	
	@RequestMapping(value="/adicionaEditaNomina", method= RequestMethod.POST)
	public String adicionarEditar2(@ModelAttribute Nomina n, Model model,HttpServletRequest request) {
		
		if(n.getIdNomina() == 0) {
		
			int m = Integer.parseInt(request.getParameter("mes"));
			double val = Double.parseDouble(request.getParameter("valor"));
			
			int idCon = Integer.parseInt(request.getParameter("concepto"));
			int idUsu = Integer.parseInt(request.getParameter("usuario"));
			
			Concepto c = conceptoDAO.obtenerConceptoPorId(idCon);
			Usuario u = usuarioDAO.obtenerUsuarioPorId(idUsu);
			
			n = new Nomina(val, m, c, u);			
			
			nominaDAO.insertar(n);
		}
		else {
			nominaDAO.editNomina(n);
	
		}
		
		model.addAttribute("nomina", n);
		model.addAttribute("listNominas", nominaDAO.obtenerNominas(n.getUsuarios().getIdUsuario(), n.getMes()));
		model.addAttribute("listaCon", conceptoDAO.listConceptos());
		model.addAttribute("listaUsu", usuarioDAO.listarUsuarios());
		
		return "redirect:/nominas/" +  n.getUsuarios().getIdUsuario() + "/" + n.getMes();
		
	}
	
}

