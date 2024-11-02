package br.com.app.GuiaTuristico.service;

import br.com.app.GuiaTuristico.model.Itinerary;
import br.com.app.GuiaTuristico.repository.IItineraryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ItineraryService {
    @Autowired
    private final IItineraryRepository iItineraryRepository;

    public ItineraryService(IItineraryRepository iItineraryRepository) {
        this.iItineraryRepository = iItineraryRepository;
    }

    // Retorna todos
    public List<Itinerary> findAllItineraries() {
        return iItineraryRepository.findAll();
    }

    // Busca pelo ID
    public Itinerary findByIdItinerary(Long id) {
        return iItineraryRepository.findById(id).orElse(null);
    }

    // Salva ou atualiza
    public void saveItinerary(Itinerary itinerary) {
        iItineraryRepository.save(itinerary);
    }

    // Remove pelo ID
    public void deleteByIdItinerary(Long id) {
        iItineraryRepository.deleteById(id);
    }
}
