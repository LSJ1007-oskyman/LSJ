package p2024_07_15;

class TestClass{
	private int member;
	
	public void setValue (int value) {
		member = value;
	}
	
	public int getValue () {
		return member;
	}
}

public class GenericTest01 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		TestClass obj01 = new TestClass();
		obj01.setValue(3);
		System.out.println("되돌리는 값은 ->"+obj01.getValue());
//		obj01.setValue(3.14); 애러발생
		System.out.println("되돌리는 값은 ->"+obj01.getValue());
//		obj01.setValue("이해할 수 있다."); 애러발생
		System.out.println("되돌리는 값은 ->"+obj01.getValue());
		
	}

}
