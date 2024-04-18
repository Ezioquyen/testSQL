package com.example.testsql;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Data
@Table(name = "user",schema = "public")
public class User {
    @Id
    private Long id;
    private String name;
    private String email;
}
