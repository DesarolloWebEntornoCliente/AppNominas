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
		
		Usuario u;
		
		u =  (Usuario)sesion.get(Usuario.class, idUsuario);
				
		return u;
	}

	
	@Transactional
	@Override
	public void ActualizarUsuario(Usuario usu) {
		
		Session sesion = sessionFactory.getCurrentSession();		
		
		String passEnc = "";
		try {
			passEnc = Util.Encriptaciones.encrypt(key, iv, usu.getPassword().trim());
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

			sesion.createQuery("update Usuario set login=:l, password=:p, nombre=:n, email=:e, tipo=:t where idUsuario=:id")
					.setParameter("l", usu.getLogin())
					.setParameter("p", passEnc)
					.setParameter("n", usu.getNombre())
					.setParameter("e", usu.getEmail())
					.setParameter("id", usu.getIdUsuario())
					.setParameter("t", usu.getTipo()
					).executeUpdate();

		
		//sesion.update(usu);
		
	}
	
	@Transactional
	@Override
	public boolean verificarLogin(String login) {
		
		boolean correcto = false;
		
		Session sesion = sessionFactory.getCurrentSession();

			if ((Usuario) sesion.createQuery("From Usuario Where login=:e")
					.setParameter("e", login)
					.uniqueResult() != null)
				correcto = true;

			if(correcto)
				System.out.println("Usuario ya existe");

		return correcto;
	}
	
	
	@Transactional
	@Override
	public boolean verificarLoginEditar(String login, int id) {
		
		boolean correcto = false;
		Usuario u;
		
		Session sesion = sessionFactory.getCurrentSession();

			u = (Usuario) sesion.createQuery("From Usuario Where login=:e and idUsuario!=:i")
					.setParameter("e", login)
					.setParameter("i", id)
					.uniqueResult();
			
			if(u != null && u.getLogin().equals(login))
			correcto = true;

		return correcto;
	}	

}
