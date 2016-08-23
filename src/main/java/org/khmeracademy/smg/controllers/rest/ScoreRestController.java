package org.khmeracademy.smg.controllers.rest;

import java.util.Map;

import org.khmeracademy.smg.model.input.AddAttendance;
import org.khmeracademy.smg.model.input.AddClass;
import org.khmeracademy.smg.model.input.AddCourse;
import org.khmeracademy.smg.model.input.AddScore;
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
@RequestMapping("/rest/score")
public class ScoreRestController {
	
	@Autowired
	private HttpHeaders header;
	
	@Autowired
	private RestTemplate rest;
	
	@Autowired
	private String WS_URL;
	
	//get all months
	@RequestMapping(value="month", method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> getMonths(){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/score/month", HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	//get month by id
	@RequestMapping(value="month/{mon_id}", method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> getMonthById(@PathVariable int mon_id){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/score/month/"+mon_id, HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	//get score student by month, class, subject
	@RequestMapping(value="/{mon_id}/{cla_id}/{sub_id}", method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> getScore(@PathVariable int mon_id, @PathVariable int cla_id, @PathVariable int sub_id){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/score/"+mon_id+"/"+cla_id+"/"+sub_id, HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	//insert score
	@RequestMapping(method = RequestMethod.PUT)
	public ResponseEntity<Map<String , Object>> insertScore(@RequestBody AddScore score){
		HttpEntity<Object> request = new HttpEntity<Object>(score, header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/score", HttpMethod.PUT , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
}
