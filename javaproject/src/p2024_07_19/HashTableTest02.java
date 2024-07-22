package p2024_07_19;

import java.util.Enumeration;
import java.util.Hashtable;

public class HashTableTest02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Hashtable<String, String> ht = new Hashtable<String, String>();
		ht.put("사과", "Apple");
		ht.put("딸기", "StrawBerry");
		ht.put("포도", "Grapes");

		
		//키값을 알고 있는 경우
		String Val = ht.get("포도");
		if (Val != null) {
			System.out.println("포도 -> " + Val);
		}

		//키값을 모르는 경우
		Enumeration<String> Enum = ht.keys();
		while(Enum.hasMoreElements()) {
			String k = Enum.nextElement();
			String v = ht.get(k);
			System.out.println(k+" : "+v);
		}
	}//end of main

}//end of class
