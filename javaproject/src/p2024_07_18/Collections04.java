package p2024_07_18;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class Collections04 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		List list = new ArrayList();
		list.add("하나");
		list.add(2);
		list.add(2);
		list.add(3.42);
		list.add("넷");
		list.add("five");
		list.add(6);
		
		System.out.println(list);
		System.out.println(list.get(2));
		System.out.println(list.get(4));
		
		for(Object s :list)
		{
			System.out.print(s+"\t");
		}
		System.out.println();
		Iterator elements =list.iterator();
		while(elements.hasNext()) {
			System.out.println("\t\t"+elements.next());
		}
	}

}
