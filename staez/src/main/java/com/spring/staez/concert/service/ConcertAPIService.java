package com.spring.staez.concert.service;

import java.net.URI;
import java.util.ArrayList;

import org.springframework.transaction.annotation.Transactional;

import com.spring.staez.concert.model.dto.ConcertDto;

public interface ConcertAPIService {

	URI makeUriDetail();

	ArrayList<ConcertDto> parseConcertData(String responseData);

	void requestConcertApi();

	void concertTotalApiInsert(ArrayList<ConcertDto> concertList);

	void concertApiInsert(ConcertDto concertDto);

	void concertAttatchmentApiInsert(ConcertDto concertDto);

	void concertScheduleApiInsert(ConcertDto concertDto);

}