package com.test.jpa.entity;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QInfo is a Querydsl query type for Info
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QInfo extends EntityPathBase<Info> {

    private static final long serialVersionUID = -1210086569L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QInfo info = new QInfo("info");

    public final QAddress address;

    public final StringPath country = createString("country");

    public final StringPath school = createString("school");

    public final NumberPath<Long> seq = createNumber("seq", Long.class);

    public QInfo(String variable) {
        this(Info.class, forVariable(variable), INITS);
    }

    public QInfo(Path<? extends Info> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QInfo(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QInfo(PathMetadata metadata, PathInits inits) {
        this(Info.class, metadata, inits);
    }

    public QInfo(Class<? extends Info> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.address = inits.isInitialized("address") ? new QAddress(forProperty("address")) : null;
    }

}

