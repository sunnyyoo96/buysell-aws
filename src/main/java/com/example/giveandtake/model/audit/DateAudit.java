package com.example.giveandtake.model.audit;

import lombok.Getter;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.EntityListeners;
import javax.persistence.MappedSuperclass;
import java.time.LocalDateTime;

@Getter
@MappedSuperclass // Entity들이 DateAudit를 상속 받으면 필드(createdDate, updatedDate)도 컬럼으로 인식하게 함
@EntityListeners(AuditingEntityListener.class) // Auditing 기능을 포함
public abstract class DateAudit {

    @CreatedDate //Entity가 생성되어 저장될 때 시간이 자동 저장
    private LocalDateTime createdDate;

    @LastModifiedDate //Entity의 값을 변경할 때 시간이 자동 저장
    private LocalDateTime updatedDate;
}
