package com.yush.ar.entity;

public class Userlevel {
   
	private Integer userlevelid;
	
	private String  userlevelname;
	
	private Integer userlevelpoints;
	
	private String bonus;
	
	private String discount;
	/**
	 * 当前等级
	 */
	private String currentLevel;
	/**
	 * 当前等级的积分
	 */
	private Integer currentLevelpoints;
	/**
	 * 下一等级
	 */
	private String nextLevel;
	/**
	 * 下一等级的积分
	 */
	private Integer  nextLevelpoints;
	/**
	 * 升级所需积分
	 */
	private Integer needPoint=0;
	
	public Integer getUserlevelid() {
		return userlevelid;
	}

	public void setUserlevelid(Integer userlevelid) {
		this.userlevelid = userlevelid;
	}

	public String getUserlevelname() {
		return userlevelname;
	}

	public void setUserlevelname(String userlevelname) {
		this.userlevelname = userlevelname;
	}

	public Integer getUserlevelpoints() {
		return userlevelpoints;
	}

	public void setUserlevelpoints(Integer userlevelpoints) {
		this.userlevelpoints = userlevelpoints;
	}

	public String getBonus() {
		return bonus;
	}

	public void setBonus(String bonus) {
		this.bonus = bonus;
	}

	public String getDiscount() {
		return discount;
	}

	public void setDiscount(String discount) {
		this.discount = discount;
	}

	public String getCurrentLevel() {
		return currentLevel;
	}

	public void setCurrentLevel(String currentLevel) {
		this.currentLevel = currentLevel;
	}

	public String getNextLevel() {
		return nextLevel;
	}

	public void setNextLevel(String nextLevel) {
		this.nextLevel = nextLevel;
	}

	public Integer getNeedPoint() {
		return needPoint;
	}

	public void setNeedPoint(Integer needPoint) {
		this.needPoint = needPoint;
	}

	public Integer getCurrentLevelpoints() {
		return currentLevelpoints;
	}

	public void setCurrentLevelpoints(Integer currentLevelpoints) {
		this.currentLevelpoints = currentLevelpoints;
	}

	public Integer getNextLevelpoints() {
		return nextLevelpoints;
	}

	public void setNextLevelpoints(Integer nextLevelpoints) {
		this.nextLevelpoints = nextLevelpoints;
	}
	
}
