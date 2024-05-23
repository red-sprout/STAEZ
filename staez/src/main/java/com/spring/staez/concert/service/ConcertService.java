package com.spring.staez.concert.service;

import java.util.ArrayList;

import com.spring.staez.concert.model.vo.Concert;

public interface ConcertService {

	ArrayList<Concert> concertList(int categoryNo);

}
