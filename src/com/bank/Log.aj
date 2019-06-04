import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
/*
 * Gabriela Cuadros Cruz
 * Alfred Josue Coloma Ortiz
 * 
 * */
public aspect Log {
    File f = new File("log.txt"); 
    Calendar cal = Calendar.getInstance();
    pointcut success() : call(* create*(..) );
    after() : success() {
    	System.out.println("**** User created ****");
    	
    }
    
    pointcut transaccion_realizada() : call( * makeTransaction());
    after() : transaccion_realizada(){
    	try{
    		FileWriter w = new FileWriter(f);
    		BufferedWriter bw = new BufferedWriter(w);
    		PrintWriter wr = new PrintWriter(bw);  
    		wr.write("transaccion realizada - "+cal.getTime()+" ");
    		wr.close();
    		bw.close();
    		}catch(IOException e){};
    }
    
    pointcut dinero_retirado() : call( * myMoney());
    after() : dinero_retirado(){
    	try{
    		FileWriter w = new FileWriter(f);
    		BufferedWriter bw = new BufferedWriter(w);
    		PrintWriter wr = new PrintWriter(bw);  
    		wr.write("dinero retirado - "+cal.getTime()+" ");
    		wr.close();
    		bw.close();
    		}catch(IOException e){};
    }

}