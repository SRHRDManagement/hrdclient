package org.khmeracademy.smg.controllers.rest;

import java.util.Map;

import org.khmeracademy.smg.model.input.AddEnrollStaff;
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
@RequestMapping("/rest/enroll-instructor")
public class EnrollStaffRestController {
	
	@Autowired
	private HttpHeaders header;
	
	@Autowired
	private RestTemplate rest;
	
	@Autowired
	private String WS_URL;
	
	//get request from angular to enroll new instructor
	@RequestMapping(method = RequestMethod.POST)
	public ResponseEntity<Map<String , Object>> addInstructor(@RequestBody AddEnrollStaff addEnrollStaff){
		HttpEntity<Object> request = new HttpEntity<Object>(addEnrollStaff, header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/enroll-instructor", HttpMethod.POST , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	//get request from angular to get information instructor
	@RequestMapping(method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> getInstructor(){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/enroll-instructor", HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	//get request from angular to get information instructor by generation
	@RequestMapping(value="/{gen_id}", method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> getInstructorByGeneration(@PathVariable int gen_id){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/enroll-instructor/"+gen_id, HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
		
	//get request from angular to delete instructor
	@RequestMapping(value="/{sp_id}", method = RequestMethod.DELETE)
	public ResponseEntity<Map<String , Object>> removeInstructor(@PathVariable int sp_id){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/enroll-instructor/"+sp_id, HttpMethod.DELETE , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}

}
