package cn.mk95.www.ssm_crud.bean;

public class Team {
    private Integer teamId;

    private String teamName;

    public Team() {
    }

    public Team(Integer teamId, String teamName) {
        this.teamId = teamId;
        this.teamName = teamName;
    }

    public Integer getTeamId() {
        return teamId;
    }

    public void setTeamId(Integer teamId) {
        this.teamId = teamId;
    }

    public String getTeamName() {
        return teamName;
    }

    public void setTeamName(String teamName) {
        this.teamName = teamName == null ? null : teamName.trim();
    }

    @Override
    public String toString() {
        return "Team{" +
                "teamId=" + teamId +
                ", teamName='" + teamName + '\'' +
                '}';
    }
}