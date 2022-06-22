import java.awt.List;
import java.util.ArrayList;
import java.util.Random;
import java.util.Stack;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class Main {

	public static void main(String[] args) throws InterruptedException {
		// TODO Auto-generated method stub

		int numA = 3;
		int numB = 4;
		int i = 0;
	
		Stack trabajos = new Stack();
		
		ArrayList<Thread> impresorasA = new ArrayList<Thread>();
		ArrayList<Thread> impresorasB = new ArrayList<Thread>();
		
		
		
		//Generando las impresoras A
		for(i = 0; i < numA; i++)
		{
			Printer prntA = new Printer(i);
			Thread th_PrinterA = new Thread(()-> {
				try {
					Print_A(prntA,trabajos);
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			});
			
			impresorasA.add(th_PrinterA);
			
		}
	
		//Generando las impresoras B
		for(i = 0; i < numB; i++)
		{
			Printer prntB = new Printer(i);
			Thread th_PrinterB = new Thread(()-> {
				try {
					Print_B(prntB,trabajos);
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			});
			
			impresorasB.add(th_PrinterB);
			
		}
		
		//Thread para comenzar a generar trabajos de la impresora
		Thread th_generate = new Thread(() -> {
			try {
				generarTrabajo(trabajos);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		});
		th_generate.start();
		
		
		//Inicializando todas las impresoras A
		for(i = 0; i < numA; i++)
		{
			impresorasA.get(i).start();			
		}
	
		//Inicializando todas las impresoras A
		for(i = 0; i < numB; i++)
		{
			impresorasB.get(i).start();
		}
	
	
		
	}
	
	public static void generarTrabajo(Stack trabajos) throws InterruptedException
	{
		Object[] tipoTrabajo = {"B","A","AB"};
		Random random = new Random();
		
		do
		{
			 
			int option = random.nextInt(3);
			trabajos.push(tipoTrabajo[option]);
			//System.out.println(trabajos);
			Thread.sleep(200);
			
		}while(true);
		
	}
	
	
	public static void Print_A(Printer prntA, Stack trabajos) throws InterruptedException 
    {
		
        do
        {
            
			Thread.sleep(1300);
			
            prntA.ocuppied = false; //desocupando la impresora para el siguiente trabajo   
            if ((trabajos.peek().toString() == "A" || trabajos.peek().toString() == "AB") && prntA.ocuppied == false) //si la impresora no esta ocupada y  el trabajo a realizar es de tipo A, realizar operacion
            {
                prntA.ocuppied = true; //la impresora estara ocupada procesando el trabajo
                System.out.println("imprimiendo trabajo " + trabajos.size() + " en A #" + prntA.number + " Cantidad de trabajos restantes: " + (trabajos.size() - 1));
                trabajos.pop();
               
				Thread.sleep(700);
				
            }
        } while (true);
    }

	public static void Print_B(Printer prntB, Stack trabajos) throws InterruptedException
    {
        do
        {
            
            
			Thread.sleep(1300);
			
            prntB.ocuppied = false; //desocupando la impresora para el siguiente trabajo   
            if ((trabajos.peek().toString() == "B" || trabajos.peek().toString() == "AB") && prntB.ocuppied == false) //si la impresora no esta ocupada y  el trabajo a realizar es de tipo A, realizar operacion
            {
                prntB.ocuppied = true; //la impresora estara ocupada procesando el trabajo
                System.out.println("imprimiendo trabajo " + trabajos.size() + " en B #" + prntB.number + " Cantidad de trabajos restantes: " + (trabajos.size() - 1));
                trabajos.pop();
                
				Thread.sleep(700);
				
            }
        } while (true);
    }


}

 

