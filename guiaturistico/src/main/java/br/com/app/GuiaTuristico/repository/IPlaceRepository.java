package br.com.app.GuiaTuristico.repository;

import br.com.app.GuiaTuristico.model.Place;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IPlaceRepository extends JpaRepository<Place, Long> {

}
