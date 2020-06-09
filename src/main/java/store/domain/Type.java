package store.domain;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
public class Type {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    @OneToMany(fetch = FetchType.LAZY)
    @JoinColumn(name = "subtype_id")
    private List<Subtype> subtypes;

    @OneToMany(fetch = FetchType.LAZY)
    @JoinColumn(name = "item_id")
    private List<Item> items;

    private String name;

    public Type() {
    }

    public Type(String name) {
        this.subtypes = new ArrayList<>();
        this.items = new ArrayList<>();
        this.name = name;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public List<Subtype> getSubtypes() {
        return subtypes;
    }

    public void setSubtypes(List<Subtype> subtypes) {
        this.subtypes = subtypes;
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
