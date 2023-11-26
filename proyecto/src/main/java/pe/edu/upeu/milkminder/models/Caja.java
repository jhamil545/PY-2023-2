package pe.edu.upeu.milkminder.models;

import java.time.LocalDate;
import java.util.List;


import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import jakarta.persistence.Basic;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Entity
@Data
public class Caja {

    public enum Movtipo {//Insertar Manualmente en la tabla global_rol ambas opciones
        INGRESO, EGRESO
    }

   
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "tipo_movimiento", nullable = false)
    @Enumerated(EnumType.STRING)
    private Movtipo movimiento;

    @JsonFormat(pattern = "yyyy-MM-dd")
    @Basic(optional = false)
    @Column(name = "fecha_prog", nullable = false)
    @Temporal(TemporalType.DATE)
    private LocalDate fecha;

    private String glosa;
    private Double cantidad;

    @Column(name = "precio_unitario", nullable = false)
    private Double precioUnitario;
    private Double subTotal;

    @OneToOne
    @JsonIgnoreProperties({"hibernateLazyInitializer","handler"})
    @JoinColumn(name = "finca_id")
    private Finca finca;

    @OneToMany(mappedBy = "caja", cascade = CascadeType.ALL)
    @JsonIgnoreProperties({"hibernateLazyInitializer","handler"})
    private List<Unidadmed> unidadesMed;

    @OneToMany(mappedBy = "caja", cascade = CascadeType.ALL)
    @JsonIgnoreProperties({"hibernateLazyInitializer","handler"})
    private List<Cuenta> cuentas;

    
}
