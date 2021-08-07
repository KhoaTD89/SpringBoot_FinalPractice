package edu.fa.service;

import edu.fa.dao.FresherRepository;
import edu.fa.model.Fresher;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FresherService {
    public final FresherRepository fresherRepository;

    public FresherService(FresherRepository fresherRepository) {
        this.fresherRepository = fresherRepository;
    }

    public Fresher save(Fresher fresher){
        fresherRepository.save(fresher);
        return fresher;
    }

    public List<Fresher> findAll(){
        return fresherRepository.findAll();
    }

    public void delete(Integer id){
        fresherRepository.deleteById(id);
    }

    public Fresher findById(Integer id){
        return fresherRepository.findById(id).orElse(null);
    }
}
