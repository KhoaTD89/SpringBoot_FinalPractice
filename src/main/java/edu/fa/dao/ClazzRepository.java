package edu.fa.dao;

import edu.fa.model.Clazz;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ClazzRepository extends JpaRepository<Clazz,Integer> {
}
