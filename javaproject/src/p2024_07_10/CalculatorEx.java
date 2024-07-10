package p2024_07_10;

class Calculator{
	void powerOn() {
		System.out.println("전원을 켭니다.");
	}
	
	int plus(int x,int y)
	{
		int result = x+y;
		return result;
	}
	
	double divide(int x, int y)
	{
		double result = (double)x/(double)y;
		return result;
	}
	
	void powerOff()
	{
		System.out.println("전원을 끕니다.");
	}
}

public class CalculatorEx {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Calculator myCalc = new Calculator();
		myCalc.powerOn();
		
		int result1 = myCalc.plus(5, 6);
		System.out.println("result1: "+result1);
		
		byte x=10;
		byte y=4;
		double result2 = myCalc.divide(10, 4);
		System.out.println("result2: "+result2);
		
		myCalc.powerOff();
		
	}

}
