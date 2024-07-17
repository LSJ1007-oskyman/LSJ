package p2024_07_17;
abstract class AbstractClass{
	abstract void Method01();
	void Method02() {
		System.out.println("Method02: 추상클래스에서 구현");
	}
}

class SubClass extends AbstractClass{
	@Override
	void Method01() {
		// TODO Auto-generated method stub
		System.out.println("Method01: 서브클래스에서 구현된 추상메소드");
	}
}


public class AbstractTest01 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		SubClass obj = new SubClass();
		obj.Method01();
		obj.Method02();
	}

}
