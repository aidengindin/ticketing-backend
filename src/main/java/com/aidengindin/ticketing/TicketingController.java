package com.aidengindin.ticketing;

import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.NoSuchElementException;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;


@RestController
public class TicketingController {

    private final EventRepository eventRepository;
    private final OrganizerRepository organizerRepository;
    private final ProductRepository productRepository;
    private final RegistrationRepository registrationRepository;

    public TicketingController(EventRepository eventRepository, OrganizerRepository organizerRepository,
            ProductRepository productRepository, RegistrationRepository registrationRepository) {
        this.eventRepository = eventRepository;
        this.organizerRepository = organizerRepository;
        this.productRepository = productRepository;
        this.registrationRepository = registrationRepository;
    }

    @GetMapping("/events")
    public List<Event> getEvents() {
        return eventRepository.findAll();
    }

    @GetMapping("/events/{id}")
    public Event getEventById(@PathVariable("id") int eventId) {
        return eventRepository.findById(eventId)
            .orElseThrow(() -> new NoSuchElementException("Event with id " + eventId + " not found"));
    }
    
    @GetMapping("/organizers")
    public List<Organizer> getOrganizers() {
        return organizerRepository.findAll();
    }

    @GetMapping("/products")
    public List<Product> getProductsByEvent(@RequestParam("eventId") int eventId) {
        return productRepository.findByEventId(eventId);
    }

    @GetMapping("/registrations")
    public List<Registration> getRegistrationsByEvent(@RequestParam("eventId") int eventId) {
        return registrationRepository.findbyEventId(eventId);
    }

    @PostMapping("/registrations")
    public Registration addRegistration(@RequestBody Registration registration) {
        return registrationRepository.save(registration);
    }
    
}
