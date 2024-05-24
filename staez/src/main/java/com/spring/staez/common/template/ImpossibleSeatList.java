package com.spring.staez.common.template;

import java.util.ArrayList;

import com.spring.staez.admin.model.vo.ImpossibleSeat;

public class ImpossibleSeatList {
	private static final ArrayList<ImpossibleSeat> LIST = new ArrayList<ImpossibleSeat>();
	private ImpossibleSeatList() {};
	
	public static ArrayList<ImpossibleSeat> getList() {
		return LIST;
	}
	
	public static int clear() {
		try {			
			LIST.clear();
			return 1;
		} catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	public static int add(ImpossibleSeat seat) {
		try {			
			LIST.add(seat);
			return 1;
		} catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	public static int remove(ImpossibleSeat seat) {
		try {		
			for(int i = 0; i < LIST.size(); i++) {
				if(!equal(seat, LIST.get(i))) continue;
				LIST.remove(i);
				return 1;
			}
			return 0;
		} catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	public static boolean equal(ImpossibleSeat seat1, ImpossibleSeat seat2) {
		if(seat1.getImpossibleSeatRow() != seat2.getImpossibleSeatRow()) return false;
		if(seat1.getImpossibleSeatCol() != seat2.getImpossibleSeatCol()) return false;
		return true;
	}
}
