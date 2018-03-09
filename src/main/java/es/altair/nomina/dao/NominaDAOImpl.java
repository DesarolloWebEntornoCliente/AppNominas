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
import es.altair.nomina.bean.Irpf;
import es.altair.nomina.bean.Meses;
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
	public List<NominaRef> listarNominasPorUsuario(int idUsuario) {

		List<NominaRef> nominas = new ArrayList<NominaRef>();
		
		Session sesion = sessionFactory.getCurrentSession();
		
		nominas = (List<NominaRef>) sesion.createQuery("SELECT u FROM NominaRef u WHERE idUsuario=:id order by mes")
				.setParameter("id", idUsuario)
				.list();
		
		return nominas;
	}

	@Transactional
	@Override
	public List<Nomina> obtenerNominas(int idUsuario, int mes) {
		
		Session sesion = sessionFactory.getCurrentSession();
		
		List<Nomina> nominas = new ArrayList<Nomina>();
				

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
		
		Session sesion = sessionFactory.getCurrentSession();
		
		sesion.update(n);
		
	}

	@Transactional
	@Override
	public void insertar(Nomina n) {
		
		Session sesion = sessionFactory.getCurrentSession();

		if(n.getConceptos().getIdConcepto() == 1) {
			
			NominaRef nRef = new NominaRef(n.getValor(), n.getMes(), n.getUsuarios());
			
			sesion.createSQLQuery("insert into nominasref (valor, mes, idUsuario) values (:v, :m, :u)")
			.setParameter("v", n.getValor())
			.setParameter("m", n.getMes())
			.setParameter("u", n.getUsuarios().getIdUsuario()).executeUpdate();
		}
		
		sesion.persist(n);
	}

	@Transactional
	@Override
	public Nomina obtenerNominaPorId(int id) {
		
		Session sesion = sessionFactory.getCurrentSession();

		return (Nomina)sesion.get(Nomina.class, id); 
	}

	@Transactional
	@Override
	public void delete(int id) {
		
		Session sesion = sessionFactory.getCurrentSession();

		sesion.createQuery("DELETE FROM Nomina WHERE idNomina=:id")
		.setParameter("id", id)
		.executeUpdate();
		
	}



	@Transactional
	@Override
	public Meses obtenerMes(int idMes) {
		
		Session sesion = sessionFactory.getCurrentSession();

		return (Meses)sesion.get(Meses.class, idMes); 
	}

	@Transactional
	@Override
	public List<Meses> listaMeses() {
		
		 Session sesion = sessionFactory.getCurrentSession();
			
		return (List<Meses>) sesion.createSQLQuery("select * from meses ").addEntity(Meses.class).list();
	}

	@Transactional
	@Override
	public List<Irpf> listaTablaIrpf() {
		
		 Session sesion = sessionFactory.getCurrentSession();
			
			return (List<Irpf>) sesion.createSQLQuery("select * from irpf ").addEntity(Irpf.class).list();
	}
	


}
