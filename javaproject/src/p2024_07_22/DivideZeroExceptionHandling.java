package p2024_07_22;

public class DivideZeroExceptionHandling {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int a = 0;
		int b= 20;
		int c=0;
		
		try {
			c= b/a;
			//예외 발생시 아래쪽 코드는 실행되지 않는다.
			int total =a+b;
			int sub =b-a;
			//예외 발생하지 않으면 try쪽만 실행되고 catch쪽은 실행되지 않는다.
		} catch(ArithmeticException ae) {
			a = 2;
			c= b/a;
		}
		System.out.println(c);
	}

}
