package p2024_07_17.ex15;

interface IHello{
	int a = 10;
	public abstract void sayHello(String name);
}

interface IGoodBye{
	public abstract void sayGoodBye(String name);
}

interface ITotal extends IHello, IGoodBye{
	public abstract void greeting(String name);
}

class SubClass  implements ITotal{

	@Override
	public void greeting(String name) {
		// TODO Auto-generated method stub
		System.out.println(name+", 안녕!");
		
	}

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

public class InterfaceTest05 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		SubClass test = new SubClass();
		test.sayHello("홍길동");
		test.sayGoodBye("홍길동");
		test.greeting("홍길동");
		System.out.println(IHello.a);
	}

}