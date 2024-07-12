package p2024_07_12;

public class StringBufferTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		StringBuffer sb1 = new StringBuffer("gemini");
		System.out.println("sb1.length() : "+sb1.length());
		System.out.println("sb1.capacity() : "+sb1.capacity());
		
		sb1.append("A String buffer implements"+"a mutable sequence of characters");
		System.out.println("sb1.length() : "+sb1.length());
		System.out.println("sb1.capacity() : "+sb1.capacity());
		
		StringBuffer sb2 = new StringBuffer();
		System.out.println("sb2.length() : "+sb2.length());
		System.out.println("sb2.capacity() : "+sb2.capacity());
	}

}
