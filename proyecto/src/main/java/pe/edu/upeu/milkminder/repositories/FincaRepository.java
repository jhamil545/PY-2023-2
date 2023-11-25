package pe.edu.upeu.milkminder.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import pe.edu.upeu.milkminder.models.Finca;


@Repository
public interface FincaRepository extends JpaRepository<Finca, Long> {
    
}
