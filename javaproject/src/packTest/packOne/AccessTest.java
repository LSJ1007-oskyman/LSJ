package packTest.packOne;

public class AccessTest { //parent class
	private int a =10;
	int b=10;
	protected int c =30;
	public int d=40;
	
	public void print() {
		System.out.println("AccessTestdml print");
		System.out.println(a);
		System.out.println(b);
		System.out.println(c);
		System.out.println(d);
	}//end  of method
}//end of class
