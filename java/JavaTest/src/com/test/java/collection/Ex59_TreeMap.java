package com.test.java.collection;

import java.util.Collection;
import java.util.HashMap;
import java.util.Set;
import java.util.TreeMap;
import java.util.Vector;

public class Ex59_TreeMap {

	public static void main(String[] args) {
		
		/*
		
			TreeMap
			- 키 + 값 > Map
			- 이진 탐색 트리 > 내부 정렬
			
		*/
		
		TreeMap<String, String> map = new TreeMap<String, String>();
		
		map.put("white", "흰색");
		map.put("black", "검정색");
		map.put("red", "빨강");
		map.put("yellow", "노랑");
		map.put("blue", "파랑");
		
		System.out.println(map);
		
		System.out.println(map.get("white")); //흰색

		System.out.println(map.firstKey()); //black
		System.out.println(map.lastKey()); //yellow
		
		System.out.println(map.headMap("m")); //{black=검정색, blue=파랑}
		System.out.println(map.tailMap("m")); //{red=빨강, white=흰색, yellow=노랑}
		System.out.println(map.subMap("r", "w")); //{red=빨강}
		
		
		/*
			
			컬렉션 정리
			
			List 
			- ArrayList *** 1
			- Stack
			- Queue
			- LinkedList
			- Vector(X)
			
			Set
			- HashSet *** 3
			- TreeSet
			
			Map
			- HashMap *** 2
			- TreeMap
			- Properties > 나중에
			- HashTable(X)
			
			
		*/
		
		Vector<Integer> v = new Vector<>();
		v.add(100);
		System.out.println(v.get(0));
		
		
		
		HashMap<String, String> map2 = new HashMap<String, String>();
		
		map2.put("white", "흰색");
		map2.put("black", "검정색");
		map2.put("red", "빨강");
		map2.put("yellow", "노랑");
		map2.put("blue", "파랑");
		
		// Map > Loop(X) > O 
		
		Set<String> set = map2.keySet();
		System.out.println(set); //[red, white, blue, black, yellow]

		for(String key : set) {
			System.out.println(key);
		}
		
		Collection<String> values = map2.values();
		System.out.println(values);
		
		for (String value : values) {
			System.out.println(value);
		}
		System.out.println();
		System.out.println();
		System.out.println();
		
		for(String key : set) {
			System.out.printf("map[%s] = %s\n"
							, key
							, map2.get(key));
		}
		
		
	
		
		
		
		
		
		
	}
	
}
