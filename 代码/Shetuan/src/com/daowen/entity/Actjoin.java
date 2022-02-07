//-------------------------请加下面QQ请求远程辅助运行代码  ID:3578--------------------------
//-----------------更多毕设, 联系QQ1305637939-------------------
//-------------------------请加作者QQ协助运行: 1305637939-----------------------
//-------------------------请加作者QQ协助运行: 1305637939-----------------------
//-------------------------请加下面QQ请求远程辅助运行代码----------------------------
package com.daowen.entity;
import java.util.Date;
import javax.persistence.*;
@Entity
public class Actjoin
{
@Id
@GeneratedValue(strategy =GenerationType.AUTO)
   private int id ;
   public int getId() 
   {
      return id;
  }
   public void setId(int id) 
   {
      this.id= id;
  }
   private int actid ;
   public int getActid() 
   {
      return actid;
  }
   public void setActid(int actid) 
   {
      this.actid= actid;
  }
   private String actname ;
   public String getActname() 
   {
      return actname;
  }
   public void setActname(String actname) 
   {
      this.actname= actname;
  }
   private String hyaccountname ;
   public String getHyaccountname() 
   {
      return hyaccountname;
  }
   public void setHyaccountname(String hyaccountname) 
   {
      this.hyaccountname= hyaccountname;
  }
}
//-------------------------请加下面QQ请求远程辅助运行代码  ID:3578--------------------------
//-----------------更多毕设, 联系QQ1305637939-------------------
//-------------------------请加作者QQ协助运行: 1305637939-----------------------
//-------------------------请加作者QQ协助运行: 1305637939-----------------------
//-------------------------请加下面QQ请求远程辅助运行代码----------------------------
