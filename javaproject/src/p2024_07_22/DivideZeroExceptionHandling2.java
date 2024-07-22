package p2024_07_22;

public class DivideZeroExceptionHandling2 {

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
			System.out.println(total);
			System.out.println(sub);
			//예외 발생하지 않으면 try쪽만 실행되고 catch쪽은 실행되지 않는다.
		} catch(Exception e) {
			//예외 정보를 자세히 출력
			e.printStackTrace();
			//예외 정보를 문자열로 반환함
			System.out.println(e.getMessage());
			//예외의 간단한 설명문을 반환함
			System.out.println(e.toString());
			
			System.out.println("0으로 나눌수 없습니다.");
		}
		
	}

}
