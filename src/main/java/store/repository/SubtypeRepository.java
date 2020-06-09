package store.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import store.domain.Subtype;

@Repository
public interface SubtypeRepository extends CrudRepository<Subtype, Long> {

    Subtype findByName(String name);
}
