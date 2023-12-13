package utils;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
public class CookieManager {
//명시한 이름, 값,유지 기간 조건으로 새로운 쿠키 생성
	public static void makeCookie(HttpServletResponse response, 
			String cName, String cValue, int cTime) {
		Cookie cookie = new Cookie(cName,cValue);
		cookie.setPath("/");
		cookie.setMaxAge(cTime);
		response.addCookie(cookie);		
	}
	
	public static String readCookie(HttpServletRequest request, String cName) {
		String cookieValue="";
		Cookie[] cookies = request.getCookies(); //요청 헤더의 모든 쿠키
		if(cookies!=null){
			for(Cookie c:cookies){
				String cookieName = c.getName();
				if(cookieName.equals("cName")){
					cookieValue=c.getValue();
				}
				
			}
		}
		return cookieValue; 
	}
	
	public static void deleteCookie(HttpServletResponse response, String cName) {
		makeCookie(response,cName,"",0);		
	}
}
