import java.util.Stack;

public class Printer{
	 
	public int number;
    public boolean ocuppied;
    
    public Printer(int numero)
    {
         this.number = numero + 1;
         this.ocuppied = false;
    }

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public boolean isOcuppied() {
		return ocuppied;
	}

	public void setOcuppied(boolean ocuppied) {
		this.ocuppied = ocuppied;
	}
	

	
}
