package com.spring.staez.common.template;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.spring.staez.concert.service.ConcertRestTemplate;


@Component
public class ConcertApiScheduled  {
	
	@Autowired
	private ConcertRestTemplate conRestRun;
	
	@Scheduled(cron = "0 0 0 * * *")
    public void ConcertRestTemplate() {
		
		System.out.println("Scheduled task is running");
		conRestRun.requestConcertApi();
		System.out.println("conapiInsert task is running");
		
    }
}