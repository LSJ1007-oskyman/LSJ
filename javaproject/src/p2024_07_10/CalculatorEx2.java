package p2024_07_10;

class Calculator2{
	int plus(int x, int y)
	{
		int result = x+y;
		return result;
	}
	
	double avg(int x, int y)
	{
		double sum = plus(x,y);
		double result = sum/2;
		return result;
	}
	
	void execute() {
		double result = avg(7,10);
		println("실행결과: "+result);
	}
	
	void println(String message)
	{
		System.out.println(message);
	}
}

public class CalculatorEx2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Calculator2 myCalc = new Calculator2();
		myCalc.execute();
	}

}
