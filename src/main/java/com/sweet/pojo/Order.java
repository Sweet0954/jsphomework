package com.sweet.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Order {
    private String orderId;
    private Date createTime;
    private BigDecimal price;
    // 0 未发货,1 已发货,2 表示已签收
    private Integer status = 0;
    private Integer userId;
}
