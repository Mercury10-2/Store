package store.service;

import org.springframework.stereotype.Service;
import store.domain.Item;
import store.domain.Subtype;
import store.domain.Type;
import store.repository.ItemRepository;
import store.repository.SubtypeRepository;
import store.repository.TypeRepository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

@Service
public class FakeDataGenerator {

    private final TypeRepository typeRepository;
    private final SubtypeRepository subtypeRepository;
    private final ItemRepository itemRepository;

    public FakeDataGenerator(TypeRepository typeRepository,
                             SubtypeRepository subtypeRepository,
                             ItemRepository itemRepository) {
        this.typeRepository = typeRepository;
        this.subtypeRepository = subtypeRepository;
        this.itemRepository = itemRepository;
    }

    public void dataRenewal() {
        try {
            Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost/test",
                    "postgres", "postgres");
            Statement statement = connection.createStatement();
            statement.executeUpdate("create database t1");
            statement.executeUpdate("connect database t1");
            statement.executeUpdate("drop database test");
            statement.executeUpdate("create database test");
            statement.executeUpdate("connect database test");
            statement.executeUpdate("drop database t1");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        generateData();
    }

    public void generateData() {
        Type type = new Type("drinks");
        typeRepository.save(type);

        Subtype subtype = new Subtype("alcoholic", type);
        subtypeRepository.save(subtype);

        itemRepository.save(new Item("beer", "Tuborg", type, subtype, "0.33", 0.7, 198, "2034"));
        itemRepository.save(new Item("beer", "Tuborg", type, subtype, "0.5", 0.97, 254, "1876"));
        itemRepository.save(new Item("beer", "Carlsberg", type, subtype, "0.33", 0.8, 96, "1420"));
        itemRepository.save(new Item("beer", "Carlsberg", type, subtype, "0.5", 1.0, 142, "3491"));
        itemRepository.save(new Item("vodka", "Stolichnaya", type, subtype, "0.5", 2.79, 36, "216"));

        subtype = new Subtype("non-alcoholic", type);
        subtypeRepository.save(subtype);

        itemRepository.save(new Item("lemonade", "Coca-Cola", type, subtype, "0.33", 0.65, 196, "4012"));
        itemRepository.save(new Item("lemonade", "Coca-Cola", type, subtype, "0.5", 0.9, 212, "3617"));
        itemRepository.save(new Item("lemonade", "Pepsi-Cola", type, subtype, "0.33", 0.7, 45, "2016"));
        itemRepository.save(new Item("lemonade", "Pepsi-Cola", type, subtype, "0.5", 0.9, 79, "2098"));
        itemRepository.save(new Item("juice", "apple juice", type, subtype, "0.33", 0.79, 189, "1402"));
        itemRepository.save(new Item("juice", "apple juice", type, subtype, "0.5", 0.9, 214, "3078"));
        itemRepository.save(new Item("juice", "apple juice", type, subtype, "1", 1.2, 29, "1209"));
        itemRepository.save(new Item("juice", "orange juice", type, subtype, "0.33", 0.87, 145, "1965"));
        itemRepository.save(new Item("juice", "orange juice", type, subtype, "0.5", 1.0, 189, "4874"));
        itemRepository.save(new Item("juice", "orange juice", type, subtype, "1", 1.2, 73, "914"));

        type = new Type("food");
        typeRepository.save(type);

        subtype = new Subtype("bakery", type);
        subtypeRepository.save(subtype);

        itemRepository.save(new Item("bread", "black", type, subtype, "1", 0.76, 94, "216"));
        itemRepository.save(new Item("bread", "white", type, subtype, "1", 1.12, 119, "375"));
        itemRepository.save(new Item("pie", "cream pie", type, subtype, "1", 2.47, 14, "72"));
        itemRepository.save(new Item("pie", "raisins pie", type, subtype, "3", 3.82, 42, "235"));
        itemRepository.save(new Item("cookies", "milky cookie", type, subtype, "6", 3.94, 46, "518"));
        itemRepository.save(new Item("cake", "cream cake", type, subtype, "1", 4.87, 42, "235"));

        subtype = new Subtype("meat", type);
        subtypeRepository.save(subtype);

        itemRepository.save(new Item("sausage", "italian saus.", type, subtype, "4", 3.84, 98, "1059"));
        itemRepository.save(new Item("sausage", "beaf saus.", type, subtype, "6", 7.14, 64, "619"));
        itemRepository.save(new Item("sausage", "chili saus.", type, subtype, "12", 3.12, 267, "4832"));
        itemRepository.save(new Item("burger", "spicy burger", type, subtype, "1", 1.8, 149, "904"));
        itemRepository.save(new Item("burger", "king burger", type, subtype, "1", 2.63, 114, "593"));
    }
}
