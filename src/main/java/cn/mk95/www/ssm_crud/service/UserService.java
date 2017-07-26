package cn.mk95.www.ssm_crud.service;

import cn.mk95.www.ssm_crud.bean.User;
import cn.mk95.www.ssm_crud.bean.UserExample;
import cn.mk95.www.ssm_crud.dao.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by yyh on 2017/7/14.
 */
@Service
public class UserService {

    @Autowired
    UserMapper userMapper;


    public List<User> findAll() {
        return  userMapper.selectByExampleWithTeam(null);
    }

    public void saveUser(User user) {
        userMapper.insertSelective(user);
    }

    public User getUser(Integer id) {
        return userMapper.selectByPrimaryKey(id);
    }

    public void updateUser(User user) {
        userMapper.updateByPrimaryKeySelective(user);
    }

    public void deleteUser(Integer id) {
        userMapper.deleteByPrimaryKey(id);
    }

    public void deleteBatch(List<Integer> int_ids) {
        UserExample example=new UserExample();
        UserExample.Criteria criteria=example.createCriteria();
        criteria.andUserIdIn(int_ids);
        userMapper.deleteByExample(example);
    }
}
