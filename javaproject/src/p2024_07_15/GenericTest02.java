package p2024_07_15;

class TestClass2{
	private Object member;
	
	public void setValue (Object value) {
		member = value;
	}
	
	public Object getValue () {
		return member;
	}
}

public class GenericTest02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		TestClass2 obj01 = new TestClass2();
		
		obj01.setValue(3);
		System.out.println("되돌리는 값은 ->"+obj01.getValue());
		//다운캐스팅 + 언박싱
		int n = ((Integer)(obj01.getValue())).intValue();
		
		obj01.setValue(3.14); 
		System.out.println("되돌리는 값은 ->"+obj01.getValue());
		//다운캐스팅 + 언박싱
		double d = ((Double)(obj01.getValue())).doubleValue();
		
		
		obj01.setValue("이해할 수 있다."); 
		System.out.println("되돌리는 값은 ->"+obj01.getValue());
		//다운캐스팅 + 언박싱
		String str = (String)obj01.getValue();
	}

}