package p2024_07_17;

import packTest.packOne.AccessTest;

class SubOne extends AccessTest {//child class
	void subPrn() {
//		System.out.println(a); //private x
//		System.out.println(b); //default x
		System.out.println(c); // protected o
		System.out.println(d); // public o
	}//end of subPrn 
}//end of class

public class SuperSubA {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		AccessTest at = new AccessTest();
		at.print();
		System.out.println("main");
//		System.out.println(at.a); // private x
//		System.out.println(at.b); // default x
//		System.out.println(at.c); // protected x
		System.out.println(at.d); // public o
	}//end of main

}//end of class
