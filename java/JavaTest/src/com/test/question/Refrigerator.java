package com.test.question;

public class Refrigerator {
	
	
	private Item[] items = new Item[100];
	private int index = 0;
	
	
	public void add(Item item) {
		
		items[index] = item;
		index++;
		System.out.printf("%s를 냉장고에 넣었습니다.\n", item.getName());
		
	}
	
	//
	public Item get(String name) {
		
		System.out.println();
		
		int num = 0;
		Item getItem = null;
		
		for(int i=0; i<index; i++) {
			
			if(items[i].getName().equals(name)) {
				
				getItem = items[i];
				num = i;
				this.index--;
				break;

			} 
		}
		
		if(getItem != null) {
			for(int i=num; i<index; i++) {
				items[i] = items[i+1];
			}
		}
		
		return getItem;
		
	}
	
	public int count() {
		return index;
		
	}
	
	public void listItem() {
		System.out.println("\n[냉장고 아이템 목록]");
		for(int i=0; i<index; i++) {
			Item a = this.items[i];
			System.out.printf("%s(%s)\n", this.items[i].getName(), a.getExpiration());
		}
	}
	

}
