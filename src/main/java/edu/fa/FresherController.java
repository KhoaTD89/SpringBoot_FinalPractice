package edu.fa;

import edu.fa.model.Clazz;
import edu.fa.model.Fresher;
import edu.fa.service.ClazzService;
import edu.fa.service.FresherService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
public class FresherController {
    private final FresherService fresherService;
    private final ClazzService clazzService;

    public FresherController(FresherService fresherService, ClazzService clazzService) {
        this.fresherService = fresherService;
        this.clazzService = clazzService;
    }

    @GetMapping({"","/","index"})
    public String goHome() {
        if(clazzService.findAll().size()==0){
            List<Clazz> clazzes = new ArrayList<Clazz>();
            clazzes.add(new Clazz("Java"));
            clazzes.add(new Clazz("SQL"));
            clazzes.add(new Clazz("Hibernate"));
            clazzes.add(new Clazz("HTML, CSS"));
            clazzes.add(new Clazz("Spring"));
            for(Clazz c : clazzes){
                clazzService.save(c);
            }
        }

        return "index";
    }

    @GetMapping("/show-add-fresher-form")
    public String showAddingForm(Model model) {
        model.addAttribute("fresher",new Fresher());
        model.addAttribute("clazzes",clazzService.findAll());
        return "add-fresher-form";
    }

    @PostMapping("/save-fresher")
    public String saveFresher(@ModelAttribute("fresher") Fresher fresher){
        fresherService.save(fresher);
        return "redirect:/";
    }

}
