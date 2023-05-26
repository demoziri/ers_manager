package kr.ac.ers.controller.center;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/ers/center/equipmentCheck")
public class CenterEquipmentCheckController {

	@GetMapping("/list")
	public void list() {}
}
