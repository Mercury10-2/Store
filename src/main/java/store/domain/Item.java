package store.domain;

import javax.persistence.*;

@Entity
public class Item {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    @ManyToOne(fetch = FetchType.LAZY)
    private Type type;

    @ManyToOne(fetch = FetchType.LAZY)
    private Subtype subtype;

    private String className;
    private String size;
    private double price;
    private String name;
    private String atStore;
    private int quantity;

    public Item() {
    }

    public Item(String className, String name, Type type, Subtype subtype, String size, double price, int quantity, String atStore) {
        this.type = type;
        this.subtype = subtype;
        this.className = className;
        this.size = size;
        this.price = price;
        this.name = name;
        this.atStore = atStore;
        this.quantity = quantity;
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

    public Subtype getSubtype() {
        return subtype;
    }

    public void setSubtype(Subtype subtype) {
        this.subtype = subtype;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAtStore() {
        return atStore;
    }

    public void setAtStore(String atStore) {
        this.atStore = atStore;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
