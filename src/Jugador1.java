

public class Jugador1 extends Jugador {
	public String nombre;
	public String tipoFicha;
	
	public Jugador1(String nombre) {
		super(nombre);
		this.tipoFicha = "X";
	}
	
	public String getNombre() {
		return this.nombre;
	}
	
	public String getTipoFicha() {
		return this.tipoFicha;
	}
}
