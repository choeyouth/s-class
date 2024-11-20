package com.test.jpa.repository;

import static com.test.jpa.entity.QAddress.address1;
import static com.test.jpa.entity.QInfo.info;
import static com.test.jpa.entity.QMemo.memo1;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.querydsl.core.Tuple;
import com.querydsl.core.types.Projections;
import com.querydsl.jpa.impl.JPAQueryFactory;
import com.test.jpa.dto.AddressDTO;
import com.test.jpa.entity.Address;
import com.test.jpa.entity.Info;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class CustomAddressRepository {

	private final JPAQueryFactory jpaQueryFactory;

	public List<Address> findAll() {

		/*
		
			- selectFrom(엔티티)
				- select * from 엔티티
				- 해당 엔티티에서 모든 컬럼을 가져온다.
				- 결과셋 > 다시 원하는 추출(fetch)
			
			- fetch(): 리스트 조회. 결과셋을 다 반환. 결과가 없으면 빈 List 반환
			- fetchOne(): 단일 조회. 결과가 없으면 null 반환. 결과가 2개 이상면 예외 발생
			- fetchFirst(): 단일 조회. 결과가 N개라도 첫번째 레코드 반환
			- fetchResultSet(): 페이징 정보 포함된 결과셋 반환
			- fetchCount(): 카운트 반환
		
		*/
		
		return jpaQueryFactory.selectFrom(address1).fetch();
	}

	public Address findAddressByName(String name) {

		//1. 레코드 1개 반환 > fetchOne()
		//2. 조건절 > where()
		
		
		//Query did not return a unique result: 51 results were returned
		
		return jpaQueryFactory
					.selectFrom(address1)
					.where(address1.name.eq(name)) //where name = '강아지'
					.fetchOne();
	}

	public List<String> findAllName() {
		
		//- selectFrom(엔티티): select * from 
		//- select(컬럼).from(엔티티): select 컬럼 지정
		//	- select(Qtype.column1, Qtype.column2..) 
		
		
		//select name from Address;
		return jpaQueryFactory
					.select(address1.name)
					.from(address1)
					.fetch();
	}

	public List<Tuple> findAllNameAndAgeAndGender() {
		return jpaQueryFactory
					.select(address1.name, address1.age, address1.gender)
					.from(address1)
					.fetch();
	}

	public List<AddressDTO> findAllNameAndAddress() {
		
		return jpaQueryFactory
					.select(Projections.constructor(AddressDTO.class, address1.name, address1.address)) //DTO 생성 표현
					.from(address1)
					.fetch();
	}

	public List<Address> findAllByGender(String gender) {
		
		/*
			
			where() 절 
			- 동등 비교
			 	- address1.gender.eq("m")
			 	- address1.gender.ne("m")
			- null 비교
				- address1.address.isNull()
				- address1.address.isNotNull()
			- 열거형 비교
				- address1.age.in(3, 5, 7)
				- address1.age.notIn(3, 5, 7)
			- 범위 비교
				- address1.age.gt(3)
				- address1.age.lt(3)
				- address1.age.goe(3)
				- address1.age.loe(3)
				- address1.age.between(3, 5)
			- 패턴 비교 
				- address1.address.startsWith("서울특별시 강남구")
				- address1.address.endsWith("층")
				- address1.address.contains("빌딩")
				- address1.address.like("%아파트%")
			- and/or
				- 남자 and 5세 이상
				- where gender = 'f' and (address like '%강남구%' or address like '%강동구%')
			
		*/
		
		return jpaQueryFactory
					.selectFrom(address1)
//					.where(address1.gender.eq("m")
//							.and(address1.age.goe(5))
//							.and(address1.address.contains("강남구")))
					.where(address1.gender.eq("f")
//							.and(address1.address.contains("강남구"))
//									.or(address1.address.contains("강동구")))
					.and(address1.address.contains("강남구")
							.or(address1.address.contains("강동구"))))
					.fetch();
	}

	public List<Address> findAllOrderBy() {
		
		/*
		 	
		 	정렬
		 	- orderBy(QType.Column.정렬기준())
		 	
		 	정렬기준
		 	- asc()
		 	- desc()
		 	- nullsLast()
		 	- nullsFirst()
		 
		 */
		
		return jpaQueryFactory
				.selectFrom(address1)
				//.orderBy(address1.age.asc())
				//.orderBy(address1.age.desc(), address1.name.asc())
				.orderBy(address1.address.desc().nullsLast())
				.fetch();
	}

	public List<Address> findAllPagenation(int offset, int limit) {
		
		//페이징
		return jpaQueryFactory
				.selectFrom(address1)
				.offset(offset)
				.limit(limit)
				.fetch();
	}

	public int count() {
		
		return (int)jpaQueryFactory
					.selectFrom(address1)
					.fetchCount(); //return type > long > 형변환
	}

	public Tuple findAllAggregation() {
		
		return jpaQueryFactory
				//count(*), count(age), count(address)
				.select(address1.address.count()
						, address1.age.avg()
						, address1.age.sum()
						, address1.age.max()
						, address1.age.min())
				.from(address1)
				.fetchOne();
	}
	

	public List<Tuple> findAllGroupByGender() {
		
		return jpaQueryFactory
				.select(address1.gender, address1.count(), address1.age.avg())
				.from(address1)
				.groupBy(address1.gender)
				.having(address1.age.avg().gt(4.5))
				.fetch();
	}

	public List<Info> findAllJoinInfo() {

		//tblAddress + tblInfo
		/*
		 	조인
		 	- join(): inner join
		 	- innerJoin(): inner join
		 	- leftJoin(): left outer join 
		 	- rightJoin(): right outer join 
		 */
		
		
		return jpaQueryFactory
				.selectFrom(info) //자식 테이블
				.join(info.address, address1) //join(연관 관계, 부모 테이블) 
				//.rightJoin(info.address, address1)
				.fetch();
				
	}

	public List<Address> findAllJoinAddress() {
		
		return jpaQueryFactory
					.selectFrom(address1)
					//.join(address1.memo, memo1)
					.leftJoin(address1.memo, memo1)
					.fetch()
				;
	}
	
}


