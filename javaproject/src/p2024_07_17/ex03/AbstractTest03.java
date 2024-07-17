package p2024_07_17.ex03;

abstract class AbstractClass{//추상 클래스
	abstract void Method01();//추상 메서드
	void Method02() {//일반메서드
		System.out.println("Method02:  추상클래스에서 구현");
	}
}

abstract class MiddleClass extends AbstractClass{
	public void Method03() {
		System.out.println("Method03:  추상클래스에서 구현");
	}
}

class SubClass extends MiddleClass{//AbstractClass, SubClas 두곳중 한곳은 메서드 오버라이딩해야함

	@Override
	void Method01() {
		// TODO Auto-generated method stub
		System.out.println("Method01:  서브클래스에서 구현된 추상메소드");
	}
	
}

public class AbstractTest03 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		SubClass obj = new SubClass();
		obj.Method01();
		obj.Method02();
		obj.Method03();
	}

}
