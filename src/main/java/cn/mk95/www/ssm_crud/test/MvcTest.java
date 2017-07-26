package cn.mk95.www.ssm_crud.test;

import cn.mk95.www.ssm_crud.bean.User;
import com.github.pagehelper.PageInfo;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

/**
 * Created by yyh on 2017/7/14.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration  //注入spring ioc容器需要用到
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/springContext.xml", "file:src/main/webapp/WEB-INF/springDispatcherServlet.xml"})
public class MvcTest {//ContextConfiguration注解后面的分别是spring配置文件和spring MVC配置文件

    @Autowired
    WebApplicationContext context;

    MockMvc mockMvc;//用于模拟请求

    @Before
    public void initMockMvc() {
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }

    @Test
    public void findAlluserTest() throws Exception {
        MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/list").param("pn", "1")).andReturn();
        MockHttpServletRequest request = result.getRequest();
        PageInfo pageInfo = (PageInfo) request.getAttribute("pageinfo");
        List<User> users = pageInfo.getList();
        System.out.println("用户信息：");
        for (User user : users) {
            System.out.println(user.toString());
        }
        System.out.println("总记录数："+pageInfo.getTotal());
        System.out.println("当前页："+pageInfo.getPageNum());
        System.out.println("连续显示的页数：");
        for (int i=0;i<pageInfo.getNavigatepageNums().length;i++){
            System.out.print(pageInfo.getNavigatepageNums()[i]+" ");
        }
    }
}
