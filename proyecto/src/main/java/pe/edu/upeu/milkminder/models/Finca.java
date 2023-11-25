package pe.edu.upeu.milkminder.models;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
@Table(name = "finca    ")
public class Finca {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id; 
    
    @Column(name = "nombre", nullable = false)
    private String nombre;

    @Column(name = "nom_cort", nullable = false)
    private String nom_cort;
    

    @Column(name = "direccion", nullable = false)
    private String direccion;

    @Column(name = "descripcion", nullable = false )
    private String descripcion;
    
    @Column(name = "ubigeo", nullable = false)
    private String ubigeo;

    @Column(name = "ttal_hectareas", nullable = false)
    private Double ttal_hectareas;
    
    

    @JoinColumn(name = "ganado_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    @JsonIgnoreProperties({"finca", "", "", ""})
    private Ganado ganadoId;  
    
}
