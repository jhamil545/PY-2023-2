package pe.edu.upeu.milkminder.models;

import java.time.LocalDate;

import com.fasterxml.jackson.annotation.JsonFormat;

import jakarta.persistence.Basic;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
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

    private Movtipo movimiento;

    @JsonFormat(pattern = "yyyy-MM-dd")
    @Basic(optional = false)
    @Column(name = "fecha_prog", nullable = false)
    @Temporal(TemporalType.DATE)
    private LocalDate fecha;

    private String glosa;
    private Float cantidad;
    private Float precioUnitario;
    private Float subTotal;



    
}
