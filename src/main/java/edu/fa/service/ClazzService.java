package edu.fa.service;

import edu.fa.dao.ClazzRepository;
import edu.fa.model.Clazz;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClazzService {
    private final ClazzRepository clazzRepository;

    public ClazzService(ClazzRepository clazzRepository) {
        this.clazzRepository = clazzRepository;
    }

    public List<Clazz> findAll(){
        return clazzRepository.findAll();
    }

    public void save(Clazz clazz){
        clazzRepository.save(clazz);
    }
}
