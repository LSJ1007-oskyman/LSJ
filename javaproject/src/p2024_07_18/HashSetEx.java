package p2024_07_18;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class HashSetEx {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Set<String> list = new HashSet<String>();
		list.add("Java");
		list.add("JDBC");
		list.add("servlet/JSP");
		list.add("Java");
		list.add("iBATIS");
		
		int size = list.size();
		System.out.println("총 객체 수: "+size);
		
		Iterator<String> iterator = list.iterator();
		while(iterator.hasNext()) {
			String element = iterator.next();
			System.out.println("\t"+element);
		}
		
		
		list.remove("JDBC");
		list.remove("iBATIS");

		System.out.println("총 객체 수: "+list.size());
		
		iterator = list.iterator();
		for(String element : list) {
			System.out.println("\t"+element);
		}
		
		list.clear();
		
		if(list.isEmpty()) {
			System.out.println("비어있음");
		}
	}

}
