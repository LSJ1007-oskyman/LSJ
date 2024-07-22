package p2024_07_22;
//멀티 예외처리
//1. 에외가 발생할 가능성이 있는 코드가 여러개 있을 겅우에, 각 예외 상황에 맞는
//   예외 메세지를  출력 할때 주로 사용한다.
//2. 멀티 예외처리 코드 있을 경우에도 가장 먼저 발생하는 예외 처리 1개만 처리된다.
public class MultiExceptionHandling {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int value = 20;
		int div = 0;
		int[] intArray = {1,2,3};
		
		try {
			//int arrayValue = intArray[4];
			//System.out.println(arrayValue);
			int result = value/div;
			System.out.println(result);
			int arrayValue = intArray[4];
			System.out.println(arrayValue);
		} catch (ArithmeticException ae) {
			System.out.println(ae.toString());
			System.out.println("0으로 나눌수 없습니다.");
		} catch (ArrayIndexOutOfBoundsException ai) {
			ai.printStackTrace();
			System.out.println("배열의 범위를 벗어 났습니다.");
		}
		
		

	}//end of main

}//end of class
