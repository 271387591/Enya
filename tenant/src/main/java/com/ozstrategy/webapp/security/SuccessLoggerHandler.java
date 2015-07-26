package com.ozstrategy.webapp.security;

import com.ozstrategy.model.user.Role;
import com.ozstrategy.model.user.User;
import com.ozstrategy.webapp.command.JsonReaderSingleResponse;
import com.ozstrategy.webapp.command.user.UserCommand;
import org.apache.commons.lang3.StringUtils;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: liuqian
 * Date: 13-7-3
 * Time: PM3:07
 * To change this template use File | Settings | File Templates.
 */
public class SuccessLoggerHandler extends WebAuthenticationLoggerHandler implements AuthenticationSuccessHandler {

  public void onAuthenticationSuccess(HttpServletRequest request,
                                      HttpServletResponse response, Authentication authentication)
    throws IOException, ServletException {
      request.setCharacterEncoding("UTF-8");
      response.setCharacterEncoding("UTF-8");
      response.setContentType("text/html;charset=UTF-8");
      String platform=request.getParameter("platform");
      User user = (User)authentication.getPrincipal();
      user  = userManager.getUserByUsername(user.getUsername());
      if (user == null) {
          return;
      }
      UserCommand userCommand=new UserCommand(user);

      request.getSession().setAttribute("userinfo", userCommand);
      String result=objectMapper.writeValueAsString(new JsonReaderSingleResponse<UserCommand>(userCommand));
      response.getWriter().print(result);
  }
}
