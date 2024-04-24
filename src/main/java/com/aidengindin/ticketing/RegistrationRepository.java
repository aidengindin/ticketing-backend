package com.aidengindin.ticketing;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface RegistrationRepository extends JpaRepository<Registration, Integer> {

    public List<Registration> findbyEventId(int eventId);

}
