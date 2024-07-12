package p2024_07_12;

public class StringBufferTest3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		StringBuffer sb1 = new StringBuffer("gemini is beautiful");
		System.out.println(sb1);
		
		sb1.insert(10, "very ");
		System.out.println(sb1);
		
		sb1.insert(0, 1004);
		System.out.println(sb1);

	}

}
