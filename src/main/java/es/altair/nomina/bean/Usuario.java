package es.altair.nomina.bean;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="usuarios")
public class Usuario implements Serializable{
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idUsuario;
	private String nombre;
	private String login;
	private String email;
	private String password;
	private int tipo;
	
	@OneToMany(mappedBy="usuarios", cascade=CascadeType.ALL)
	public Set<Nomina> nominas = new HashSet<Nomina>();

	@OneToMany(mappedBy="usuariosRef", cascade=CascadeType.ALL)
	public Set<NominaRef> nominasRef = new HashSet<NominaRef>();
	
	public Usuario() {
		
	}

	public Usuario(String nombre, String login, String email, String password, int tipo) {
		super();
		this.nombre = nombre;
		this.login = login;
		this.email = email;
		this.password = password;
		this.tipo = tipo;
	}

	public int getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getTipo() {
		return tipo;
	}

	public void setTipo(int tipo) {
		this.tipo = tipo;
	}

	public Set<Nomina> getNominas() {
		return nominas;
	}

	public void setNominas(Set<Nomina> nominas) {
		this.nominas = nominas;
	}

	@Override
	public String toString() {
		return "Usuario [idUsuario=" + idUsuario + ", nombre=" + nombre + ", login=" + login + ", email=" + email
				+ ", password=" + password + ", tipo=" + tipo + ", nominas=" + nominas + ", nominasRef=" + nominasRef
				+ "]";
	}
	
	
}
