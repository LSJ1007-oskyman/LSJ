package p2024_07_22;

public class ThrowsExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			findClass();
		}catch (ClassNotFoundException e) {
			System.out.println("클래스가 존재하지 않습니다.");
		}
	}
	
	public static void findClass() throws ClassNotFoundException {
		Class clazz  = Class.forName("java.lang.String2");//예외발생->java.lang안에 String2라는 클래스는 없다.
	}

}
