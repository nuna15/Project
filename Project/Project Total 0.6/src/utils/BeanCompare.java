package utils;

import java.util.Comparator;

import dto.ReviewDataBean;

public class BeanCompare implements Comparator<ReviewDataBean> {

	@Override
	public int compare(ReviewDataBean one, ReviewDataBean two) {
		// TODO Auto-generated method stub
		long oneRating = one.getScore() / one.getEvaluateNumber();
		long twoRating = two.getScore() / two.getEvaluateNumber();

		if (oneRating > twoRating) {
			return 1;
		} else if (oneRating < twoRating) {
			return -1;
		} else {
			return 0;
		}
	}
}
