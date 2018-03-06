package es.altair.nomina.dao;

import java.util.ArrayList;
import java.util.List;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import es.altair.nomina.bean.Concepto;

@Repository
public class ConceptoDAOImpl implements ConceptoDAO {

private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	@Override
	public List<Concepto> listConceptos() {
		
		Session sesion = sessionFactory.getCurrentSession();
		
		return (List<Concepto>)sesion.createQuery("from Concepto").list();
	}

	@Transactional
	@Override
	public void editConcepto(Concepto c) {
		
		Session sesion = sessionFactory.getCurrentSession();

		sesion.update(c);
	}

	@Transactional
	@Override
	public void insertar(Concepto c) {
		Session sesion = sessionFactory.getCurrentSession();

		sesion.persist(c);
	}

	@Transactional
	@Override
	public void delete(int id) {
		Session sesion = sessionFactory.getCurrentSession();

		sesion.delete(obtenerConceptoPorId(id));
	}

	@Transactional
	@Override
	public Concepto obtenerConceptoPorId(int id) {
		Session sesion = sessionFactory.getCurrentSession();

		return (Concepto)sesion.get(Concepto.class, id); 
	}
	

}
