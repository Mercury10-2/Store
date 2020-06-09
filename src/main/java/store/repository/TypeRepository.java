package store.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import store.domain.Type;

@Repository
public interface TypeRepository extends CrudRepository<Type, Long> {

    Type findByName(String name);
}
