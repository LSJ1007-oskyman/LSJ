package p2024_07_15;

public class WrapperEX {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("max ="+Integer.MAX_VALUE);
		System.out.println("min ="+Integer.MIN_VALUE);
		
		int n = Integer.parseInt("20");
		System.out.println(n);
		System.out.println(n+10);
		
		System.out.println("2진수: "+Integer.toBinaryString(10));
		System.out.println("8진수:"+Integer.toOctalString(10));
		System.out.println("16진수:"+Integer.toHexString(10));
	}

}
