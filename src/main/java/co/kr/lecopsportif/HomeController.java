package co.kr.lecopsportif;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest request, Model model) {
		
		Device device = DeviceUtils.getCurrentDevice(request);
//		System.out.println(device);
		if (device.isMobile()) {
			//System.out.println("mobile user");
			return "mb_airlock";
		}else if (device.isTablet()) {
			//System.out.println("tablet user");
			return "mb_airlock";
		}else {
			return "dt_airlock";
		}
	}
	
}
