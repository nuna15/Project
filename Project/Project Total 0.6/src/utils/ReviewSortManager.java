package utils;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;

import dto.ReviewDataBean;

public class ReviewSortManager {

	private static ReviewSortManager instance = new ReviewSortManager();

	public static ReviewSortManager getInstance() {
		return instance;
	}

	public ReviewSortManager() {
		// TODO Auto-generated constructor stub
	}

	public ArrayList<ReviewDataBean> sortingArrayList(
			ArrayList<ReviewDataBean> reviews) {
		BeanCompare compare = new BeanCompare();
		Collections.sort(reviews, compare);
		Collections.reverse(reviews);
		System.out.println(reviews.get(0).getScore() + " "
				+ reviews.get(1).getScore());
		return reviews;
	}
}
