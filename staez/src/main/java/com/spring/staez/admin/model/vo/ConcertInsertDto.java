package com.spring.staez.admin.model.vo;

import java.util.List;

import com.spring.staez.concert.model.vo.Concert;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Setter
@Getter
public class ConcertInsertDto {
	private List<ConcertSchedule> schedule;
	private List<Seat> seat;
	private Concert concert;
}
