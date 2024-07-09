package p2024_07_09;


class FieldInitValue {

	byte byteField;
	short shortField;
	int intField;
	long longField;
	
	boolean booleanField;
	char charField;
	
	float floatField;
	double doubleField;
	
	int[] arrField;
	String referenceField;
}

public class FieldInitValueEx {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		FieldInitValue fiv = new FieldInitValue();
		
		System.out.println("byteField: "+fiv.byteField);
		System.out.println("shortField: "+fiv.shortField);
		System.out.println("intField: "+fiv.intField);
		System.out.println("booleanField: "+fiv.booleanField);
		System.out.println("charField: "+fiv.charField);
		System.out.println("floatField: "+fiv.floatField);
		System.out.println("doubleField: "+fiv.doubleField);
		System.out.println("arrField: "+fiv.arrField);
		System.out.println("referenceField: "+fiv.referenceField);
	}

}
