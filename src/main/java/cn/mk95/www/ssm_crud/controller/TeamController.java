package cn.mk95.www.ssm_crud.controller;

import cn.mk95.www.ssm_crud.bean.Msg;
import cn.mk95.www.ssm_crud.bean.Team;
import cn.mk95.www.ssm_crud.service.TeamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by yyh on 2017/7/17.
 */
@Controller
public class TeamController {

    @Autowired
    TeamService teamService;

    @RequestMapping("/jsonTeamList")
    @ResponseBody
    public Msg getTeams(){
        List<Team> teams=teamService.findAll();
        return Msg.success().add("teams",teams);
    }
}
