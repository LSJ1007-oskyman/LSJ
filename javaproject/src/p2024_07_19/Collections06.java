package p2024_07_19;

import java.util.Vector;

public class Collections06 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Vector<String> vec = new Vector<String>();
		vec.add("Apple");
		vec.add("banana");
		vec.add("oRANGE");
		
		String temp;
		for(int i=0; i<vec.size(); i++) {
			temp = vec.get(i);
			System.out.println(vec.get(i));
			System.out.println(temp.toUpperCase());
		}

	}

}
