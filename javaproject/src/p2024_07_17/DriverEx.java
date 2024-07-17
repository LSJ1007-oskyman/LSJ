package p2024_07_17;

class Vehicle{
	public void run() {
		System.out.println("차량이 달립니다.");
	}
}

class Driver{
	public void Driver(Vehicle vehical) { //업캐스팅을 통해서 자동형변환을 하여 매개변수를 받음
		vehical.run();
	}
}

class Bus extends Vehicle{

	@Override
	public void run() {
		// TODO Auto-generated method stub
		System.out.println("버스를 달립니다.");
	}
	
}

class Taxi extends Vehicle{

	@Override
	public void run() {
		// TODO Auto-generated method stub
		System.out.println("택시를 달립니다.");
	}
	
}

public class DriverEx {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Driver driver = new Driver();
		Bus bus = new Bus();
		Taxi taxi = new Taxi();
		
		driver.Driver(bus);
		driver.Driver(taxi);
	}

}
