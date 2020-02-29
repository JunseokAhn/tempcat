package global.sesoc.tempcat.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.tempcat.dao.MemberDao;

@Controller
public class SampleController {

    private static final Logger logger = LoggerFactory.getLogger(SampleController.class);

    @Autowired
    private MemberDao memberDao;

    @GetMapping(value = "single")
    public String single() {
	return "temp/single";
    }

    @GetMapping(value = "index")
    public String index() {
	return "temp/index";
    }
}
