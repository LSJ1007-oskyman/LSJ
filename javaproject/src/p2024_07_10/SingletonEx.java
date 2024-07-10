package p2024_07_10;

class Singleton{
	private static Singleton s = new Singleton();
	
	private Singleton() {} ;
	
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
		
		obj1.check();
		obj1.check1();
		obj2.check();
		obj2.check1();
	}

}
