package org.seckill.dao;

import org.seckill.entity.SuccessKilled;

/**
 * @author allenzsy
 * @date 2019/11/10
 * @time 21:48
 */
public interface SuccessKilledDao {

    /**
     * 插入购买明细，可过滤重复（建表时采用了一个联合唯一索引）
     * @param seckillId
     * @param userPhone
     * @return 插入的行数
     */
    int insertSuccessKilled(long seckillId, long userPhone);

    /**
     * 根据id查询SuccessKilled并携带秒杀产品对象实体
     * @param seckillId
     * @return
     */
    SuccessKilled queryByIdWithSeckill(long seckillId);

}
