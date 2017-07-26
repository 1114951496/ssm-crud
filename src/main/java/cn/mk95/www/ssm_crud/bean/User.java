package cn.mk95.www.ssm_crud.bean;

public class User {
    private Integer userId;

    private String userName;

    private String email;

    private String sex;

    private Integer teamId;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    private Team team;

    public Team getTeam() {
        return team;
    }

    public void setTeam(Team team) {
        this.team = team;
    }

    public User() {
    }

    public User(Integer userId, String userName, String email, String sex, Integer teamId) {
        this.userId = userId;
        this.userName = userName;
        this.email = email;
        this.sex = sex;
        this.teamId = teamId;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public Integer getTeamId() {
        return teamId;
    }

    public void setTeamId(Integer teamId) {
        this.teamId = teamId;
    }

    @Override
    public String toString() {
        return "User{" +
                "userId=" + userId +
                ", userName='" + userName + '\'' +
                ", email='" + email + '\'' +
                ", sex='" + sex + '\'' +
                ", teamId=" + teamId +
                ", team=" + team.toString() +
                '}';
    }
}