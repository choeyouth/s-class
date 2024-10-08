package com.test.question;

public class Q101 {
	
	public static void main(String[] args) {
		
		//바리스타
		Barista barista = new Barista();

		//손님 1
		//에스프레소 1잔 주문 - 원두 30g
		Espresso e1 = barista.makeEspresso(30);
		e1.drink();

		//손님 2
		//라테 1잔 주문 - 원두 30g, 우유 250ml
		Latte l1 = barista.makeLatte(30, 250);
		l1.drink();

		//손님 3
		//아메리카노 1잔 주문 - 원두 30g, 물 300ml, 각얼음 20개
		Americano a1 = barista.makeAmericano(30, 300, 20);
		a1.drink();

		//손님 4
		//에스프레소 10잔 주문 - 원두 25g
		Espresso[] e2 = barista.makeEspressoes(25, 10);

		for (Espresso e : e2) {
		      e.drink();
		}

		//손님 5
		//라테 5잔 주문 - 원두 25g, 우유 300ml
		Latte[] l2 = barista.makeLattes(25, 300, 5);

		for (Latte l : l2) {
		      l.drink();
		}

		//손님 6
		//아메리카노 15잔 주문 - 원두 20g, 물 350ml, 각얼음 30개
		Americano[] a2 = barista.makeAmericanos(20, 350, 30, 15);

		for (Americano a : a2) {
		      a.drink();
		}

		//결산
		barista.result();
		
	}

}

class Coffee {
	private static int bean; //총 원두량(g)
	private static int water; //총 물 용량(ml)
	private static int ice; //총 얼음 개수(개)
	private static int milk; //총 우유 용량(ml)
	
	private static int beanUnitPrice = 1; //원두 단가(원) //1g당 1원
	private static double waterUnitPrice = 0.2; //물 단가(원) //1ml당 0.2원
	private static int iceUnitPrice = 3; //얼음 단가(원) //1개당 3원
	private static int milkUnitPrice = 4; //우유 단가(원) //1ml당 4원
	
	private static int beanTotalPrice; //원두 총 판매액(원)
	private static double waterTotalPrice; //물 총 판매액(원)
	private static int iceTotalPrice; //얼음 총 판매액(원)
	private static int milkTotalPrice; //우유 총 판매액(원)
	
	private static int americano; //아메리카노 총 판매 개수(잔)
	private static int latte; //라테 총 판매 개수(잔)
	private static int espresso; //에스프레소 총 판매 개수(잔)
	
	public static int getBean() {
		return bean;
	}
	public static void setBean() {
		Coffee.bean = 0;
	}
	public static int getWater() {
		return water;
	}
	public static void setWater() {
		Coffee.water = 0;
	}
	public static int getIce() {
		return ice;
	}
	public static void setIce() {
		Coffee.ice = 0;
	}
	public static int getMilk() {
		return milk;
	}
	public static void setMilk() {
		Coffee.milk = 0;
	}
	public static int getBeanUnitPrice() {
		return beanUnitPrice;
	}
	public static void setBeanUnitPrice() {
		Coffee.beanUnitPrice = 1;
	}
	public static double getWaterUnitPrice() {
		return waterUnitPrice;
	}
	public static void setWaterUnitPrice() {
		Coffee.waterUnitPrice = 0.2;
	}
	public static int getIceUnitPrice() {
		return iceUnitPrice;
	}
	public static void setIceUnitPrice() {
		Coffee.iceUnitPrice = 3;
	}
	public static int getMilkUnitPrice() {
		return milkUnitPrice;
	}
	public static void setMilkUnitPrice() {
		Coffee.milkUnitPrice = 4;
	}
	public static int getBeanTotalPrice() {
		return beanTotalPrice;
	}
	public static void setBeanTotalPrice() {
		Coffee.beanTotalPrice = 0;
	}
	public static double getWaterTotalPrice() {
		return waterTotalPrice;
	}
	public static void setWaterTotalPrice() {
		Coffee.waterTotalPrice = 0;
	}
	public static int getIceTotalPrice() {
		return iceTotalPrice;
	}
	public static void setIceTotalPrice() {
		Coffee.iceTotalPrice = 0;
	}
	public static int getMilkTotalPrice() {
		return milkTotalPrice;
	}
	public static void setMilkTotalPrice() {
		Coffee.milkTotalPrice = 0;
	}
	public static int getAmericano() {
		return americano;
	}
	public static void setAmericano() {
		Coffee.americano = 0;
	}
	public static int getLatte() {
		return latte;
	}
	public static void setLatte() {
		Coffee.latte = 0;
	}
	public static int getEspresso() {
		return espresso;
	}
	public static void setEspresso() {
		Coffee.espresso = 0;
	}
	
	public static void countEspresso(Espresso espresso) {
		Coffee.espresso++;
		Coffee.bean += espresso.getBean();
		Coffee.beanTotalPrice += Coffee.beanUnitPrice * espresso.getBean();
	}

	public static void countLatte(Latte latte) {
		Coffee.latte++;
		Coffee.bean += latte.getBean();
		Coffee.milk += latte.getMilk();
		Coffee.beanTotalPrice += Coffee.beanUnitPrice * latte.getBean();
		Coffee.milkTotalPrice += Coffee.milkUnitPrice * latte.getMilk();
	}
	
	public static void countAmericano (Americano americano) {
		Coffee.americano++;
		Coffee.bean += americano.getBean();
		Coffee.ice += americano.getIce();
		Coffee.water += americano.getWater();
		Coffee.beanTotalPrice += Coffee.beanUnitPrice * americano.getBean();
		Coffee.iceTotalPrice += Coffee.iceUnitPrice * americano.getIce();
		Coffee.waterTotalPrice += Coffee.waterUnitPrice * americano.getWater();
	}
	
}

class Espresso {
	private int bean; //에스프레소 생산 시 들어가는 원두량(g)
	
	public int getBean() {
		return bean;
	}
	Espresso(int bean) {
		this.bean = bean;
	}
	
	void drink() {
		System.out.printf("원두 %dg으로 만들어진 에스프레소를 마십니다.\n", this.bean);
	}
}

class Latte {
	private int bean;
	private int milk;
	
	public int getBean() {
		return bean;
	}

	Latte(int bean, int milk) {
		this.bean = bean;
		this.milk = milk;
	}

	public int getMilk() {
		return milk;
	}


	void drink() {
		System.out.printf("원두 %dg, 우유 %dml으로 만들어진 라테를 마십니다.\n", this.bean, this.milk);
	}
}


class Americano {
	private int bean;
	private int water;
	private int ice;
	
	public int getBean() {
		return bean;
	}

	public int getWater() {
		return water;
	}

	Americano(int bean, int water, int ice) {
		this.bean = bean;
		this.ice = ice;
		this.water = water;
	}

	public int getIce() {
		return ice;
	}

	void drink() {
		System.out.printf("원두 %dg, 물 %dml, 얼음 %d개로 만들어진 아메리카노를 마십니다.\n", this.bean, this.water, this.ice);
	}
}

class Barista {
	Espresso makeEspresso(int bean) { // int bean : 원두량(g)
		//에스프레소 1잔을 만든다.
		Espresso espresso = new Espresso(bean);
		Coffee.countEspresso(espresso);
		return espresso; // : 에스프레소 1잔
	}
	
	public Espresso[] makeEspressoes(int bean, int count) {
		//에스프레소 N잔을 만든다.
		Espresso[] espressoes = new Espresso[count];
		for(int i=0; i<espressoes.length; i++) {
			Espresso espresso = new Espresso(bean);
			Coffee.countEspresso(espresso);
			espressoes[i] = espresso;
		}
		return espressoes; //: 에스프레소 N잔
	}
	
	Latte makeLatte(int bean, int milk) {
		//라테 1잔을 만든다.
		Latte latte = new Latte(bean, milk);
		Coffee.countLatte(latte);
		return latte; // : 라테 1잔
	}
	
	Latte[] makeLattes(int bean, int milk, int count) {
		//라테 N잔을 만든다.
		Latte[] lattes = new Latte[count];
		for(int i=0; i<lattes.length; i++) {
			Latte latte = new Latte(bean, milk);
			Coffee.countLatte(latte);
			lattes[i] = latte;
		}
		return lattes; // : 라테 N잔
	}
	
	Americano makeAmericano(int bean, int water, int ice) {
		//아메리카노 1잔을 만든다.
		Americano americano = new Americano(bean, water, ice);
		Coffee.countAmericano(americano);
		return americano; // : 아메리카노 1잔
	}
	
	Americano[] makeAmericanos(int bean, int water, int ice, int count) {
		//아메리카노 N잔을 만든다.
		Americano[] americanos = new Americano[count];
		for(int i=0; i<americanos.length; i++) {
			Americano americano = new Americano(bean, water, ice);
			Coffee.countAmericano(americano);
			americanos[i] = americano;
		}
		return americanos; // : 아메리카노 N잔
	}
 
	void result() {
		System.out.println();
		System.out.println("=================================");
		System.out.println("           판매 결과");
		System.out.println("=================================");
	
		System.out.println("---------------------------------");
		System.out.println("          음료 판매량");
		System.out.println("---------------------------------");
		System.out.printf("에스프레소 : %d잔\n", Coffee.getEspresso());
		System.out.printf("아메리카노 : %d잔\n", Coffee.getAmericano());
		System.out.printf("라테 : %d잔\n", Coffee.getLatte());
		
		System.out.println("---------------------------------");
		System.out.println("         원자재 소비량");
		System.out.println("---------------------------------");
		System.out.printf("원두 : %,dg\n", Coffee.getBean());
		System.out.printf("물 : %,dml\n", Coffee.getWater());
		System.out.printf("얼음 : %,d개\n", Coffee.getIce());
		System.out.printf("우유 : %,dml\n", Coffee.getMilk());
		
		System.out.println("---------------------------------");
		System.out.println("             매출액");
		System.out.println("---------------------------------");
		System.out.printf("원두 : %,d원\n", Coffee.getBeanTotalPrice());
		System.out.printf("물 : %,.0f원\n", Coffee.getWaterTotalPrice());
		System.out.printf("얼음 : %,d원\n", Coffee.getIceTotalPrice());
		System.out.printf("우유 : %,d원\n", Coffee.getMilkTotalPrice());
		
	}
	
}