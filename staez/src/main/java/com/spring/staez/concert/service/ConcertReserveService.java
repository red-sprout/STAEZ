package com.spring.staez.concert.service;

import com.spring.staez.concert.model.vo.Concert;

public interface ConcertReserveService {
	
	Concert reserveConcertInfo(int concertNo);
}
