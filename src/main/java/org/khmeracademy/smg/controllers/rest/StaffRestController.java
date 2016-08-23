package org.khmeracademy.smg.controllers.rest;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import org.khmeracademy.smg.model.Image;
import org.khmeracademy.smg.model.input.AddGeneration;
import org.khmeracademy.smg.model.input.AddStaff;
import org.khmeracademy.smg.model.input.AddStudent;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import net.coobird.thumbnailator.Thumbnails;
import net.coobird.thumbnailator.name.Rename;

@RestController
@RequestMapping("/rest/staff")
public class StaffRestController {
	
	@Autowired
	private HttpHeaders header;
	
	@Autowired
	private RestTemplate rest;
	
	@Autowired
	private String WS_URL;
	
	@RequestMapping(value="avatar", method = RequestMethod.POST)
	public Image uploading(@RequestParam("image") CommonsMultipartFile file, HttpServletRequest request) {
		Image image = new Image();
		System.out.println("FILE=" + file.getOriginalFilename());
		
		String filename = "";
		Map<String, Object> map = new HashMap<String, Object>();
		if (!file.isEmpty()) {
//			String originalSavePath = "/opt/images/";
			String rpath=request.getRealPath("/");
			System.out.println("vansa"+rpath);
			rpath=rpath+"resources\\static\\images\\avatars\\";
			String originalSavePath = rpath;
//			String thumbnailSavePath = "/opt/images/thumbnails/";
			String thumbnailSavePath = rpath+"thumbnails\\";
			try {
				filename = file.getOriginalFilename();
				
				byte[] bytes = file.getBytes();
				
				UUID uuid = UUID.randomUUID();
				
				String randomUUIDFileName = uuid.toString();
				
				String extension = filename.substring(filename.lastIndexOf(".") + 1);
				
				System.out.println(originalSavePath);
				
				File originalPath = new File(originalSavePath);
				
				if (!originalPath.exists()) {
					System.out.println("NOT EXISTS");
					originalPath.mkdirs();
				}
				
				File thumbnailPath = new File(thumbnailSavePath);
				
				if (!thumbnailPath.exists()) {
					System.out.println("NOT EXISTS");
					thumbnailPath.mkdirs();
				}
				
				filename = randomUUIDFileName + "." + extension;
				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(new File(originalSavePath + filename)));
				stream.write(bytes);
				stream.close();

				try {
					//TODO: USING THUMBNAILS TO RESIZE THE IMAGE
					Thumbnails.of(originalSavePath + filename)
						.forceSize(240, 320)
						.toFiles(thumbnailPath, Rename.NO_CHANGE);
				} catch (Exception ex) {
					stream = new BufferedOutputStream(new FileOutputStream(new File(thumbnailSavePath +  filename)));
					stream.write(bytes);
					stream.close();
				}
				image.setOriginalImage(filename);
				image.setThumbnailImage("http://localhost:8080/resources/static/images/avatars/thumbnails/" + filename);
				System.out.println("You successfully uploaded " + originalSavePath + filename + "!");
				return image;
			} catch (Exception e) {
				System.out.println("You failed to upload " + filename + " => " + e.getMessage());
				map.put("IMAGE_URL", originalSavePath + File.separator + filename);
				return image;
			}
		} else {
			System.out.println("You failed to upload " + filename + " because the file was empty.");
			return image;
		}
	}
	
	//get request from angular to add student to API
	@RequestMapping(method = RequestMethod.POST)
	public ResponseEntity<Map<String , Object>> addStaff(@RequestBody AddStaff addStaff){
		HttpEntity<Object> request = new HttpEntity<Object>(addStaff, header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/staff", HttpMethod.POST , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	//get request from angular to get staff
	@RequestMapping(method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> getStaff(){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/staff", HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	//get request from angular to get staff not-in-study-process
	@RequestMapping(value="not-in-study-process/{cla_id}/{sub_id}", method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> getStaffNotProcess(@PathVariable int cla_id, @PathVariable int sub_id){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/staff/not-in-study-process/"+cla_id+"/"+sub_id, HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	//get request from angular to get student by id
	@RequestMapping(value="/{sta_id}",method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> getStaffById(@PathVariable int sta_id){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/staff/"+sta_id, HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	//get request from angular to get staff not user
	@RequestMapping(value="staffs-not-user",method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> getStaffNotUser(){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/staff/staffs-not-user", HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	//get request from angular to update student by id
	@RequestMapping(method = RequestMethod.PUT)
	public ResponseEntity<Map<String , Object>> updateStaff(@RequestBody AddStaff addStaff){
		HttpEntity<Object> request = new HttpEntity<Object>(addStaff, header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/staff", HttpMethod.PUT , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
}
