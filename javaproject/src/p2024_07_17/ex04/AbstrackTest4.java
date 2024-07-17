package p2024_07_17.ex04;

abstract class ShapeClass{
	abstract void draw();
}

class Circ extends ShapeClass{
	@Override
	void draw() { 
		System.out.println("원을 그린다");
	}
}

class Rect extends ShapeClass{
	@Override
	void draw() { 
		System.out.println("사각형을 그린다");
	}
}

class Tria extends ShapeClass{
	@Override
	void draw() { 
		System.out.println("삼각형을 그린다");
	}
}


public class AbstrackTest4 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ShapeClass c =new Circ();
		ShapeClass r = new Rect();
		ShapeClass t = new Tria();
		c.draw();
		r.draw();
		t.draw();
	}

}
