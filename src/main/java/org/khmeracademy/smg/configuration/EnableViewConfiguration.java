package org.khmeracademy.smg.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
public class EnableViewConfiguration extends WebMvcConfigurerAdapter {

	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/login").setViewName("page-login");
//		registry.addViewController("").setViewName("index");
//		registry.addViewController("/").setViewName("index");
		registry.addViewController("/home").setViewName("index");
		registry.addViewController("/home/index").setViewName("index");
		registry.addViewController("/generation").setViewName("generation");
		registry.addViewController("/generation/index").setViewName("generation");
		registry.addViewController("/course").setViewName("course");
		registry.addViewController("/course/index").setViewName("course");
		registry.addViewController("/class").setViewName("class");
		registry.addViewController("/class/index").setViewName("class");
		registry.addViewController("/subject").setViewName("subject");
		registry.addViewController("/subject/index").setViewName("subject");
		registry.addViewController("/student").setViewName("student_list");
		registry.addViewController("/student/register").setViewName("student_register");
		registry.addViewController("/student/index").setViewName("student_list");
		registry.addViewController("/student/enroll").setViewName("student_enroll");
		registry.addViewController("/staff").setViewName("staff_list");
		registry.addViewController("/staff/index").setViewName("staff_list");
		registry.addViewController("/user").setViewName("user");
		registry.addViewController("/user/index").setViewName("user");
		registry.addViewController("/attendance").setViewName("attendance");
		registry.addViewController("/attendance/index").setViewName("attendance");
		registry.addViewController("/staff/enroll").setViewName("staff_enroll");
		registry.addViewController("/location").setViewName("location");
		registry.addViewController("").setViewName("upload");
		
		// Errors
		registry.addViewController("/access-denied").setViewName("/error/403");

	}
	
	@Override
	public void addCorsMappings(CorsRegistry registry) {
		registry.addMapping("/**")
				.allowedMethods("GET","POST","DELETE","PUT","OPTIONS","PATCH")
				.allowedOrigins("*");
	}
	
}
