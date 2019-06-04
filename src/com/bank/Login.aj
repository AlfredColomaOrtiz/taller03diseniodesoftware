import java.util.Scanner;
/*
 * Gabriela Cuadros Cruz
 * Alfred Josue Coloma Ortiz
 * 
 * */
public aspect Login {
    //Aspecto2: El login debe realizarse antes de la transacci�n
	private static Scanner input = new Scanner(System.in);
	
	pointcut antes() : call(* make*()) || call( * my*() );
    before() : antes() {
    	System.out.println("ingrece primero sus datos");
    	System.out.println("ingrese su usuario");
    	input.nextLine();
    	
    	System.out.println("ingrese su clave");
    	input.nextLine();

    	
    }
}