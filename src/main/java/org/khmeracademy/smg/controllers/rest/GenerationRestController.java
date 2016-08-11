package org.khmeracademy.smg.controllers.rest;

import java.util.Map;

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
@RequestMapping("/rest/generation")
public class GenerationRestController {
	@Autowired
	private HttpHeaders header;
	
	@Autowired
	private RestTemplate rest;
	
	@Autowired
	private String WS_URL;
	
	//get generation in rest template
	@RequestMapping(method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> getGeneration(){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/generation", HttpMethod.GET , request, Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	//get request from angular to add data to API
	@RequestMapping(method = RequestMethod.POST)
	public ResponseEntity<Map<String , Object>> addGeneration(@RequestBody AddGeneration addGeneration){
		HttpEntity<Object> request = new HttpEntity<Object>(addGeneration, header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/generation", HttpMethod.POST , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	//get request from angular to update data to API
	@RequestMapping(method = RequestMethod.PUT)
	public ResponseEntity<Map<String , Object>> updateGeneration(@RequestBody AddGeneration addGeneration){
		HttpEntity<Object> request = new HttpEntity<Object>(addGeneration, header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/generation", HttpMethod.PUT , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	//get request from angular to find only one generation data from API
	@RequestMapping(value="/{gen_id}", method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> getGenerationById(@PathVariable int gen_id){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/generation/"+gen_id, HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
		
	//get request from angular to disable generation to API
	@RequestMapping(value="/{gen_id}", method = RequestMethod.PUT)
	public ResponseEntity<Map<String , Object>> disabledGeneration(@RequestBody AddGeneration addGeneration, @PathVariable int gen_id){
		HttpEntity<Object> request = new HttpEntity<Object>(addGeneration, header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/generation/"+gen_id, HttpMethod.PUT , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	//find generation not finish from angular
	@RequestMapping(value="generation-not-finish", method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> getGenerationNotFinish(){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/generation/generation-not-finish", HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
}
