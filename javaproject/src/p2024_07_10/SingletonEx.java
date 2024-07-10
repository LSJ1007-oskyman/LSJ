package p2024_07_10;

//싱글톤 사용이유 : 사용자가 많아지면, 사용자 마다 각각의 객채를 선언해서 메서드를 호출하면 서버 메모리 관리에 상당한 부담을 줘서 객체를 한개만 사용해서 메모리 관리를 보다 편하게 해줌

class Singleton{
	private static Singleton s = new Singleton(); //private으로 접근을 막고있으나 getinstance로 접근가능
	
	private Singleton() {} //직접 클래스로 객체 생성하는것을 막아주는 역할, new연산자로 객채생성하는것을 막는다.
	
	public static Singleton getInstance() {
		return s;
	}
	
	public void check() {
		System.out.println("메소드 호출 성공1");
	}
	
	public void check1() {
		System.out.println("메소드 호출 성공2");
	}
	
}

public class SingletonEx {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Singleton obj1 =Singleton.getInstance();
		Singleton obj2 =Singleton.getInstance();
		System.out.println(obj1);
		System.out.println(obj2);
		
		
		if(obj1 == obj2) {
			System.out.println("같은 주소");
		} else {
			System.out.println("다른 주소");
		}
		
//		Singleton obj = Singleton.s; ->오류 발생 private으로 접근 불가
//		Singleton s = new Singleton(); ->오류 발생 기본생성자가 private이므로 접근불가
		
		obj1.check();
		obj1.check1();
		obj2.check();
		obj2.check1();
	}

}
