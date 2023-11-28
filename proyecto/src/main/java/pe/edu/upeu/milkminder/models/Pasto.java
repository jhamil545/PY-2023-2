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
@Table(name = "pasto")
public class Pasto {
   @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;  

   @JsonFormat(pattern = "yyyy-MM-dd")
   @Basic(optional = false)
   @Column(name = "fecha_pasto", nullable = false)
   @Temporal(TemporalType.DATE)
   private LocalDate fechapast;

   @Column(name = "area", nullable = false)
    private String area; 

   @Column(name = "especiepasto", nullable = false)
    private String especiepasto; 

   @Column(name = "estadocorte", nullable = false)
    private String estadocorte; 

   @Column(name = "peso_fresco", nullable = false)
    private String pesofresc; 
  
   @Column(name = "produccion", nullable = false)
    private String produccion; 

   @Column(name = "aream2", nullable = false)
    private String aream2;        
}
