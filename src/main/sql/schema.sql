

CREATE TABLE if not exists `t_seckill`(
    `seckill_id` bigint NOT NULL AUTO_INCREMENT COMMENT '商品库存id',
    `name` varchar(120) NOT NULL COMMENT '商品名称',
    `number` int NOT  NULL COMMENT '库存数量',
    `start_time` timestamp not NULL COMMENT '秒杀开启时间',
    `end_time` timestamp not NULL COMMENT '秒杀结束时间',
    `create_time` timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    PRIMARY KEY PK_SECKILL_ID(seckill_id),
    key idx_start_time(start_time),
    key idx_end_time(end_time),
    key idx_create_time(create_time)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET = utf8 COMMENT = '秒杀库存表';




insert into
    t_seckill(name, number, start_time, end_time)
values
    ('2000元秒杀iphoneX', 100, '2019-08-01 00:00:00', '2019-08-02 00:00:00'),
    ('1500元秒杀ipad', 100, '2019-08-01 00:00:00', '2019-08-02 00:00:00'),
    ('1800元秒杀mate30', 100, '2019-08-01 00:00:00', '2019-08-02 00:00:00'),
    ('1800元秒杀小米ProCC', 100, '2019-08-01 00:00:00', '2019-08-02 00:00:00');


CREATE TABLE if not exists `t_success_killed`(
    `seckill_id` bigint NOT NULL COMMENT '秒杀商品id',
    `user_phone` bigint NOT NULL COMMENT '用户手机号',
    `state` tinyint NOT NULL DEFAULT -1 COMMENT '状态表示：-1:无效 0:成功 1:已付款 2:已发货',
    `create_time` timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    PRIMARY KEY (seckill_id, user_phone), /* 联合主键，一个用户不能对同一个商品做重复的秒杀 */
    key idx_create_time(create_time)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COMMENT = '秒杀库存表';