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
@Table(name = "empresa ")
public class Empresa {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id; 
    
    @Column(name = "nombre", nullable = false)
    private String nombre;

    @Column(name = "nom_cort", nullable = false)
    private String nom_cort;
    

    @Column(name = "direccion_fiscal", nullable = false)
    private String direccion_fiscal;

    @Column(name = "ruc", nullable = false, length = 12 )
    private String ruc;
    
    @Column(name = "ubigeo", nullable = false)
    private String ubigeo;
    

    @JoinColumn(name = "finca_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    @JsonIgnoreProperties({"empresa", "", "", ""})
    private Finca fincaId;  
    
}
