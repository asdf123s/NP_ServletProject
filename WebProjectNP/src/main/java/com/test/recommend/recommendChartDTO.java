package com.test.recommend;

import lombok.Data;

@Data
public class recommendChartDTO {
	private String productSeq;
	private String productName;
	private String ingredientName;
	private String nutritionalIntake;
	private String ingredientIntake;
	
	private String measure;
	private String warning;
	private String productImage;
	private String ingredient;
}
