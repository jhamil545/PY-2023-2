package pe.edu.upeu.milkminder.models;

import java.time.LocalDate;

import com.fasterxml.jackson.annotation.JsonFormat;

import jakarta.persistence.Basic;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
@Table(name = "especie")
public class Especie {
   @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;  

   @JsonFormat(pattern = "yyyy-MM-dd")
   @Basic(optional = false)
   @Column(name = "fecha_especie", nullable = false)
   @Temporal(TemporalType.DATE)
   private LocalDate fecha_especie;

   @Column(name = "descripcion", nullable = false)
    private String descripcion; 

   @Column(name = "edad", nullable = false)
    private String edad; 

   @Column(name = "tipo", nullable = false)
    private String tipo; 

  
}
