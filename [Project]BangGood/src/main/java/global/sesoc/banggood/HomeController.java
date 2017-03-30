package global.sesoc.banggood;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.banggood.dao.PropertyDAO;
import global.sesoc.banggood.vo.Property;
import global.sesoc.banggood.vo.Property_map;


@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	SqlSession query;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "index";
	}

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search() {
		return "search";
	}

	@RequestMapping(value = "/searchboard", method = RequestMethod.GET)
	public String searchBoard(Model model) {
		return "searchboard";
	}
	
	
	@RequestMapping(value = "/intoMap", method = RequestMethod.POST)
	public @ResponseBody ArrayList<Property> intoMap(Model model){
		PropertyDAO pd = query.getMapper(PropertyDAO.class);
		ArrayList<Property> pList = pd.searchProperty();
		return pList;
	}
	
	@RequestMapping(value = "/read_property_map", method = RequestMethod.POST)
	public @ResponseBody Property_map property_map(String address){
		PropertyDAO pd = query.getMapper(PropertyDAO.class);
		Property_map pm = null;
		pm = pd.readProperty_map(address);
		return pm;
	}
}
