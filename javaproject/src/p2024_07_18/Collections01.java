package p2024_07_18;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class Collections01 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Set set =new HashSet();
		
		System.out.println("요소의 갯수 ->"+set.size());
		set.add("하나");
		set.add(2);
		set.add(3.24);
		set.add("넷");
		set.add("five");
		set.add(6);
		set.add(6);
		System.out.println("요소의 갯수 ->"+set.size());
		System.out.println(set);
		
		Iterator elements =set.iterator();
		while(elements.hasNext()) {
			System.out.println("\t\t"+elements.next());
		}

	}

}
