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
import org.springframework.web.bind.annotation.RequestParam;

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

    @GetMapping({"", "/", "index"})
    public String goHome() {
        if (clazzService.findAll().size() == 0) {
            List<Clazz> clazzes = new ArrayList<Clazz>();
            clazzes.add(new Clazz("Java"));
            clazzes.add(new Clazz("SQL"));
            clazzes.add(new Clazz("Hibernate"));
            clazzes.add(new Clazz("HTML, CSS"));
            clazzes.add(new Clazz("Spring"));
            for (Clazz c : clazzes) {
                clazzService.save(c);
            }
        }

        return "redirect:/show-freshers";
    }

    @GetMapping("/show-add-fresher-form")
    public String showAddingForm(Model model) {
        model.addAttribute("fresher", new Fresher());
        model.addAttribute("clazzes", clazzService.findAll());
        return "add-fresher-form";
    }

    @PostMapping("/save-fresher")
    public String saveFresher(@ModelAttribute("fresher") Fresher fresher) {
        System.out.println(fresher.toString());
        fresherService.save(fresher);
        return "redirect:/";
    }

    @GetMapping("/show-freshers")
    public String showFreshers(Model model) {
        model.addAttribute("freshers", fresherService.findAll());

        return "freshers-list";
    }

    @GetMapping("/show-update-form")
    public String showUpdateForm(
            @RequestParam("id") Integer id
            , Model model) {
        Fresher fresher = fresherService.findById(id);
        model.addAttribute("clazzes", clazzService.findAll());
        model.addAttribute("fresher",fresher);
        return "update-freshser-form";
    }

    @GetMapping("/delete-fresher")
    public String deleteFresher(@RequestParam("id") Integer id) {
        fresherService.delete(id);
        return "redirect:/show-freshers";
    }

}
