import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

public abstract class Jugador {
	public String nombre;
	public String tipoFicha;
	public Ubicacion ubicacionElegida;
	Scanner lector = new Scanner(System.in);
	public int puntos = 0;
	
	
	
	public Jugador(String nombre) {
		this.nombre = nombre;
	}
	
	public String getNombre() {
		return this.nombre;
	}
	
	public String getTipoFicha() {
		return this.tipoFicha;
	}
	
	
	public int getPuntos() {
		return this.puntos;
	}
	
	public Ubicacion elegirUbicacionFicha(int idiomaElegido) {
		try
		{
		    Class.forName("com.mysql.cj.jdbc.Driver");
		    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mijuego?user=root");
		    Statement stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);  
		    ResultSet rs=stmt.executeQuery("select * from mensaje_x_idioma where id_idioma ="+idiomaElegido+";");
		    rs.absolute(14);
		    System.out.println(rs.getString("mensaje")+": ");
			int fila = Integer.parseInt(lector.nextLine());
			fila = verificarUbicacionValida(fila,idiomaElegido);
			rs.absolute(15);
			System.out.println(rs.getString("mensaje")+":");
			int columna = Integer.parseInt(lector.nextLine());
			columna = verificarUbicacionValida(columna,idiomaElegido);
			ubicacionElegida = new Ubicacion(fila,columna);
			rs.close();
    		stmt.close();
    		con.close();
		}
		catch(Exception e)
		{
		    System.out.println(e);
		}
		return ubicacionElegida;
	}

	public int verificarUbicacionValida(int ubicacion, int idiomaElegido) {
		try
		{
		    Class.forName("com.mysql.cj.jdbc.Driver");
		    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mijuego?user=root");
		    Statement stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);  
		    ResultSet rs=stmt.executeQuery("select * from mensaje_x_idioma where id_idioma ="+idiomaElegido+";");
			while (ubicacion>2 || ubicacion<0) {
				rs.absolute(16);
				System.out.println(rs.getString("mensaje"));
				ubicacion = Integer.parseInt(lector.nextLine());
			}
			rs.close();
    		stmt.close();
    		con.close();
		}
		catch(Exception e)
		{
		    System.out.println(e);
		}
		return ubicacion;
		
	}
	
	public void sumarPuntos() {
		puntos++;
	}
	
	public void mostrarPuntosFinales() {
		System.out.println(this.nombre+": "+this.puntos+" puntos");
	}
}
