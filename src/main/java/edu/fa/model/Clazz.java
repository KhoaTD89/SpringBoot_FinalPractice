package edu.fa.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.Set;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Clazz {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String className;

    @OneToMany(mappedBy = "clazz")
    private Set<Fresher> freshers;

    public Clazz(String className) {
        this.className = className;
    }
}
