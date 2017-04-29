package global.sesoc.banggood.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.banggood.util.SendInfo;
import global.sesoc.banggood.util.SendMail;
import global.sesoc.banggood.vo.Customer;

@Controller
public class MailController
{
	
	
	/**
	    * 인증번호 보내기 
	    * @return
	    */
	   @ResponseBody
	   @RequestMapping(value="emailcheck", method=RequestMethod.POST)
	   public void emailcheck(String user, HttpSession session)
	   {
		  System.out.println("입력이메일 : "+user);
		  
	      SendMail mail = new SendMail("", null, null);
	      
	      int code = mail.test(user);
	      //logger.debug("{}",checkCode);
	      
	  //  session.setAttribute("code", code);
	      setNum(code);
	      
	      System.out.println("메일 전송완료.");
	   }
	   
	   @ResponseBody
	   @RequestMapping(value = "sendid", method = RequestMethod.POST)
	   public void sendid(String user, String id)	// 순서대로 email, id 임
	   {
		   SendInfo info = new SendInfo("", null, null);
			
		   info.sendingid(user, id);
			
		   System.out.println("이메일로 아이디 전송 완료");
	   }
	   
	   @ResponseBody
	   @RequestMapping(value = "sendpw", method = RequestMethod.POST)
	   public int sendpw(Customer customer)	// 순서대로 email, id 임
	   {   
		   System.out.println(customer.toString());
		   
		   SendInfo info = new SendInfo("", null, null);
		   
		   String user = customer.getEmail();
		   String id = customer.getCustid();
		   
		   int pw = info.sendingpw(user, id);
		   
		   System.out.println("이메일로 임시암호 전송 완료");
		   
		   return pw;
	   }
	   
	   @ResponseBody
	   @RequestMapping(value = "checknum", method = RequestMethod.POST)
	   public int checknum()
	   {
	      return MailController.getNum();
	   }
	   
	static int num;

	static public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}
}
