package global.sesoc.banggood.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import global.sesoc.banggood.repository.SearchBoardRepository;

@Controller
public class SearchBoardController {

	private static final Logger log = LoggerFactory.getLogger(SearchBoardController.class);
	
	@Autowired
	SearchBoardRepository sbr;
	
	
}
