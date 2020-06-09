package store.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import store.domain.Item;

@Repository
public interface ItemRepository extends CrudRepository<Item, Long> {
}
