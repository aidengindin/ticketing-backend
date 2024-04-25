package com.aidengindin.ticketing;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface RegistrationRepository extends JpaRepository<Registration, Integer> {

    @Query(value = "SELECT r.* FROM registrations r INNER JOIN products p ON r.product_id = p.id WHERE p.event_id = ?1", nativeQuery = true)
    public List<Registration> findbyEventId(int eventId);

}
