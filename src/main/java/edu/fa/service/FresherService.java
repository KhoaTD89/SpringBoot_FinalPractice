package edu.fa.service;

import edu.fa.dao.FresherRepository;
import edu.fa.model.Fresher;
import org.springframework.stereotype.Service;

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
}
