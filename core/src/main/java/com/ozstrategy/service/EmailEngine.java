package com.ozstrategy.service;

import com.ozstrategy.model.system.EmailConfig;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;

import javax.mail.internet.MimeMessage;
import java.util.Properties;

/**
 * Created by lihao1 on 7/25/15.
 */
public class EmailEngine {
    private transient Log log= LogFactory.getLog(EmailEngine.class);
    @Autowired
    private JavaMailSenderImpl mailSender;
    public void sendMimeEmail(final EmailConfig config,final String subject,final String content,final String to){
        new Thread(new Runnable() {
            @Override
            public void run() {
                try{
                    mailSender.setHost(config.getSmtp());
                    mailSender.setUsername(config.getEmail());
                    mailSender.setPassword(config.getPassword());
                    mailSender.setPort(config.getPort());
                    mailSender.setDefaultEncoding("UTF-8");
                    Properties prop = new Properties();
                    prop.put("mail.smtp.auth", "true");
                    prop.put("mail.smtp.timeout", "25000");
                    mailSender.setJavaMailProperties(prop);
                    MimeMessage msg = mailSender.createMimeMessage();
                    MimeMessageHelper helper = new MimeMessageHelper(msg, true);
                    helper.setTo(to);
                    helper.setSubject(subject);
                    helper.setFrom(config.getEmail());
                    helper.setText(content,true);
                    mailSender.send(msg);

                }catch (Exception e){
                    log.error("fail send email to "+to,e);
                }

            }
        }).start();
    }
    public void sendSimpleEmail(final EmailConfig config,final String subject,final String content,final String to){
        new Thread(new Runnable() {
            @Override
            public void run() {
                try{
                    mailSender.setHost(config.getSmtp());
                    mailSender.setUsername(config.getEmail());
                    mailSender.setPassword(config.getPassword());
                    mailSender.setPort(config.getPort());
                    mailSender.setDefaultEncoding("UTF-8");
                    Properties prop = new Properties();
                    prop.put("mail.smtp.auth", "true");
                    prop.put("mail.smtp.timeout", "25000");
                    mailSender.setJavaMailProperties(prop);
                    SimpleMailMessage msg = new SimpleMailMessage(); ;
                    msg.setTo(to);
                    msg.setSubject(subject);
                    msg.setFrom(config.getEmail());
                    msg.setText(content);
                    mailSender.send(msg);
                }catch (Exception e){
                    log.error("fail send email to "+to,e);
                }

            }
        }).start();
    }


}
