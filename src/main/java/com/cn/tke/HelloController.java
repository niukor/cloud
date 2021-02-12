package com.cn.tke;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {
    @GetMapping(value = "/hello")
    public String sayHello(){
        return "Hello World! - I am from Coding! -CKE";
    }
}
