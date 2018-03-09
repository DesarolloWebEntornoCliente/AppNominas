package es.altair.nomina.dao;

import es.altair.nomina.bean.Usuario;

import java.util.List;

import es.altair.nomina.bean.Meses;
import es.altair.nomina.bean.Nomina;
import es.altair.nomina.bean.NominaRef;

public interface NominaDAO {

	List<Nomina> obtenerNominas(int idUsuario, int mes);
	
	List<NominaRef> listarTodos();
	
	List<NominaRef> listarNominasPorUsuario(int idUsuario);
	
	List<Nomina> listar(Usuario u); 

	public void editNomina(Nomina n);
	
	public void insertar(Nomina n);
	
	//public void insertarNominaRef(NominaRef n);
	
	public void delete(int id);	

	public Nomina obtenerNominaPorId(int id);
	
	public Meses obtenerMes(int idMes);
	
	public List<Meses> listaMeses();

}
