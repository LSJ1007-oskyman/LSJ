package p2024_07_17;

class Point2D{
	private int x;
	private int y;
	
	public int getX() {
		return x;
	}
	
	public void setX(int new_X) {
		x=new_X;
	}
	
	public int getY() {
		return y;
	}
	
	public void setY(int new_Y) {
		y=new_Y;
	}
}

class Point3D extends Point2D{
	private int z;
	public int getZ() {
		return z;
	}
	
	public void setZ(int new_Z) {
		z = new_Z;
	}
}

public class SuperSub00 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Point3D pt = new Point3D();
		pt.setX(10);
		pt.setY(20);
		pt.setZ(30);
		
		System.out.println(pt.getX()
				+", "+pt.getY()
				+", "+pt.getZ());

	}//end of main

}//end of class