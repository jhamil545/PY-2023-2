package pe.edu.upeu.milkminder.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import pe.edu.upeu.milkminder.models.Especie;

@Repository
public interface EspecieRepository extends JpaRepository<Especie,Long>{

    
}
