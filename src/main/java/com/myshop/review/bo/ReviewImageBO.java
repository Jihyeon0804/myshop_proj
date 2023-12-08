package com.myshop.review.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.myshop.common.FileManagerService;
import com.myshop.review.domain.ReviewImage;
import com.myshop.review.mapper.ReviewImageMapper;

@Service
public class ReviewImageBO {

	@Autowired
	private ReviewImageMapper reviewImageMapper;
	
	@Autowired
	private FileManagerService fileManager;
	
	// insert
	public void addReviewImage(int reviewId, MultipartFile file) {
		String imagePath = fileManager.saveFile(reviewId, file);
		reviewImageMapper.insertReviewImage(reviewId, imagePath);
	}
	
	// select
	public List<ReviewImage> getReviewImageList(int reviewId) {
		return reviewImageMapper.selectReviewImageList(reviewId);
	}
}
