package p2024_07_22;

public class ThrowsExceptionHandling1 {
	//occurException()를 호출한 곳으로 예외처리를 양도 하겠다는 의미
	public void occerException() throws ArithmeticException{
		int result = 3/0;
		System.out.println(result);
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ThrowsExceptionHandling1 te = new ThrowsExceptionHandling1();
		try {
			te.occerException();
			
			
		//반드시 위에 양도한 오류종류와 맞아야한다.
		//최상위 클레스인 Exception으로는 가능
		}catch (ArithmeticException ae) {
			System.out.println("Exception이 발생 : "+ae.toString());
			System.out.println("0으로 나눌 수 없습니다.");
		}

	}

}
