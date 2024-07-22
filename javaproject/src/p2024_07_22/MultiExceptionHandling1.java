package p2024_07_22;

public class MultiExceptionHandling1 {
	//finally안에 들어 있는 내용으 예외가 발생하든,발생하지 앉든 무조건 실행

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int value =20;
		int div=10;
		int [] intArray = {1,2,3};
		
		try { 
			int result  =value/div;
			System.out.println(result);
			int arrayValue = intArray[2];
			System.out.println(arrayValue);
		} catch(ArithmeticException ae) {
			System.out.println(ae.toString());
		} catch (ArrayIndexOutOfBoundsException ai) {
			ai.printStackTrace();
		} finally {
			System.out.println("예외가 발생했음!");
		}
	}

}
