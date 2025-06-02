package com.example.demo;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.CrossOrigin;

import java.util.HashMap;
import java.util.Map;

@RestController
public class HelloController {

    @RequestMapping("/hello")
    public String hello() {
        return "Hello World RESTful with Spring Boot";
    }

    @CrossOrigin(origins = "http://localhost")
    @RequestMapping("/hello1")
    public Map<String, String> sayHello() {
        HashMap<String, String> map = new HashMap<>();
        map.put("key", "value");
        map.put("foo", "bar");
        map.put("aa", "bb");
        return map;
    }
}