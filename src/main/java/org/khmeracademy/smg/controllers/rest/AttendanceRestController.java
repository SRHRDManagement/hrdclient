package org.khmeracademy.smg.controllers.rest;

import java.util.Map;

import org.khmeracademy.smg.model.input.AddAttendance;
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
@RequestMapping("/rest/attendance")
public class AttendanceRestController {
	
	@Autowired
	private HttpHeaders header;
	
	@Autowired
	private RestTemplate rest;
	
	@Autowired
	private String WS_URL;
	
	//insert new attendance
	@RequestMapping(method = RequestMethod.POST)
	public ResponseEntity<Map<String , Object>> addAttendance(@RequestBody AddAttendance att){
		HttpEntity<Object> request = new HttpEntity<Object>(att, header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/attendance", HttpMethod.POST , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	//update attendance
	@RequestMapping(method = RequestMethod.PUT)
	public ResponseEntity<Map<String , Object>> updateAttendance(@RequestBody AddAttendance att){
		HttpEntity<Object> request = new HttpEntity<Object>(att, header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/attendance", HttpMethod.PUT , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	//check attendance exist
	@RequestMapping(method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> checkAttendanceExist(){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/attendance", HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
}
