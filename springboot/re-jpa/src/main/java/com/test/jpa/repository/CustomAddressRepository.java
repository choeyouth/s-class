package com.test.jpa.repository;

import static com.test.jpa.entity.QAddress.address1;
import static com.test.jpa.entity.QInfo.info;
import static com.test.jpa.entity.QMemo.memo1;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.querydsl.core.BooleanBuilder;
import com.querydsl.core.Tuple;
import com.querydsl.core.types.Projections;
import com.querydsl.jpa.JPAExpressions;
import com.querydsl.jpa.impl.JPAQueryFactory;
import com.test.jpa.dto.AddressDTO;
import com.test.jpa.entity.Address;
import com.test.jpa.entity.Info;
import com.test.jpa.entity.QAddress;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class CustomAddressRepository {

	private final JPAQueryFactory jpaQueryFactory;

	/*
		
		Fetch
		- selectFrom(엔티티)
			- select * from 엔티티
			- 해당 엔티티에서 모든 컬럼을 가져온다.
			- 결과셋 > 다시 원하는 추출(fetch) 
		
		- fetch(): 리스트 조회. 결과셋을 다 반환. 결과가 없으면 빈 List 반환
		- fetchOne(): 단일 조회. 결과가 없으면 null 반환. 결과가 2개 이상이면 예외 발생
		- fetchFirst(): 단일 조회. 결과가 N개라도 첫 번째 레코드 반환
		- fetchResultSet(): 페이징 정보 포함된 결과셋 반환
		- fetchCount(): 카운트 반환 

		selectFrom(엔티티): select * from
		select(컬럼).from(엔티티): select 컬럼 지정
			- select(Qtype.column1, Qtype.column2..)
		
	 */
	
	public List<Address> findAll() {
		return jpaQueryFactory.selectFrom(address1).fetch();
	}

	public Address findAddressByName(String name) {
		return jpaQueryFactory	
				.selectFrom(address1)
				.where(address1.name.eq(name)) // == where name = '강아지' 
				.fetchOne();
	}

	public List<String> findAllName() {
		//select name from Address
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
				.select(Projections.constructor(AddressDTO.class, address1.name, address1.address))
				.from(address1)
				.fetch();
	}

	public List<Address> findAllByGender(String gender) {
		return jpaQueryFactory
				.selectFrom(address1)
				.where(address1.gender.eq(gender)
					.and(address1.age.goe(5))	
					.and(address1.address.contains("강남")))
				.fetch();
	}

	public List<Address> findAllOrderBy() {
		return jpaQueryFactory
				.selectFrom(address1)
				.orderBy(address1.age.desc().nullsFirst())
				.fetch();
	}

	public List<Address> findAllPagenation(int offset, int limit) {
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
		
		/*
			
			tblAddress + tblInfo
			
			조인
			- join(): inner join
			- innerJoin(): inner join
			- leftJoin(): left outer join
			- rightJoin(): right outer join 
			
		 */
		
		return jpaQueryFactory
				.selectFrom(info) //자식 테이블 
				.join(info.address, address1) //join(연관 관계, 부모 테이블)
				.fetch();
	}

	public List<Address> findAllJoinAddress() {
		return jpaQueryFactory
				.selectFrom(address1)
				.join(address1.memo, memo1).fetchJoin() //fetchJoin()을 사용하여 memo를 미리 로딩 
				//.leftJoin(address1.memo, memo1).fetchJoin() //fetchJoin()을 사용하여 memo를 미리 로딩 
				.orderBy(address1.seq.asc())
				.fetch();
	}

	public List<Address> findAllByMaxAge() {
		
		QAddress subAddress = QAddress.address1;
		
		//select * from tblAddress where age = (select max(age) from tblAddress);
		return jpaQueryFactory
				.selectFrom(address1)
				.where(address1.age.eq(JPAExpressions
										.select(subAddress.age.max())
										.from(subAddress)))
				.fetch();
	}

	public List<Tuple> findAllByAvgAge() {
		
		QAddress subAddress = QAddress.address1;
		
		return jpaQueryFactory
				.select(
					address1.name,
					address1.age,
					JPAExpressions.select(subAddress.age.avg()).from(subAddress)
				)
				.from(address1)
				.fetch();
	}

	
	
	public List<Address> findAllMultiParameter(String gender, Integer age) {
		
//		//방법 1.
//		//(동적) 다중 조건 생성기 
//		BooleanBuilder builder = new BooleanBuilder();
//		
//		if(gender != null) {
//			//and gender = 'm'
//			builder.and(address1.gender.eq(gender));
//		}
//		
//		if(age != null) {
//			//and aeg = 3
//			builder.and(address1.age.eq(age));
//		}
//		
//		return jpaQueryFactory
//				.selectFrom(address1)
//				.where(builder)
//				.fetch();
		
		
		//방법2.
//		return jpaQueryFactory
//				.selectFrom(address1)
//				.where(address1.gender.eq(gender), address1.age.eq(age))
//				.fetch();
		//-> 매개변수 age, gender를 모두 보내야만 성공
		
		
		//해결
		return jpaQueryFactory
		.selectFrom(address1)
		.where(gender != null ? address1.gender.eq(gender) : null,
			   age != null ? address1.age.eq(age) : null)
		.fetch();
		
	}
	
}
