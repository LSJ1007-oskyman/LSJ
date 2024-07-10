package p2024_07_10;

class Calculator3{
	double areaRectangle(double width)
	{
		return width*width;
	}
	
	double areaRectangle(double width,double height) {
		return width*height;
	}
}

public class CalculatorEx3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Calculator3 myCalcu = new Calculator3();
		
		double result1 = myCalcu.areaRectangle(10);
		
		double result2 = myCalcu.areaRectangle(10,20);
		
		System.out.println("정사각형의 넓이= "+result1);
		System.out.println("직사각형의 넓이= "+result2);
	}

}
