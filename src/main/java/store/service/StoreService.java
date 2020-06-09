package store.service;

import org.springframework.stereotype.Service;
import store.domain.Item;
import store.domain.Subtype;
import store.domain.Type;
import store.repository.ItemRepository;
import store.repository.SubtypeRepository;
import store.repository.TypeRepository;

import java.util.*;

@Service
public class StoreService {

    private final TypeRepository typeRepository;
    private final SubtypeRepository subtypeRepository;
    private final ItemRepository itemRepository;
    private final FakeDataGenerator fakeDataGenerator;

    public StoreService(TypeRepository typeRepository,
                    SubtypeRepository subtypeRepository,
                    ItemRepository itemRepository,
                    FakeDataGenerator fakeDataGenerator) {
        this.typeRepository = typeRepository;
        this.subtypeRepository = subtypeRepository;
        this.itemRepository = itemRepository;
        this.fakeDataGenerator = fakeDataGenerator;
    }

    public Iterable<Type> checkData() {
        Iterable<Type> types = typeRepository.findAll();
        if (!types.iterator().hasNext()) {
            fakeDataGenerator.generateData();
            return typeRepository.findAll();
        }
        return types;
    }

    public List<String> getClasses(Iterable<Item> items) {
        Set<String> set = new HashSet<>();
        for (Item item : items)
            set.add(item.getClassName());
        List<String> list = new ArrayList<>(set);
        Collections.sort(list);
        return list;
    }

    public List<String> getNames(Iterable<Item> items) {
        Set<String> set = new HashSet<>();
        for (Item item : items)
            set.add(item.getName());
        List<String> list = new ArrayList<>(set);
        Collections.sort(list);
        return list;
    }

    public List<String> getSizes(Iterable<Item> items) {
        Set<String> set = new HashSet<>();
        for (Item item : items)
            set.add(item.getSize());
        List<String> list = new ArrayList<>(set);
        Collections.sort(list);
        return list;
    }

    public Iterable<Item> search(String search) {
        search = search.toLowerCase();
        Set<Item> set = new HashSet<>();
        Iterable<Item> items = itemRepository.findAll();
        for (Item item : items) {
            if (String.valueOf(item.getId()).contains(search)
                        || item.getType().getName().toLowerCase().contains(search)
                        || item.getSubtype().getName().toLowerCase().contains(search)
                        || item.getClassName().toLowerCase().contains(search)
                        || item.getName().toLowerCase().contains(search)
                        || item.getSize().toLowerCase().contains(search)
                        || String.valueOf(item.getPrice()).contains(search)
                        || String.valueOf(item.getQuantity()).contains(search)
                        || item.getAtStore().toLowerCase().contains(search)) {
                set.add(item);
            }
        }
        List<Item> list = new ArrayList<>(set);
        list.sort(Comparator.comparing(Item::getId));
        Iterable<Item> iterable = list;
        return iterable;
    }

    public List<Item> filter(Iterable<Item> items,
                             String curType,
                             String curSubtype,
                             String curClass,
                             String curName,
                             String curSize) {
        List<Item> filtered = new ArrayList<>();
        for (Item item : items) {
            if (curType.equals("any") || item.getType().getName().equals(curType))
                if (curSubtype.equals("any") || item.getSubtype().getName().equals(curSubtype))
                    if (curClass.equals("any") || item.getClassName().equals(curClass))
                        if (curName.equals("any") || item.getName().equals(curName))
                            if (curSize.equals("any") || item.getSize().equals(curSize))
                                filtered.add(item);
        }
        return filtered;
    }

    public void update(String type,
                       String subtype,
                       String className,
                       String name,
                       String size,
                       String price,
                       String quantity,
                       String store,
                       String id) {
        Item item;
        if (id.equals("-1"))
            item = new Item();
        else
            item = retrieveItem(id);
        Type t = typeRepository.findByName(type);
        if (t == null) {
            t = new Type(type);
            typeRepository.save(t);
        }
        item.setType(t);
        Subtype st = subtypeRepository.findByName(subtype);
        if (st == null) {
            st = new Subtype(subtype, t);
            subtypeRepository.save(st);
        }
        item.setSubtype(st);
        item.setClassName(className);
        item.setName(name);
        item.setSize(size);
        item.setPrice(Double.parseDouble(price.replace(",", ".")));
        item.setQuantity(Integer.parseInt(quantity));
        item.setAtStore(store);
        itemRepository.save(item);
    }

    public void delete(String id) {
        itemRepository.delete(retrieveItem(id));
    }

    public Item retrieveItem(String id) {
        return itemRepository.findById(Long.parseLong(id)).get();
    }

    public Iterable<Item> getSortedItemRepositoryData() {
        List<Item> list = (List<Item>) getItemRepository().findAll();
        list.sort(Comparator.comparing(Item::getId));
        Iterable<Item> data = list;
        return data;
    }

    public TypeRepository getTypeRepository() {
        return typeRepository;
    }

    public SubtypeRepository getSubtypeRepository() {
        return subtypeRepository;
    }

    public ItemRepository getItemRepository() {
        return itemRepository;
    }
}
