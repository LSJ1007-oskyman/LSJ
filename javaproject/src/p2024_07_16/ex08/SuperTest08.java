package p2024_07_16.ex08;

class Point2D{						// 부모 클래스
	protected int x = 10;
	protected int y = 20;
	
	public Point2D() {					// 기본 생성자
		System.out.println("부모 클래스인 Point2D 생성자 호출");
	}
	public Point2D(int x, int y) {
		this.x = x;
		this.y = y;
	}	
}

// super()
// 1. super()는 부모 클래스의 매개변수를 가진 생성자를 호출할때 사용한다.
// 2. super()는 자식 클래스의 생성자 안에서 첫번째 라인에 사용해야 한다.
// 3. super()를 이용해서 부모 클래스의 매개변수를 가진 생성자를 호출하면,
//    더이상 부모 클래스의 기본 생성자를 호출해주지 않는다.
class Point3D extends Point2D{		// 자식 클래스
	protected int z = 30;
	
	public void print() {
		System.out.println(x+", "+ y + ", "+ z);
	}
	public Point3D() {
		super(50, 60);		// 부모 클래스의 매개변수가 있는 생성자를 호출
		System.out.println("자식 클래스인 Point3D 생성자 호출");
	}
}
public class SuperTest08 {
	public static void main(String[] args) {
		Point3D pt = new Point3D();
		pt.print();		//생성자 호출
	}

}


