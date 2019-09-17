package com.revesoft.springboot.web.office.layer;

import com.revesoft.springboot.web.office.ministry.MinistryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;

/**
 * Created by Bony on 11/5/2017.
 */
@RestController
public class LayerController {

    @Autowired
    LayerService layerService;
    @Autowired
    MinistryService ministryService;
    @RequestMapping(path = "layersbyministries")
    public ArrayList<LayerDTO> getLayers(@RequestParam int id){
        return layerService.getLayersByMinistries(id);
    }
    @RequestMapping(value = "layerlist", method = RequestMethod.GET)
    public ModelAndView layerList(HttpServletRequest request, @RequestParam int menuid) {

        ModelAndView layerList = new ModelAndView("office/layer/layerlist");
        layerList.addObject("menuid",menuid);
        layerList.addObject("ministry",ministryService.getAll());
        request.getSession().setAttribute("layermenuid",menuid);
        return layerList;
    }

    @RequestMapping(value = "addlayer", method = RequestMethod.POST)
    public int addLayer(HttpServletRequest request, @RequestParam int ministryid, @RequestParam String layernamebng, @RequestParam String layernameeng, @RequestParam int layerlevel, @RequestParam int layersequence, @RequestParam int parentlayerid) {

        LayerDTO layerDTO = new LayerDTO();
        layerDTO.setOfficeMinistryId(ministryid);
        layerDTO.setLayerNameBng(layernamebng);
        layerDTO.setLayerNameEng(layernameeng);
        layerDTO.setLayerLevel(layerlevel);
        layerDTO.setLayerSequence(layersequence);
        layerDTO.setParentLayerId(parentlayerid);
        layerDTO.setCreatedBy(((Long) request.getSession().getAttribute("employeeId")).intValue());
        layerDTO.setCreated(java.sql.Timestamp.from(java.time.Instant.now()));

        return layerService.add(layerDTO);
    }

    @RequestMapping(value = "editlayer", method = RequestMethod.POST)
    public int editLayer(HttpServletRequest request, @RequestParam int ministryid, @RequestParam int id, @RequestParam String layernamebng, @RequestParam String layernameeng, @RequestParam int layerlevel, @RequestParam int layersequence, @RequestParam int parentlayerid) {
        LayerDTO layerDTO = new LayerDTO();
        layerDTO.setId(id);
        layerDTO.setOfficeMinistryId(ministryid);
        layerDTO.setLayerNameBng(layernamebng);
        layerDTO.setLayerNameEng(layernameeng);
        layerDTO.setLayerLevel(layerlevel);
        layerDTO.setLayerSequence(layersequence);
        layerDTO.setParentLayerId(parentlayerid);
        layerDTO.setModifiedBy(((Long) request.getSession().getAttribute("employeeId")).intValue());
        layerDTO.setModified(java.sql.Timestamp.from(java.time.Instant.now()));

        return layerService.edit(layerDTO);
    }

    @RequestMapping(value = "layerdelete", method = RequestMethod.POST)
    public int layerDelete(HttpServletRequest request, @RequestParam int id) {
        LayerDTO layerDTO = new LayerDTO();
        layerDTO.setId(id);
        layerDTO.setModifiedBy(((Long) request.getSession().getAttribute("employeeId")).intValue());
        layerDTO.setModified(java.sql.Timestamp.from(java.time.Instant.now()));
        return layerService.delete(layerDTO);
    }
}
