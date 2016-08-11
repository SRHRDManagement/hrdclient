package org.khmeracademy.smg.controllers.rest;

import java.util.Map;

import org.khmeracademy.smg.model.input.AddCourse;
import org.khmeracademy.smg.model.input.AddGeneration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
@RequestMapping("/rest/course")
public class CourseRestController {
	
	@Autowired
	private HttpHeaders header;
	
	@Autowired
	private RestTemplate rest;
	
	@Autowired
	private String WS_URL;
	
	//get all courses by generation id
	@RequestMapping(value="/{gen_id}", method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> getCourseByGenerationId(@PathVariable int gen_id){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/course/"+gen_id, HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	//insert new course with generation id
	@RequestMapping(method = RequestMethod.POST)
	public ResponseEntity<Map<String , Object>> addCourse(@RequestBody AddCourse course){
		HttpEntity<Object> request = new HttpEntity<Object>(course, header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/course", HttpMethod.POST , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
		
	//get a course by id for update
	@RequestMapping(value="/get-course-by-id/{cou_id}", method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> getCourseById(@PathVariable int cou_id){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/course/get-course-by-id/"+cou_id, HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	//update course
	@RequestMapping(method = RequestMethod.PUT)
	public ResponseEntity<Map<String , Object>> updateCourse(@RequestBody AddCourse course){
		HttpEntity<Object> request = new HttpEntity<Object>(course, header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/course", HttpMethod.PUT , request, Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	//get request from angular to disable course to API
	@RequestMapping(value="/{cou_id}", method = RequestMethod.PUT)
	public ResponseEntity<Map<String , Object>> disabledGeneration(@RequestBody AddCourse addCourse, @PathVariable int cou_id){
		HttpEntity<Object> request = new HttpEntity<Object>(addCourse, header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/course/"+cou_id, HttpMethod.PUT , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	//find course not finish from angular
	@RequestMapping(value="course-not-finish", method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> getCourseNotFinish(){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/course/course-not-finish", HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
}
