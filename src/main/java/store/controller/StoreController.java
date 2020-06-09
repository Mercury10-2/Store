package store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import store.domain.Item;
import store.domain.Type;
import store.service.StoreService;

import java.util.Map;

@Controller
public class StoreController {

    private final StoreService storeService;

    public StoreController(StoreService storeService) {
        this.storeService = storeService;
    }

    @GetMapping("/")
    public String starter(Map<String, Object> model) {
        Iterable<Type> types = storeService.checkData();
        Iterable<Item> items = storeService.getSortedItemRepositoryData();
        model.put("curType", "any");
        model.put("curSubtype", "any");
        model.put("curClass", "any");
        model.put("curName", "any");
        model.put("curSize", "any");
        model.put("types", types);
        model.put("subtypes", storeService.getSubtypeRepository().findAll());
        model.put("classes", storeService.getClasses(items));
        model.put("names", storeService.getNames(items));
        model.put("sizes", storeService.getSizes(items));
        model.put("filtered", items);
        model.put("search", "");
        return "store";
    }

    @GetMapping("/search")
    public String searchGet() {
        return "redirect:/";
    }

    @PostMapping("/search")
    public String search(@RequestParam(name = "search") String search, Map<String, Object> model) {
        Iterable<Item> searchResult = storeService.search(search);
        Iterable<Item> items = storeService.getSortedItemRepositoryData();
        model.put("curType", "any");
        model.put("curSubtype", "any");
        model.put("curClass", "any");
        model.put("curName", "any");
        model.put("curSize", "any");
        model.put("types", storeService.getTypeRepository().findAll());
        model.put("subtypes", storeService.getSubtypeRepository().findAll());
        model.put("classes", storeService.getClasses(items));
        model.put("names", storeService.getNames(items));
        model.put("sizes", storeService.getSizes(items));
        model.put("filtered", searchResult);
        model.put("search", search);
        return "store";
    }

    @PostMapping("/")
    public String filter(@RequestParam(value = "type") String curType,
                         @RequestParam(value = "subtype") String curSubtype,
                         @RequestParam(value = "class") String curClass,
                         @RequestParam(value = "name") String curName,
                         @RequestParam(value = "size") String curSize,
                         Map<String, Object> model) {
        Iterable<Item> items = storeService.getSortedItemRepositoryData();
        model.put("curType", curType);
        model.put("curSubtype", curSubtype);
        model.put("curClass", curClass);
        model.put("curName", curName);
        model.put("curSize", curSize);
        model.put("types", storeService.getTypeRepository().findAll());
        model.put("subtypes", storeService.getSubtypeRepository().findAll());
        model.put("classes", storeService.getClasses(items));
        model.put("names", storeService.getNames(items));
        model.put("sizes", storeService.getSizes(items));
        model.put("filtered", storeService.filter(items, curType, curSubtype, curClass, curName, curSize));
        model.put("search", "");
        return "store";
    }

    @GetMapping("/adding")
    public String adding(Map<String, Object> model) {
        model.put("id", "-1");
        return "/adding";
    }

    @PostMapping("/adding")
    public String saveAdded(@RequestParam(name = "type") String type,
                            @RequestParam(name = "subtype") String subtype,
                            @RequestParam(name = "className") String className,
                            @RequestParam(name = "name") String name,
                            @RequestParam(name = "size") String size,
                            @RequestParam(name = "price") String price,
                            @RequestParam(name = "quantity") String quantity,
                            @RequestParam(name = "store") String store,
                            @RequestParam(name = "id") String id,
                            Map<String, Object> model) {
        storeService.update(type, subtype, className, name, size, price, quantity, store, id);
        Iterable<Type> types = storeService.checkData();
        Iterable<Item> items = storeService.getSortedItemRepositoryData();
        model.put("curType", "any");
        model.put("curSubtype", "any");
        model.put("curClass", "any");
        model.put("curName", "any");
        model.put("curSize", "any");
        model.put("types", types);
        model.put("subtypes", storeService.getSubtypeRepository().findAll());
        model.put("classes", storeService.getClasses(items));
        model.put("names", storeService.getNames(items));
        model.put("sizes", storeService.getSizes(items));
        model.put("filtered", items);
        model.put("search", "");
        return "store";
    }

    @GetMapping("/update")
    public String update(@RequestParam(name = "id") String id,
                         Map<String, Object> model) {
        model.put("id", id);
        model.put("item", storeService.retrieveItem(id));
        return "/update";
    }

    @PostMapping("/update")
    public String save(@RequestParam(name = "type") String type,
                       @RequestParam(name = "subtype") String subtype,
                       @RequestParam(name = "className") String className,
                       @RequestParam(name = "name") String name,
                       @RequestParam(name = "size") String size,
                       @RequestParam(name = "price") String price,
                       @RequestParam(name = "quantity") String quantity,
                       @RequestParam(name = "store") String store,
                       @RequestParam(name = "id") String id,
                       Map<String, Object> model) {
        storeService.update(type, subtype, className, name, size, price, quantity, store, id);
        return "redirect:/";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam(name = "id") String id, Map<String, Object> model) {
        storeService.delete(id);
        return "redirect:/";
    }
}
