//-------------------------请加下面QQ请求远程辅助运行代码  ID:3578--------------------------
//-----------------更多毕设, 联系QQ1305637939-------------------
//-------------------------请加作者QQ协助运行: 1305637939-----------------------
//-------------------------请加作者QQ协助运行: 1305637939-----------------------
//-------------------------请加下面QQ请求远程辅助运行代码----------------------------
package com.daowen.service;
import com.daowen.entity.Activity;
import com.daowen.mapper.ActivityMapper;
import com.daowen.ssm.simplecrud.SimpleBizservice;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
@Service
public class ActivityService extends SimpleBizservice<ActivityMapper>{

   public long getDiffMintues(int actId){
		
		Activity activity=this.load(actId);
		
		Date now=new Date();
		//开始时间
		long startDiff = now.getTime() - activity.getHdbegindate().getTime();
		
		long endDiff=activity.getHdenddate().getTime()-now.getTime();
		
		if(startDiff>0&&endDiff>0)
		
		  return endDiff/(1000*60);
		
		return 0;
		
	}

	public List<HashMap<String,Object>> getJoined(Integer id){

   	   return  getMapper().getJoined(id);
	}
	
	
}
//-------------------------请加下面QQ请求远程辅助运行代码  ID:3578--------------------------
//-----------------更多毕设, 联系QQ1305637939-------------------
//-------------------------请加作者QQ协助运行: 1305637939-----------------------
//-------------------------请加作者QQ协助运行: 1305637939-----------------------
//-------------------------请加下面QQ请求远程辅助运行代码----------------------------
