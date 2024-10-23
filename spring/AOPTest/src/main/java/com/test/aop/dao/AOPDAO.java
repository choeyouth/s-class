package com.test.aop.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.test.aop.dto.AOPDTO;

@Repository
public class AOPDAO {

	private static List<AOPDTO> list;
	
	static {
		list = new ArrayList<AOPDTO>();
		
		AOPDTO dto1 = new AOPDTO();
		dto1.setName("멍멍이");
		dto1.setAge(3);
		dto1.setColor("검정");
		
		AOPDTO dto2 = new AOPDTO();
		dto2.setName("냐옹이");
		dto2.setAge(5);
		dto2.setColor("하양");
		
		AOPDTO dto3 = new AOPDTO();
		dto3.setName("삐약이");
		dto3.setAge(1);
		dto3.setColor("노랑");
		
		list.add(dto1);
		list.add(dto2);
		list.add(dto3);
		
	}
	
	public List<AOPDTO> list() {
		
//		System.out.println("[목록보기]");
//		
//		for (AOPDTO dto : list) {
//			System.out.println(dto);
//		}
		
		return list;
		
	}
	
	public void add(AOPDTO dto) {
		
		list.add(dto);
		
	}

	public AOPDTO view(String name) {

		for (int i=0; i<list.size(); i++) {
			if (list.get(i).getName().equals(name)) {
				return list.get(i);
			}
		}
		
		return null;
		
	}
 

	
}
