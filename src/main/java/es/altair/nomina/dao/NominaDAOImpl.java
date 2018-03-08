package es.altair.nomina.dao;

import java.io.Console;
import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import es.altair.nomina.bean.Nomina;
import es.altair.nomina.bean.NominaRef;
import es.altair.nomina.bean.Concepto;
import es.altair.nomina.bean.Usuario;

@Repository
public class NominaDAOImpl implements NominaDAO {

	private SessionFactory sessionFactory;
	
	private Session sesion;
	
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
	public List<NominaRef> listarTodos() {
		Session sesion = sessionFactory.getCurrentSession();

		return (List<NominaRef>) sesion.createQuery("From NominaRef order by mes, idUsuario").list();
	}

	@Transactional
	@Override
	public List<NominaRef> listarNominasPorUsuario(int idUsuario, int mes) {

		List<NominaRef> nominas = new ArrayList<NominaRef>();
		
		Session sesion = sessionFactory.getCurrentSession();
		
		nominas = (List<NominaRef>) sesion.createQuery("SELECT u FROM NominaRef u WHERE idUsuario=:id AND mes=:m")
				.setParameter("id", idUsuario)
				.setParameter("m", mes)
				.list();
		
		return nominas;
	}

	@Transactional
	@Override
	public List<Nomina> obtenerNominas(int idUsuario, int mes) {
		
		Session sesion = sessionFactory.getCurrentSession();
		
		List<Nomina> nominas = new ArrayList<Nomina>();
		
		System.out.println("Mes: " + mes + " -->> idNom: " + idUsuario);	
		

		nominas = (List<Nomina>) ((SQLQuery) sesion.createSQLQuery("select idNomina, valor, mes, n.idConcepto, idUsuario from nominas n join conceptos c on (n.idConcepto=c.idConcepto) WHERE idUsuario=:id AND mes=:m order by c.tipo ")
				.setParameter("id", idUsuario)
				.setParameter("m", mes))
				.addEntity(Nomina.class).list();

		System.out.println(nominas);
		
		return nominas;
	}

	@Transactional
	@Override
	public void editNomina(Nomina n) {
		// TODO Auto-generated method stub
		
	}

	@Transactional
	@Override
	public void insertar(Nomina n) {
		
		Session sesion = sessionFactory.getCurrentSession();

		sesion.persist(n);
		
	}

	@Override
	public Nomina obtenerNominaPorId(int id) {
		
		Session sesion = sessionFactory.getCurrentSession();

		return (Nomina)sesion.get(Nomina.class, id); 
	}

	@Override
	public void delete(int id) {
		
		System.out.println("Num NOmina: " + id);

		Session sesion = sessionFactory.getCurrentSession();

		sesion.createQuery("DELETE FROM Nomina WHERE idNomina=:id")
		.setParameter("id", id)
		.executeUpdate();

		
		
		//sesion.delete(obtenerNominaPorId(id));
		
	}
	


}
