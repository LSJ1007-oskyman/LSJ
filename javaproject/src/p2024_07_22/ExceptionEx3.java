package p2024_07_22;

public class ExceptionEx3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int var =50;
		try {
			int data =Integer.parseInt(args[0]);
			System.out.println((double)var/data);
			//Exception예외 클래스가 하위 예외클래스들을 모두 가지고 있기 때문에 가장 마지막에 정의해야한다.
		}catch(NumberFormatException ne){
			System.out.println("숫자가 아닙니다.");
		}catch(ArithmeticException ae) {
			System.out.println("0으로 나룰순 없죠?");
		}catch (Exception e) {
			System.out.println("Exception ! !");
		}
		System.out.println("프로그램 종료!");
	}

}
