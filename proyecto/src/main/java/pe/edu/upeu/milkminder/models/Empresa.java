package pe.edu.upeu.milkminder.models;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
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
    private String nomCort;
    

    @Column(name = "direccion_fiscal", nullable = false)
    private String direccionFiscal;

    @Column(name = "ruc", nullable = false, length = 12 )
    private String ruc;
    
    @Column(name = "ubigeo", nullable = false)
    private String ubigeo;
    
    
     
    
}
