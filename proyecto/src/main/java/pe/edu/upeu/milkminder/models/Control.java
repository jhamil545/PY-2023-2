package pe.edu.upeu.milkminder.models;

import java.time.LocalDate;

import com.fasterxml.jackson.annotation.JsonFormat;

import jakarta.persistence.Basic;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
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
@Entity
@Data
@Table (name ="Control_Vaca")
public class Control {

    public enum Serviciotipo {//Insertar Manualmente en la tabla global_rol ambas opciones
        NATURAL, INSEMINACION
    }

    public enum Etapatipo {//Insertar Manualmente en la tabla global_rol ambas opciones
        NACIMIENTO, DESTETE, VAQUILLA, VAQUILLONA, PARTO, CAMPANA, SECA, ENFERMEDAD
    }

   @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "etapa_detalle", nullable = false)
    @Enumerated(EnumType.STRING)
    private Etapatipo etapaDetalle;
    
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Basic(optional = false)
    @Column(name = "fecha_prog", nullable = false)
    @Temporal(TemporalType.DATE)
    private LocalDate fechaProg;

    @JsonFormat(pattern = "yyyy-MM-dd")
    @Basic(optional = false)
    @Column(name = "fecha_real", nullable = false)
    @Temporal(TemporalType.DATE)
    private LocalDate fechaReal;

    @Column(name = "peso_vivokg", columnDefinition = "FLOAT")
    private Float pesoVivoKg;

    private String preno;

    @Column(name = "condicion_corporal", nullable = false)
    private String condicionCorporal;

    @Column(name = "tiene_mastitis", nullable = false)
    private Boolean tieneMastitis;
    
    private String tratamiento;

    @Column(name = "servicio", nullable = false)
    @Enumerated(EnumType.STRING)
    private Serviciotipo servico;
}