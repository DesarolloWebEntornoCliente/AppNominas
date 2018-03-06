package es.altair.nomina.dao;

import es.altair.nomina.bean.Usuario;

import java.util.List;

import es.altair.nomina.bean.Nomina;

public interface NominaDAO {

	List<Nomina> listar(Usuario u);
	List<Nomina> listarTodos();
	List<Nomina> listarNominasPorUsuario(int idUsuario, int mes); 

}
