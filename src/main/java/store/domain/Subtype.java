package store.domain;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
public class Subtype {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    @ManyToOne(fetch = FetchType.LAZY)
    private Type type;

    @OneToMany(fetch = FetchType.LAZY)
    @JoinColumn(name = "item_id")
    private List<Item> items;

    private String name;

    public Subtype() {
    }

    public Subtype( String name, Type type) {
        this.name = name;
        this.type = type;
        this.items = new ArrayList<>();
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Type getType() {
        return type;
    }

    public void setType(Type type) {
        this.type = type;
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
