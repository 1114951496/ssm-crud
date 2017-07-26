package cn.mk95.www.ssm_crud.controller;

import cn.mk95.www.ssm_crud.bean.Msg;
import cn.mk95.www.ssm_crud.bean.User;
import cn.mk95.www.ssm_crud.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by yyh on 2017/7/14.
 */
@Controller
public class UserController {

    @Autowired
    UserService userService;

    //使用json,需要jackson包将对象转换成json
    @RequestMapping("/jsonUserList")
    @ResponseBody
    public Msg getUsers(@RequestParam(value = "pn",defaultValue = "1")int pn){
        PageHelper.startPage(pn,5);//在要分页查询的方法前指定页数和每页的数据数量
        List<User> users=userService.findAll();
        //使用pageoinfo包装查询后的结果，封装了详细的分页信息，包括数据，传入连续显示的页数
        PageInfo pageInfo=new PageInfo(users,5);
        return  Msg.success().add("pageinfo",pageInfo);
    }

    @ResponseBody
    @RequestMapping(value = "/user",method = RequestMethod.POST)
    public Msg saveUser(User user){
        userService.saveUser(user);
        return Msg.success();
    }

    @ResponseBody
    @RequestMapping(value = "/user/{id}",method = RequestMethod.GET)
    public Msg getUser(@PathVariable("id")Integer id){
        User user=userService.getUser(id);
        return Msg.success().add("user",user);
    }

    /**
     * uri中的userId与user对象的属性对应
     * 在页面直接发put请求时，需要添加spring的HttpPutFormContentFilter拦截器，因为tomcat对put的请求不进行数据封装
     * 发post请求在参数后接"&_method=put"就可以不用配置拦截器
     * @param user
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/user/{userId}",method = RequestMethod.PUT)
    public Msg updateUser(User user){
        userService.updateUser(user);
        return Msg.success();
    }

    @ResponseBody
    @RequestMapping(value = "/user/{ids}",method = RequestMethod.DELETE)
    public Msg deleteUser(@PathVariable("ids") String ids){
        if(ids.contains("-")){
            String[] str_ids=ids.split("-");
            List<Integer> int_ids=new ArrayList<Integer>();
            for(String id:str_ids){
                int_ids.add(Integer.parseInt(id));
            }
            userService.deleteBatch(int_ids);
        }else{
            Integer id=Integer.parseInt(ids);
            userService.deleteUser(id);
        }
        return Msg.success();
    }


    @RequestMapping("/list")
    public String getUsers(@RequestParam(value = "pn",defaultValue = "1")int pn, Model model){
        PageHelper.startPage(pn,5);//在要分页查询的方法前指定页数和每页的数据数量
        List<User> users=userService.findAll();
        //使用pageoinfo包装查询后的结果，封装了详细的分页信息，包括数据，传入连续显示的页数
        PageInfo pageInfo=new PageInfo(users,5);
        model.addAttribute("pageinfo",pageInfo);
        return "list";
    }
}
