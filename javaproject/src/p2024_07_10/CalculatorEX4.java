package p2024_07_10;

class Calculator4{
	static double pi = 3.14159;
	
	static int plus(int x, int y)
	{
		return x+y;
	}
	
	static int minus(int x,int y)
	{
		return x-y;
	}
}

public class CalculatorEX4 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		double result1 =10*10*Calculator4.pi;
		int result2 =Calculator4.plus(10, 5);
		int result3 =Calculator4.minus(10, 5);
		
		System.out.println("result1 : "+result1);
		System.out.println("result2 : "+result2);
		System.out.println("result2 : "+result3);
	}

}
