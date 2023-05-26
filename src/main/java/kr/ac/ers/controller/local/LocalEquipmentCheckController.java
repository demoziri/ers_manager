package kr.ac.ers.controller.local;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/ers/local/equipmentCheck")
public class LocalEquipmentCheckController {

	@GetMapping("/list")
	public void list() {}
}
