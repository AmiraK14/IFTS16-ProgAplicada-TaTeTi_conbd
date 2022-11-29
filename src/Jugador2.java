import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Jugador2 extends Jugador{
	public String nombre;
	public String tipoFicha;
	public int fila;
	public int columna;
	
	public Jugador2(String nombre) {
		super(nombre);
		this.tipoFicha = "0";
	}
	
	public String getNombre() {
		return this.nombre;
	}
	
	public String getTipoFicha() {
		return this.tipoFicha;
	}
	
	public Ubicacion elegirUbicacionFicha(int idiomaElegido) {
		try
		{
		    Class.forName("com.mysql.cj.jdbc.Driver");
		    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mijuego?user=root");
		    Statement stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);  
		    ResultSet rs=stmt.executeQuery("select * from mensaje_x_idioma where id_idioma ="+idiomaElegido+";");
		    fila = (int)(Math.random()*(3-0)+0);
		    rs.absolute(14);
			fila = verificarUbicacionValida(fila);
			//System.out.println(rs.getString("mensaje")+": "+fila);
			columna = (int)(Math.random()*(3-0)+0);
			columna = verificarUbicacionValida(columna);
			rs.absolute(15);
		    //System.out.println(rs.getString("mensaje")+": "+columna);
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
	
	public int verificarUbicacionValida(int ubicacion) {
		 while (ubicacion>2 || ubicacion<0) {
			ubicacion = Integer.parseInt(lector.nextLine());
		}
		 return ubicacion;
	}
	
	public int getFila() {
		return this.fila;
	}
	public int getColumna() {
		return this.columna;
	}
	
}

