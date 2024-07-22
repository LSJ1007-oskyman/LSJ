package p2024_07_19;

import java.util.HashMap;
import java.util.Map;

public class MapTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		// Map은 인터페이스이기 때문에 자체적으로 객체 생성을 할 수 없다.
//		Map m = new Map();			// 에러 발생
		
		Map m = new HashMap();		// 업캐스팅(자동 형변환)
		HashMap hm = new HashMap();
		
		// put(Object key, Object value)
		hm.put("woman", "gemini");
		hm.put("man", "johnharu");
		hm.put("age", new Integer(10)); // 업캐스팅+박싱
		hm.put("city", "seoul");
		hm.put("city", "busan");	    // 중복 key 사용
		// 중복된 key를 사용하면 가장 마지막의 value값만 사용할 수 있다.
		
		System.out.println(hm);
		
		// HashMap의 key 구해온다.
		System.out.println(hm.keySet());
		
		// key를 이용해서 value값 구하기
		// Object  get(Object key)
		System.out.println(hm.get("woman"));
		System.out.println(hm.get("city"));
		
		Object obj = hm.get("city");
		String str = (String)hm.get("city"); // 다운캐스팅(강제 형변환)
		
		Integer it = (Integer)hm.get("age"); // 다운캐스팅(강제 형변환)
		int age = it.intValue();             // 언박싱
		
		// 다운캐스팅(강제 형변환) + 언박싱
		int age2 = ((Integer)(hm.get("age"))).intValue();	
		
	}

}
