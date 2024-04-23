package com.aidengindin.ticketing;

import org.springframework.web.bind.annotation.RestController;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;


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
}
