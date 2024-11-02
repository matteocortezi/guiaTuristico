package br.com.app.GuiaTuristico.repository;

import br.com.app.GuiaTuristico.model.Itinerary;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IItineraryRepository extends JpaRepository<Itinerary, Long> {
}
