package utils;

import constants.WPConstants;

public class SeatTable {
	private boolean[][] table;

	public SeatTable() {
		table = new boolean[WPConstants.SEAT_COLUMN][WPConstants.SEAT_ROW];
		for (int i = 0; i < 5; i++) {
			table[i] = new boolean[WPConstants.SEAT_ROW];
		}
	}

	public boolean[][] getTable() {
		return table;
	}

	public void setTable(int x, int y, boolean check) {
		this.table[x][y] = check;
	}
}
