package es.altair.nomina.dao;

import java.util.List;

import es.altair.nomina.bean.Usuario;

public interface UsuarioDAO {
	
	Usuario comprobarUsuario(String login, String password);

	void insertar(Usuario usu);

	//boolean validarEmail(Usuario usu);
	
	List<Usuario> listarUsuarios();

	void borrarUsuario(int idUsuario);
	
	Usuario obtenerUsuarioPorId(int idUsuario);

	void ActualizarUsuario(Usuario u);
	
	public boolean verificarLogin(String login);

	boolean verificarLoginEditar(String login, int id);

}
