package es.altair.nomina.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import es.altair.nomina.bean.Usuario;

@Repository
public class UsuarioDAOImpl implements UsuarioDAO {
	
String pass = "altair123$%";

String key = "47AE31A79FEEB2A3"; // LLAVE DE INCRIPTACIÓN
String iv = "0123456789ABCDEF"; // VETOR DE INICIALIZACIÓN
	
private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Transactional
	@Override
	public Usuario comprobarUsuario(String login, String password) {
		Usuario usu = null;
		
		Session sesion = sessionFactory.getCurrentSession();
		
			try {
				usu = (Usuario) sesion.createQuery("SELECT u FROM Usuario u WHERE login=:c AND password=:p")
						.setParameter("c", login)
						.setParameter("p", Util.Encriptaciones.encrypt(key, iv, password))
						.uniqueResult();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return usu;
	}
	
	@Transactional
	@Override
	public void insertar(Usuario usu) {
		Session sesion = sessionFactory.getCurrentSession();
		
		try {
			usu.setPassword(Util.Encriptaciones.encrypt(key, iv, usu.getPassword()));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		sesion.persist(usu);
		

		
	}
	
	@Transactional
	@Override
	public boolean validarEmail(Usuario usu) {
		Session sesion = sessionFactory.getCurrentSession();
		boolean correcto = true;
		
		
			//COMENTAR
			sesion.beginTransaction();
						
			if( (Usuario) sesion.createQuery("FROM Usuario WHERE email=:c")
			.setParameter("c", usu.getEmail())
			.uniqueResult() !=null)
				correcto = false;
			
			//COMENTAR
			sesion.getTransaction().commit();

		return correcto;

		
		
		
	}
	@Transactional
	@Override
	public List<Usuario> listarUsuarios() {
		Session sesion = sessionFactory.getCurrentSession();

		return (List<Usuario>) sesion.createQuery("From Usuario").list();
	}
	
	@Transactional
	@Override
	public void borrarUsuario(int idUsuario) {
		Session sesion = sessionFactory.getCurrentSession();
		sesion.delete(obtenerUsuarioPorId(idUsuario));
		
	}
	
	@Transactional
	@Override
	public Usuario obtenerUsuarioPorId(int idUsuario) {
		Session sesion = sessionFactory.getCurrentSession();
		return (Usuario)sesion.get(Usuario.class, idUsuario);
	}
	
	@Transactional
	@Override
	public void ActualizarUsuario(Usuario u) {
		Session sesion = sessionFactory.getCurrentSession();
		sesion.update(u);
		
	}

}
