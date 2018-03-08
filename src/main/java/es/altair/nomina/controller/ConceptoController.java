package es.altair.nomina.controller;

import org.jboss.logging.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import es.altair.nomina.bean.Concepto;
import es.altair.nomina.dao.ConceptoDAO;

@Controller
public class ConceptoController {

	@Autowired
	private ConceptoDAO conceptoDAO;
	
	@RequestMapping(value="/conceptos", method = RequestMethod.GET)
	public String inicio(Model model) {
		model.addAttribute("concepto", new Concepto());
		model.addAttribute("listConceptos", conceptoDAO.listConceptos());
		
		return "conceptos";
	}
	
	@RequestMapping(value="/delete/{id}") 
	public String deleteConcepto(@PathVariable("id")int idConcepto) {
		
		conceptoDAO.delete(idConcepto);
		
		return "redirect:/conceptos";
	}
	
	@RequestMapping(value="/edit/{id}") 
	public String editarConcepto(@PathVariable("id")int idConcepto, Model model) {
		Concepto c = conceptoDAO.obtenerConceptoPorId(idConcepto);
		
		model.addAttribute("concepto", c);
		model.addAttribute("listConceptos", conceptoDAO.listConceptos());
		
		return "conceptos";
	}
	
	
	@RequestMapping(value="/adicionaEdita", method= RequestMethod.POST)
	public String adicionarEditar(@ModelAttribute Concepto c) {
		
		if(c.getIdConcepto() == 0)
			conceptoDAO.insertar(c);
		else
			conceptoDAO.editConcepto(c);
		
		return "redirect:/conceptos";
		
	}
	
}
