package edu.fa.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.Date;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Fresher {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String name;
    private Byte gender;

    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern="MM/dd/yyyy")
    private Date birthdate;

    private Byte hasSalary;
    private Byte fromCampusLink;

    @ManyToOne
    @JoinColumn(name="class_id",nullable = true)
    private Clazz clazz;

}
