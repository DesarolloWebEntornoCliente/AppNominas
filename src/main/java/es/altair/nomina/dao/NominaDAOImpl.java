package es.altair.nomina.dao;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import es.altair.nomina.bean.Nomina;
import es.altair.nomina.bean.Concepto;
import es.altair.nomina.bean.Usuario;

@Repository
public class NominaDAOImpl implements NominaDAO {

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	

	@Transactional
	@Override
	public List<Nomina> listar(Usuario u) {
		 Session sesion = sessionFactory.getCurrentSession();
	
		return (List<Nomina>) sesion.createSQLQuery("select * from nominas ").addEntity(Nomina.class).list();
	}

	@Transactional
	@Override
	public List<Nomina> listarTodos() {
		Session sesion = sessionFactory.getCurrentSession();

		return (List<Nomina>) sesion.createQuery("From Nomina").list();
	}


	@Override
	public List<Nomina> listarNominasPorUsuario(int idUsuario, int mes) {

		List<Nomina> nominas = new ArrayList<Nomina>();
		
		Session sesion = sessionFactory.getCurrentSession();
		
		nominas = (List<Nomina>) sesion.createQuery("SELECT u FROM Nomina u WHERE idUsuario=:id AND mes=:m")
				.setParameter("id", idUsuario)
				.setParameter("m", mes)
				.list();
		
		return nominas;
	}

}
