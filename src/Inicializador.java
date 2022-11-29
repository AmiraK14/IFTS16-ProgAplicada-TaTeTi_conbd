import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.util.Scanner;


public class Inicializador{
    public static void main(String[] args) {
    	Scanner lector = new Scanner(System.in);
    	System.out.println("Seleccione el idioma / Select your language / Wähle deine Sprache:");
    	System.out.println("1. Espanol / 2. English / 3. Deutsch");
    	int idiomaElegido = Integer.parseInt(lector.nextLine());
    	
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mijuego?user=root");
            Statement stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            String sqlqueryppal = "select * from mensaje_x_idioma where id_idioma ="+idiomaElegido;
            ResultSet rs=stmt.executeQuery(sqlqueryppal);
            rs.absolute(19);
            System.out.println(rs.getString("mensaje"));
            int seleccion = Integer.parseInt(lector.nextLine());
            if (seleccion == 2) {
            	Statement stmt2=con.createStatement();
            	ResultSet rs2=stmt.executeQuery("select * from partidas;");
            	//rs2.last();
            	//int ultimaFila = rs2.getRow();
            	System.out.println("----------------------------------------------------------------------------------------------------------");
            	System.out.printf("%1s %15s %28s %30s", "FECHA/DATE/JAHRESZAHL", "NOMBRE/NAME", "PUNTOS/POINTS/PUNKTE", "PUNTOS/POINTS/PUNKTE PC");
            	System.out.println();
            	System.out.println("----------------------------------------------------------------------------------------------------------");
            	while (rs2.next()){
                    System.out.format("%1s %23S %20s %30s",
                            rs2.getDate("fecha"), rs2.getString("nombreJugador"), rs2.getInt("puntosJugador"), rs2.getInt("puntosComputadora"));
                    System.out.println();
                }
                System.out.println("---------------------------------------------------------------------------------------------------------");
            } else if (seleccion == 1) {
            	rs.first();
            	System.out.println("**********************************************************************************");
        		System.out.println("******* "+ rs.getString("mensaje")+" *******");
        		System.out.println("**********************************************************************************\n");
        		rs.absolute(2);
        		System.out.println(rs.getString("mensaje"));
        		String nombre = lector.nextLine();
        		Jugador jugador1 = new Jugador1(nombre);
        		rs.absolute(3);
        		System.out.println(nombre + ", "+rs.getString("mensaje")+"\n");
        		
        		rs.absolute(6);
        		Jugador jugador2 = new Jugador2(rs.getString("mensaje"));
        		
        		rs.absolute(4);
        		System.out.println(rs.getString("mensaje"));
        		
        		rs.absolute(5);
        		System.out.println(rs.getString("mensaje"));
        		
        		
        		int jugadorActual;
        		boolean jugadaEfectuada;
        		Tablero primerTablero = new Tablero();
        		String jugarNuevamente;
        		

        		do {
        			primerTablero.crearTablero();
        			int contadorJugadas = 0;
        			boolean hayCoincidencia = false;
        			while (contadorJugadas < 9 && hayCoincidencia==false) {
        				//primerTablero.mostrarTablero();
        				if (contadorJugadas%2==0) {
        					jugadorActual = 1;
        					rs.absolute(18);
        					System.out.println(nombre + " " + rs.getString("mensaje"));
        					jugadaEfectuada = primerTablero.colocarFicha(jugador1.elegirUbicacionFicha(idiomaElegido), jugador1.getTipoFicha(), idiomaElegido, jugadorActual);
        					primerTablero.mostrarTablero();
        				} else {
        					/*rs.absolute(6);
        					System.out.print(rs.getString("mensaje")+" ");
        					rs.absolute(18);
        					System.out.print(rs.getString("mensaje")+"\n");*/
        					jugadorActual = 2;
        					Ubicacion jugadaJugador2 = jugador2.elegirUbicacionFicha(idiomaElegido);
        					jugadaEfectuada = primerTablero.colocarFicha(jugadaJugador2, jugador2.getTipoFicha(), idiomaElegido, jugadorActual);
        					if (jugadaEfectuada == true) {
        						rs.absolute(6);
            					System.out.print(rs.getString("mensaje")+" ");
            					rs.absolute(18);
            					System.out.print(rs.getString("mensaje")+"\n");
        						rs.absolute(14);
        						System.out.println(rs.getString("mensaje") +" " + jugadaJugador2.getUbicacionFila()); //Muestra FILA Computadora
        						rs.absolute(15);
        						System.out.println(rs.getString("mensaje") +" " +jugadaJugador2.getUbicacionColumna());//Muestra COLUMNA Computadora
        						primerTablero.mostrarTablero();
        					}
        				}
        				if (jugadaEfectuada==true) {
        					if (contadorJugadas > 3) {
        						if (primerTablero.chequearCoincidenciaHorizontal() || primerTablero.chequearCoincidenciaVertical() || primerTablero.chequearCoincidenciaDiagonal()) {
        							hayCoincidencia=true;
        							//primerTablero.mostrarTablero();
        							if (jugadorActual == 1) {
        								rs.absolute(7);
        								System.out.println("******* "+ nombre.toUpperCase() +" "+rs.getString("mensaje")+"!!! *******");
        								jugador1.sumarPuntos();
        								
        							} else {
        								rs.absolute(6);
        								System.out.print("******* "+rs.getString("mensaje")+" ");
        								rs.absolute(7);
        								System.out.println(rs.getString("mensaje")+"!!! *******");
        								jugador2.sumarPuntos();

        							}
        							rs.absolute(21);
    								System.out.println("+++ "+rs.getString("mensaje")+" +++");
    								System.out.println(nombre +": "+jugador1.getPuntos());
    								rs.absolute(6);
    								System.out.println(rs.getString("mensaje") +": " + jugador2.getPuntos());
        							
        						} else {
        							contadorJugadas++;
        						}
        					} else {
        						contadorJugadas++;
        					}
        				}
        			}
        			if (hayCoincidencia==false) {
        				primerTablero.mostrarTablero();
        				rs.absolute(9);
        				System.out.println(rs.getString("mensaje"));
        			}
        			rs.absolute(10);
        			System.out.println("\n"+rs.getString("mensaje"));
        			jugarNuevamente = lector.nextLine();
        			jugarNuevamente = jugarNuevamente.toUpperCase();
        			rs.absolute(11);
        		} while (jugarNuevamente.equals(rs.getString("mensaje")));
        		rs.absolute(12);
        		System.out.println(rs.getString("mensaje"));
        		
        		String queryInsert = "INSERT INTO partidas (puntosComputadora, puntosJugador, nombreJugador) VALUES (?,?,?)";
        	    PreparedStatement pst = con.prepareStatement(queryInsert);
        	    rs.absolute(22);
        		System.out.println(rs.getString("mensaje"));
        		
        		pst.setInt(1,jugador2.getPuntos());
        		pst.setInt(2, jugador1.getPuntos());
        		pst.setString(3, nombre);
        		pst.executeUpdate();
        		
        		rs.absolute(13);
        		System.out.println("******** "+rs.getString("mensaje")+" ********");
        		jugador1.mostrarPuntosFinales();
        		jugador2.mostrarPuntosFinales();
            }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
    }  
}

