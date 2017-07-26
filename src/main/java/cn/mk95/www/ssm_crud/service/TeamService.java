package cn.mk95.www.ssm_crud.service;

import cn.mk95.www.ssm_crud.bean.Team;
import cn.mk95.www.ssm_crud.dao.TeamMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by yyh on 2017/7/17.
 */
@Service
public class TeamService {

    @Autowired
    TeamMapper teamMapper;

    public List<Team> findAll(){
        return  teamMapper.selectByExample(null);
    }

}
