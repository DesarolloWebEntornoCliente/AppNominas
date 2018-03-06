package es.altair.nomina.dao;

import java.util.List;

import es.altair.nomina.bean.Concepto;

public interface ConceptoDAO {

	public List<Concepto> listConceptos();
	
	public void editConcepto(Concepto c);
	
	public void insertar(Concepto c);
	
	public void delete(int id);
	
	public Concepto obtenerConceptoPorId(int id);
	
}
