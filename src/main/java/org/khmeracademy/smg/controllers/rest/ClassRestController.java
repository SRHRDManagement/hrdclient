package org.khmeracademy.smg.controllers.rest;

import java.util.Map;

import org.khmeracademy.smg.model.input.AddClass;
import org.khmeracademy.smg.model.input.AddCourse;
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
@RequestMapping("/rest/class")
public class ClassRestController {
	
	@Autowired
	private HttpHeaders header;
	
	@Autowired
	private RestTemplate rest;
	
	@Autowired
	private String WS_URL;
	
	//get all class by course id *
	@RequestMapping(value="/{cou_id}", method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> getClassByCourseId(@PathVariable int cou_id){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/class/"+cou_id, HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	//insert new class with course id *
	@RequestMapping(method = RequestMethod.POST)
	public ResponseEntity<Map<String , Object>> addClassRoom(@RequestBody AddClass addClass){
		HttpEntity<Object> request = new HttpEntity<Object>(addClass, header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/class", HttpMethod.POST , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
		
	//get a class by id *
	@RequestMapping(value="/get-class-by-id/{cla_id}", method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> getClassById(@PathVariable int cla_id){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/class/get-class-by-id/"+cla_id, HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	//update class *
	@RequestMapping(method = RequestMethod.PUT)
	public ResponseEntity<Map<String , Object>> updateClass(@RequestBody AddClass clas){
		HttpEntity<Object> request = new HttpEntity<Object>(clas, header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/class", HttpMethod.PUT , request, Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	//get request from angular to disable class to API
	@RequestMapping(value="/{cla_id}", method = RequestMethod.PUT)
	public ResponseEntity<Map<String , Object>> disabledClass(@RequestBody AddClass addClass, @PathVariable int cla_id){
		HttpEntity<Object> request = new HttpEntity<Object>(addClass, header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/class/"+cla_id, HttpMethod.PUT , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
}
