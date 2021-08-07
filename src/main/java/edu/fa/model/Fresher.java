package edu.fa.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Fresher {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String name;
    private Byte gender;

    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "MM/dd/yyyy")
    @JsonFormat(pattern = "MM/dd/yyyy")
    private Date birthdate;


    private Byte hasSalary;
    private Byte fromCampusLink;

    @ManyToOne
    @JoinColumn(name = "class_id", nullable = true)
    private Clazz clazz;

}
