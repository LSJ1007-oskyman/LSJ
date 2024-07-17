package p2024_07_17.ex12;

interface IHello{
	public abstract void sayHello(String name);
}

interface IGoodBye{
	public abstract void sayGoodBye(String name);
}

class SubClass implements IHello,IGoodBye{

	@Override
	public void sayGoodBye(String name) {
		// TODO Auto-generated method stub
		System.out.println(name+"씨 안녕히 가세요!");
	}

	@Override
	public void sayHello(String name) {
		// TODO Auto-generated method stub
		System.out.println(name+"씨 안녕하세요");
	}
	
}

public class InterfaceTest02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		SubClass test = new SubClass();
		test.sayHello("홍길동");
		test.sayGoodBye("홍길동");
	}

}
