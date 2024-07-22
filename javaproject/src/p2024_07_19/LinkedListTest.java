package p2024_07_19;

import java.util.LinkedList;

public class LinkedListTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		LinkedList myQue = new LinkedList();
		myQue.offer("1-자바");
		myQue.offer("2-C++");
		myQue.offer("3-API");
		myQue.offer("4-MFC");
		
		while(myQue.isEmpty() != true) {
			System.out.println(myQue.poll());
		}
	}

}
