package p2024_07_17.ex10;

interface IHello{
	void sayHello(String name);
}

class Hello implements IHello{

	@Override
	public void sayHello(String name) {
		// TODO Auto-generated method stub
		System.out.println(name+"씨 안녕하세요!");
	}
	
}

public class interfaceTest01 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Hello obj = new Hello();
		obj.sayHello("홍길동");
		obj.sayHello("홍길동");
	}

}
