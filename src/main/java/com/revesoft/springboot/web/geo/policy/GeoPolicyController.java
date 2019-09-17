package com.revesoft.springboot.web.geo.policy;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;

/**
 * Created by Bony on 11/21/2017.
 */
@RestController
public class GeoPolicyController {
    @RequestMapping(path = "/policy")
    public ArrayList<GeoPolicyDTO> getPolicy(){
        return new GeoPolicyService().get();
    }

}
