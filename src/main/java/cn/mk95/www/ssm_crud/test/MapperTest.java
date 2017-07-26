package cn.mk95.www.ssm_crud.test;


import cn.mk95.www.ssm_crud.bean.Team;
import cn.mk95.www.ssm_crud.bean.User;
import cn.mk95.www.ssm_crud.dao.TeamMapper;
import cn.mk95.www.ssm_crud.dao.UserMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * Created by yyh on 2017/7/12.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:D:\\GitHub\\ssm-crud\\src\\main\\webapp\\WEB-INF\\springContext.xml"})
public class MapperTest {

    @Autowired
    TeamMapper teamMapper;

    @Autowired
    SqlSession sqlSession;//通过这个得到mapper进行批量操作

    @Test
    public void addTeam() {
        teamMapper.insert(new Team(null, "火箭队"));
    }

    @Test
    public void addUser() {
        UserMapper mapper=sqlSession.getMapper(UserMapper.class);
        for (int i = 0; i < 50; i++) {
            if (i % 3 == 0)
                mapper.insertSelective(new User(null, "No." + i, "yyh@mk95.cn", "M", 1));
            else
                mapper.insertSelective(new User(null, "No." + i, "yyh@mk95.cn", "F", 2));
        }
    }

    @Test
    public void test() {
        ApplicationContext ac = new FileSystemXmlApplicationContext("D:\\GitHub\\ssm-crud\\src\\main\\webapp\\WEB-INF\\springContext.xml");
        ac.getBean(TeamMapper.class);
        System.out.println("....");
    }

}
