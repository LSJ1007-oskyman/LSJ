package p2024_07_19;

import java.util.Vector;

public class Collections05 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Vector vec = new Vector();
		vec.add("Apple");
		vec.add("banana");
		vec.add("oRANGE");
		
		String temp;
		for(int i=0; i<vec.size(); i++) {
			temp = (String)vec.get(i);
			System.out.println(vec.get(i));
			System.out.println(temp.toUpperCase());
		}

	}

}
