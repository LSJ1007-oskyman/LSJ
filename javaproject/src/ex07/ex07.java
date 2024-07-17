package ex07;

// 상속에서의 생성자
// 1.생성자는 기본적으로 상속이 되지 않는다. 
// 2.자식클래스로 객체를 생성할때 자식 클래스의 
//   생성자(기본생성자, 매개변수가 있는 생성자 모두)가 호출되면, 부모 클래스의 
//   기본 생성자가 자동으로 호출된다.
// 3.부모 클래스의 매개변수가 생성자를 호출할때는 super()를 이용해서 호출할 수 있다. 
// 4.자식 클래스에서 super()를 사용할때는 자식클래스의 생성자에서 가장 먼저 사용해야한다.

class Point2D{					// 부모 클래스
	protected int x = 10;
	
	protected int y = 20;
	
	public Point2D() {			// 기본 생성자
		System.out.println("부모 클래스인 Point2D 생성자 호출");
	}
}
class Point3D extends Point2D{	// 자식 클래스
	protected int z = 30;
	
	public void print() {
		System.out.println(x+", "+ y + ", "+ z);
	}
	public Point3D(int a) {
		System.out.println("자식 클래스인 Point3D 생성자 호출");
	}	
}
public class ex07 {
	public static void main(String[] args) {
		Point3D pt = new Point3D(30);
		System.out.println("--------------------");
		pt.print();    //생성자 호출 
	}

}
