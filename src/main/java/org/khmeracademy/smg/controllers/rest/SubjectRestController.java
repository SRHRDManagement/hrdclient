package org.khmeracademy.smg.controllers.rest;

import java.util.Map;

import org.khmeracademy.smg.model.input.AddSubject;
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
@RequestMapping("/rest/subject")
public class SubjectRestController {
	
	@Autowired
	private HttpHeaders header;
	
	@Autowired
	private RestTemplate rest;
	
	@Autowired
	private String WS_URL;
	
	//get all subjects
	@RequestMapping(method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> getSubject(){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/subject", HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	//get a subject by id
	@RequestMapping(value="/{sub_id}", method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> getSubjectById(@PathVariable int sub_id){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/subject/"+sub_id, HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	//insert subject
	@RequestMapping(method = RequestMethod.POST)
	public ResponseEntity<Map<String , Object>> insertSubject(@RequestBody AddSubject addSubject){
		HttpEntity<Object> request = new HttpEntity<Object>(addSubject, header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/subject", HttpMethod.POST , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	//update subject
	@RequestMapping(method = RequestMethod.PUT)
	public ResponseEntity<Map<String , Object>> updateSubject(@RequestBody AddSubject addSubject){
		HttpEntity<Object> request = new HttpEntity<Object>(addSubject, header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/subject", HttpMethod.PUT , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	//delete or disable subject
	@RequestMapping(value="delete", method = RequestMethod.PUT)
	public ResponseEntity<Map<String , Object>> deleteDisableSubject(@RequestBody AddSubject addSubject){
		HttpEntity<Object> request = new HttpEntity<Object>(addSubject, header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/subject/delete", HttpMethod.PUT , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
}
