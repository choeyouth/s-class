package com.test.jpa.entity;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;


/**
 * QMemo is a Querydsl query type for Memo
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QMemo extends EntityPathBase<Memo> {

    private static final long serialVersionUID = -1209975837L;

    public static final QMemo memo1 = new QMemo("memo1");

    public final NumberPath<Long> aseq = createNumber("aseq", Long.class);

    public final StringPath memo = createString("memo");

    public final DatePath<java.time.LocalDate> regdate = createDate("regdate", java.time.LocalDate.class);

    public final NumberPath<Long> seq = createNumber("seq", Long.class);

    public QMemo(String variable) {
        super(Memo.class, forVariable(variable));
    }

    public QMemo(Path<? extends Memo> path) {
        super(path.getType(), path.getMetadata());
    }

    public QMemo(PathMetadata metadata) {
        super(Memo.class, metadata);
    }

}

