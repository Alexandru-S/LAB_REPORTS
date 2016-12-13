#include "Utilities.h"
#include <iostream>
#include <fstream>
#include <opencv2/core/core.hpp>
#include "opencv2/opencv.hpp"
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#include <cv.h>
#include <highgui.h>

using namespace cv;
using namespace std;

/*declare files*/
Mat roadsign_test2 = imread("Media/ROADSIGN_test.JPG", CV_LOAD_IMAGE_UNCHANGED);
Mat roadsign_test = imread("Media/ROADSIGN_test.JPG", CV_LOAD_IMAGE_UNCHANGED);
Mat roadsign_sample_red = imread("Media/ROADSIGN_samplered2.png", CV_LOAD_IMAGE_UNCHANGED);
Mat roadsign_sample = imread("Media/ROADSIGN_sample.JPG", CV_LOAD_IMAGE_UNCHANGED);
Mat roadsign_ground = imread("Media/ROADSIGN_comp.png", CV_LOAD_IMAGE_UNCHANGED);
Mat roadsign_sampleblackwhite = imread("Media/ROADSIGN_sampleblackwhite.png", CV_LOAD_IMAGE_UNCHANGED);

/*declare hsv+hls variables*/
Mat hsv_sample_red;
Mat hsv_sample; 
Mat hsv_test; 
Mat hls_test;
Mat hls_ground;

/*declare hue variables*/
Mat hue_red; 
Mat hue_sample;
Mat hue_test;
Mat hue_sampleblackwhite;
int bins = 25;

/*hist and back proj variables*/
MatND hist_red;
MatND backproj;
/*ground */
Mat ground_red;
Mat ground_black;
Mat ground_white;

/*sample*/
Mat blk_trsh; //black
Mat blk_thresh; //black2
Mat band_rng_bkprj; //red

Mat inrange_test;
Mat backproj2;
void Hist_and_Backproj(int, void*);

inline void mix_channels(cv::Mat const &src, cv::Mat &dst, std::initializer_list<int> from_to)
{
	cv::mixChannels(&src, 1, &dst, 1, std::begin(from_to), from_to.size() / 2);
}

/*Compare Recognition Function*/
void CompareRecognitionResults(Mat& locations_found, Mat& ground_truth)
{
	CV_Assert(locations_found.type() == CV_8UC1);
	CV_Assert(ground_truth.type() == CV_8UC1);
	double precision = 0;
	double recall = 0;
	double accuracy = 0;
	double specificity = 0;
	double f1 = 0;

	int false_positives = 0;
	int false_negatives = 0;
	int true_positives = 0;
	int true_negatives = 0;
	for (int row = 0; row < ground_truth.rows; row++)
		for (int col = 0; col < ground_truth.cols; col++)
		{
			uchar result = locations_found.at<uchar>(row, col);
			uchar gt = ground_truth.at<uchar>(row, col);
			if (gt > 0)
				if (result > 0)
					true_positives++;
				else false_negatives++;
			else if (result > 0)
				false_positives++;
			else true_negatives++;
		}
	precision = ((double)true_positives) / ((double)(true_positives + false_positives));
	recall = ((double)true_positives) / ((double)(true_positives + false_negatives));
	accuracy = ((double)(true_positives + true_negatives)) / ((double)(true_positives + false_positives + true_negatives + false_negatives));
	specificity = ((double)true_negatives) / ((double)(false_positives + true_negatives));
	f1 = 2.0*precision*recall / (precision + recall);

	printf("precision: %lf \n",precision);
	printf("recall: %lf \n",recall);
	printf("accuracy: %lf \n", accuracy);
	printf("f1: %lf \n",f1);
}
/*End of Compare Recognition Function*/

void groundRedBlackWhiteProj()
{
	cvtColor(roadsign_ground, hls_ground, CV_BGR2HSV);
	/*GROUND TRUTH*/
	inRange(hls_ground, Scalar(0, 0, 255), Scalar(0, 0, 255), ground_white);
	inRange(hls_ground, Scalar(0, 255, 255), Scalar(0, 255, 255), ground_red);
	inRange(hls_ground, Scalar(0, 0, 0), Scalar(0, 0, 0), ground_black);

	namedWindow("TUT1_GROUND_WHITE", CV_WINDOW_AUTOSIZE);
	imshow("TUT1_GROUND_WHITE", ground_white);

	namedWindow("TUT1_GROUND_RED", CV_WINDOW_AUTOSIZE);
	imshow("TUT1_GROUND_RED", ground_red);

	namedWindow("TUT1_GROUND_BLACK", CV_WINDOW_AUTOSIZE);
	imshow("TUT1_GROUND_BLACK", ground_black);
}


int main(int argc, const char** argv)
{
	if (roadsign_sample.empty())
	{
		printf("Cannot open video file: \n");
		return -1;
	}
	else {
		printf("Image succesfully opened \n");
		//make into hsv
		cvtColor(roadsign_test2, roadsign_test2,CV_BGR2RGB);
		cvtColor(roadsign_sample_red, hsv_sample_red, CV_BGR2HSV);
		cvtColor(roadsign_sample, hsv_sample, CV_BGR2HSV);
		cvtColor(roadsign_test, hsv_test, CV_BGR2HSV);
		cvtColor(roadsign_test, hls_test, CV_BGR2HLS);
		cvtColor(roadsign_ground, hls_ground, CV_BGR2HSV);

		/*GROUND TRUTH*/
		inRange(hls_ground, Scalar(0, 0, 255), Scalar(0, 0, 255), ground_white);
		inRange(hls_ground, Scalar(0, 255, 255), Scalar(0, 255, 255), ground_red);
		inRange(hls_ground, Scalar(0, 0, 0), Scalar(0, 0, 0), ground_black);
		//groundRedBlackWhiteProj();

		//hue is from 0 to 180
		int histSize_red = MAX(bins, 2);
		int histSize_blackwhite = MAX(bins, 2);
		float huerange[] = {0, 180};
		const float* ranges = { huerange };
		//use only hue value
		hue_red.create(hsv_sample_red.size(), hsv_sample_red.depth());
		hue_sample.create(hsv_sample.size(), hsv_sample.depth());
		hue_test.create(hsv_test.size(), hsv_test.depth());

		int ch[] = { 0,0 };
		mixChannels(&hsv_sample_red, 1, &hue_red, 1, ch, 1);
		mixChannels(&hsv_sample, 1, &hue_sample, 1, ch, 1);
		mixChannels(&hsv_test, 1, &hue_test, 1, ch, 1);

		/*Calculate and Normalize Hist*/
		calcHist(&hue_red, 1, ch, Mat(), hist_red, 1, &histSize_red, &ranges, true, false);
		normalize(hist_red, hist_red, 0, 255, NORM_MINMAX, -1, Mat());
		//drawing out the red histogram
		int w = 800; int h = 800;
		int bin_w = cvRound((double)w / histSize_red);
		Mat histImg = Mat::zeros(w, h, CV_8UC3);
		for (int i = 0; i < bins; i++)
		{
			rectangle(histImg, Point(i*bin_w, h), Point((i + 1)*bin_w, h - cvRound(hist_red.at<float>(i)*h / 255.0)), Scalar(0, 0, 255), -1);
		}
		calcBackProject(&hue_test, 1, 0, hist_red, backproj, &ranges, 1, true);
		Mat thresh_backproj;
		threshold(backproj, thresh_backproj, 8, 255, CV_THRESH_BINARY);
		Mat dil_thresh_backproj;
		dilate(thresh_backproj, dil_thresh_backproj, Mat(), Point(-1, -1), 2, 1, 1);
		
		/*second hls threshholded image*/
		inRange(hls_test, Scalar(10,10,55), Scalar(210, 190, 200), inrange_test);
		Mat dil_inrange_test;
		dilate(inrange_test, dil_inrange_test, Mat(), Point(-1, -1), 2, 1, 1);
		Mat morph;
		/*Using morphology to try and close red circles*/
		int morph_size = 4;
		Mat morph_dil_inrange_test;
		Mat element = getStructuringElement(MORPH_RECT, Size(2 * morph_size + 1, 2 * morph_size + 1), Point(morph_size, morph_size));
		morphologyEx(dil_inrange_test, morph_dil_inrange_test, MORPH_TOPHAT, element, Point(-1, -1), 50);
		
		
		bitwise_and(dil_thresh_backproj, morph_dil_inrange_test, band_rng_bkprj);
		dilate(band_rng_bkprj, band_rng_bkprj, Mat(), Point(-1, -1), 1, 1, 1);
		/*Dilate and morphology again to close the remaining gaps*/
		morphologyEx(band_rng_bkprj, band_rng_bkprj, MORPH_TOPHAT, element, Point(-1, -1), 50);
		Mat redcrop;
		bitwise_and(roadsign_test,roadsign_test,redcrop, band_rng_bkprj);
		Mat white_ff = band_rng_bkprj.clone();
		floodFill(white_ff, cv::Point(0, 0), Scalar(255));
		// use floodfill for contour hiararchy
		
		Mat white_ff_not;
		bitwise_not(white_ff, white_ff_not);
		Mat white_out = (band_rng_bkprj | white_ff_not);
		Mat whiten;
		bitwise_xor(band_rng_bkprj, white_out, whiten);
		Mat whiteblackcrop;
		bitwise_and(roadsign_test, roadsign_test, whiteblackcrop, whiten);
		Mat wbcgrey;
		cvtColor(whiteblackcrop, wbcgrey,CV_BGR2GRAY);
		Mat trsh_wht;
		threshold(wbcgrey, trsh_wht, 85, 255, CV_THRESH_BINARY);
		Mat cropp_white;
		bitwise_and(roadsign_test, roadsign_test, cropp_white, trsh_wht);
		Mat scd_wht_cropp;
		cvtColor(cropp_white, scd_wht_cropp, CV_BGR2GRAY);
		threshold(scd_wht_cropp, scd_wht_cropp, 0, 255, CV_THRESH_BINARY);
		threshold(cropp_white, trsh_wht, 20, 255, CV_THRESH_BINARY);
		namedWindow("TUT1_WHT", CV_WINDOW_AUTOSIZE);
		imshow("TUT1_WHT", scd_wht_cropp);

		Mat blk_ff = cropp_white.clone();
		floodFill(blk_ff, cv::Point(0, 0), Scalar(0,0,0));
		Mat blk_ff_not;
		bitwise_not(blk_ff, blk_ff_not);
		bitwise_and(whiteblackcrop, blk_ff_not, blk_trsh );
		/*have to grayscale otherwise image format is not accepted*/
		cvtColor(blk_trsh, blk_trsh, CV_BGR2GRAY);
		threshold(blk_trsh, blk_trsh, 0, 255, CV_THRESH_BINARY);
		CompareRecognitionResults(blk_trsh, ground_black);
		CompareRecognitionResults(scd_wht_cropp, ground_white);
		CompareRecognitionResults(band_rng_bkprj, ground_red);
		
		//namedWindow("WINDOW_1", CV_WINDOW_AUTOSIZE);
		//imshow("WINDOW_1", <name of image to be tested>);
		waitKey(0);
		destroyWindow("Tut1");
	}
	return 0;
}

