#include "Utilities.h"
#include "opencv2/video.hpp"
#include <iostream>
#include <fstream>
using namespace std;

//This begins the set of functions directly written by Kenneth Dawson-Howe
class MedianBackground
{
private:
	Mat mMedianBackground;
	float**** mHistogram;
	float*** mLessThanMedian;
	float mAgingRate;
	float mCurrentAge;
	float mTotalAges;
	int mValuesPerBin;
	int mNumberOfBins;
public:
	MedianBackground( Mat initial_image, float aging_rate, int values_per_bin );
	Mat GetBackgroundImage();
	void UpdateBackground( Mat current_frame );
	float getAgingRate()
	{
		return mAgingRate;
	}
};
MedianBackground::MedianBackground( Mat initial_image, float aging_rate, int values_per_bin )
{
	mCurrentAge = 1.0;
	mAgingRate = aging_rate;
	mTotalAges = 0.0;
	mValuesPerBin = values_per_bin;
	mNumberOfBins = 256/mValuesPerBin;
	mMedianBackground = Mat::zeros(initial_image.size(), initial_image.type());
	mLessThanMedian = (float***) new float**[mMedianBackground.rows];
	mHistogram = (float****) new float***[mMedianBackground.rows];
	for (int row=0; (row<mMedianBackground.rows); row++)
	{
		mHistogram[row] = (float***) new float**[mMedianBackground.cols];
		mLessThanMedian[row] = (float**) new float*[mMedianBackground.cols];
		for (int col=0; (col<mMedianBackground.cols); col++)
		{
			mHistogram[row][col] = (float**) new float*[mMedianBackground.channels()];
			mLessThanMedian[row][col] = new float[mMedianBackground.channels()];
			for (int ch=0; (ch<mMedianBackground.channels()); ch++)
			{
				mHistogram[row][col][ch] = new float[mNumberOfBins];
				mLessThanMedian[row][col][ch] = 0.0;
				for (int bin=0; (bin<mNumberOfBins); bin++)
				{
					mHistogram[row][col][ch][bin] = (float) 0.0;
				}
			}
		}
	}
}
Mat MedianBackground::GetBackgroundImage()
{
	return mMedianBackground;
}
void MedianBackground::UpdateBackground( Mat current_frame )
{
	mTotalAges += mCurrentAge;
	float total_divided_by_2 = mTotalAges/((float) 2.0);
	for (int row=0; (row<mMedianBackground.rows); row++)
	{
		for (int col=0; (col<mMedianBackground.cols); col++)
		{
			for (int ch=0; (ch<mMedianBackground.channels()); ch++)
			{
				int new_value = (mMedianBackground.channels()==3) ? current_frame.at<Vec3b>(row,col)[ch] : current_frame.at<uchar>(row,col);
				int median = (mMedianBackground.channels()==3) ? mMedianBackground.at<Vec3b>(row,col)[ch] : mMedianBackground.at<uchar>(row,col);
				int bin = new_value/mValuesPerBin;
				mHistogram[row][col][ch][bin] += mCurrentAge;
				if (new_value < median)
					mLessThanMedian[row][col][ch] += mCurrentAge;
				int median_bin = median/mValuesPerBin;
				while ((mLessThanMedian[row][col][ch] + mHistogram[row][col][ch][median_bin] < total_divided_by_2) && (median_bin < 255))
				{
					mLessThanMedian[row][col][ch] += mHistogram[row][col][ch][median_bin];
					median_bin++;
				}
				while ((mLessThanMedian[row][col][ch] > total_divided_by_2) && (median_bin > 0))
				{
					median_bin--;
					mLessThanMedian[row][col][ch] -= mHistogram[row][col][ch][median_bin];
				}
				if (mMedianBackground.channels()==3)
					mMedianBackground.at<Vec3b>(row,col)[ch] = median_bin*mValuesPerBin;
				else mMedianBackground.at<uchar>(row,col) = median_bin*mValuesPerBin;
			}
		}
	}
	mCurrentAge *= mAgingRate;
}
class Histogram
{
protected:
	Mat mImage;
	int mNumberChannels;
	int* mChannelNumbers;
	int* mNumberBins;
	float mChannelRange[2];
public:
	Histogram()
	{
	}
	Histogram( Mat image, int number_of_bins )
	{
		mImage = image;
		mNumberChannels = mImage.channels();
		mChannelNumbers = new int[mNumberChannels];
		mNumberBins = new int[mNumberChannels];
		mChannelRange[0] = 0.0;
		mChannelRange[1] = 255.0;
		for (int count=0; count<mNumberChannels; count++)
		{
			mChannelNumbers[count] = count;
			mNumberBins[count] = number_of_bins;
		}
		//ComputeHistogram();
	}
	virtual void ComputeHistogram()=0;
	virtual void NormaliseHistogram()=0;
	static void Draw1DHistogram( MatND histograms[], int number_of_histograms, Mat& display_image )
	{
		int number_of_bins = histograms[0].size[0];
		double max_value=0, min_value=0;
		double channel_max_value=0, channel_min_value=0;
		for (int channel=0; (channel < number_of_histograms); channel++)
		{
			minMaxLoc(histograms[channel], &channel_min_value, &channel_max_value, 0, 0);
			max_value = ((max_value > channel_max_value) && (channel > 0)) ? max_value : channel_max_value;
			min_value = ((min_value < channel_min_value) && (channel > 0)) ? min_value : channel_min_value;
		}
		float scaling_factor = ((float)256.0)/((float)number_of_bins);
		
		Mat histogram_image((int)(((float)number_of_bins)*scaling_factor)+1,(int)(((float)number_of_bins)*scaling_factor)+1,CV_8UC3,Scalar(255,255,255));
		display_image = histogram_image;
		line(histogram_image,Point(0,0),Point(0,histogram_image.rows-1),Scalar(0,0,0));
		line(histogram_image,Point(histogram_image.cols-1,histogram_image.rows-1),Point(0,histogram_image.rows-1),Scalar(0,0,0));
		int highest_point = static_cast<int>(0.9*((float)number_of_bins)*scaling_factor);
		for (int channel=0; (channel < number_of_histograms); channel++)
		{
			int last_height;
			for( int h = 0; h < number_of_bins; h++ )
			{
				float value = histograms[channel].at<float>(h);
				int height = static_cast<int>(value*highest_point/max_value);
				int where = (int)(((float)h)*scaling_factor);
				if (h > 0)
					line(histogram_image,Point((int)(((float)(h-1))*scaling_factor)+1,(int)(((float)number_of_bins)*scaling_factor)-last_height),
								         Point((int)(((float)h)*scaling_factor)+1,(int)(((float)number_of_bins)*scaling_factor)-height),
							             Scalar(channel==0?255:0,channel==1?255:0,channel==2?255:0));
				last_height = height;
			}
		}
	}
};
class OneDHistogram : public Histogram
{
private:
	MatND mHistogram[3];
public:
	OneDHistogram( Mat image, int number_of_bins ) :
	  Histogram( image, number_of_bins )
	{
		ComputeHistogram( );
	}
	void ComputeHistogram( )
	{
		vector<Mat> image_planes(mNumberChannels);
		split(mImage, image_planes);
		for (int channel=0; (channel < mNumberChannels); channel++)
		{
			const float* channel_ranges = mChannelRange;
			int *mch = {0};
			calcHist(&(image_planes[channel]), 1, mChannelNumbers, Mat(), mHistogram[channel], 1 , mNumberBins, &channel_ranges);
		}
	}
	void SmoothHistogram( )
	{
		for (int channel=0; (channel < mNumberChannels); channel++)
		{
			MatND temp_histogram = mHistogram[channel].clone();
			for(int i = 1; i < mHistogram[channel].rows - 1; ++i)
			{
				mHistogram[channel].at<float>(i) = (temp_histogram.at<float>(i-1) + temp_histogram.at<float>(i) + temp_histogram.at<float>(i+1)) / 3;
			}
		}
	}
	MatND getHistogram(int index)
	{
		return mHistogram[index];
	}
	void NormaliseHistogram()
	{
		for (int channel=0; (channel < mNumberChannels); channel++)
		{
			normalize(mHistogram[channel],mHistogram[channel],1.0);
		}
	}
	Mat BackProject( Mat& image )
	{
		Mat& result = image.clone();
		if (mNumberChannels == 1)
		{
			const float* channel_ranges[] = { mChannelRange, mChannelRange, mChannelRange };
			for (int channel=0; (channel < mNumberChannels); channel++)
			{
				calcBackProject(&image,1,mChannelNumbers,*mHistogram,result,channel_ranges,255.0);
			}
		}
		else
		{
		}
		return result;
	}
	void Draw( Mat& display_image )
	{
		Draw1DHistogram( mHistogram, mNumberChannels, display_image );
	}
};
class ColourHistogram : public Histogram
{
public:
	MatND mHistogram;

	ColourHistogram() : 
		Histogram() 
	{
	}
	ColourHistogram( Mat image, int number_of_bins ) :
	  Histogram( image, number_of_bins )
	{
		ComputeHistogram();
	}
	void ComputeHistogram()
	{
		const float* channel_ranges[] = { mChannelRange, mChannelRange, mChannelRange };
		calcHist(&mImage, 1, mChannelNumbers, Mat(), mHistogram, mNumberChannels, mNumberBins, channel_ranges);
	}
	void NormaliseHistogram()
	{
		normalize(mHistogram,mHistogram,1.0);
	}
	Mat BackProject( Mat& image )
	{
		Mat& result = image.clone();
		const float* channel_ranges[] = { mChannelRange, mChannelRange, mChannelRange };
		calcBackProject(&image,1,mChannelNumbers,mHistogram,result,channel_ranges,255.0);
		return result;
	}
	MatND getHistogram()
	{
		return mHistogram;
	}
};
class HueHistogram : public Histogram
{
private:
	MatND mHistogram;
	int mMinimumSaturation, mMinimumValue, mMaximumValue;
#define DEFAULT_MIN_SATURATION 25
#define DEFAULT_MIN_VALUE 25
#define DEFAULT_MAX_VALUE 230
public:
	HueHistogram( Mat image, int number_of_bins, int min_saturation=DEFAULT_MIN_SATURATION, int min_value=DEFAULT_MIN_VALUE, int max_value=DEFAULT_MAX_VALUE ) :
	  Histogram( image, number_of_bins )
	{
		mMinimumSaturation = min_saturation;
		mMinimumValue = min_value;
		mMaximumValue = max_value;
		mChannelRange[1] = 180.0;
		ComputeHistogram();
	}
	void ComputeHistogram()
	{
		Mat hsv_image, hue_image, mask_image;
		cvtColor(mImage, hsv_image, CV_BGR2HSV);
		inRange( hsv_image, Scalar( 0, mMinimumSaturation, mMinimumValue ), Scalar( 180, 256, mMaximumValue ), mask_image );
		int channels[]={0,0};
		hue_image.create( mImage.size(), mImage.depth());
		mixChannels( &hsv_image, 1, &hue_image, 1, channels, 1 );
		const float* channel_ranges = mChannelRange;
		calcHist( &hue_image,1,0,mask_image,mHistogram,1,mNumberBins,&channel_ranges);
	}
	void NormaliseHistogram()
	{
		normalize(mHistogram,mHistogram,0,255,CV_MINMAX);
	}
	Mat BackProject( Mat& image )
	{
		Mat& result = image.clone();
		const float* channel_ranges = mChannelRange;
		calcBackProject(&image,1,mChannelNumbers,mHistogram,result,&channel_ranges,255.0);
		return result;
	}
	MatND getHistogram()
	{
		return mHistogram;
	}
	void Draw( Mat& display_image )
	{
		Draw1DHistogram( &mHistogram, 1, display_image );
	}
};
//This ends the set of functions directly written by Kenneth Dawson-Howe

//The following code contains segments that are originally written by Kenneth Dawson-Howe
void ObjectsOfInterest( VideoCapture& surveillance_video, int starting_frame, int& frame_of_interest_1, int& frame_of_interest_2, Mat& frame1, Mat& frame2, Rect& object1, Rect& object2)
{
	Mat first_frame, current_frame;
	surveillance_video.set(CV_CAP_PROP_POS_FRAMES,starting_frame);
	surveillance_video >> current_frame;
	first_frame = current_frame.clone();
	MedianBackground median_background1(current_frame, (float) 1.0025, 4);
	MedianBackground median_background2(current_frame, (float) 1.005, 4);
	Mat median_background_image1, median_foreground_image1;
	Mat median_background_image2, median_foreground_image2;

	double frame_rate = surveillance_video.get(CV_CAP_PROP_FPS);
	double time_between_frames = 1000.0/frame_rate;
	int frame_count = 0;

	double prev_area = 0;
	double curr_area = 0;
	double max_area = 0;

	bool current_frame_contains_contours = false;

	int frame_of_interest_num = 1;

	while ((!current_frame.empty()) && (frame_count++ < 1000))
    {
 		double duration = static_cast<double>(getTickCount());

		//Median Background Image Subtraction
		vector<Mat> input_planes(3);
		split(current_frame,input_planes);
		median_background1.UpdateBackground( current_frame );
		median_background2.UpdateBackground( current_frame );
		median_background_image1 = median_background1.GetBackgroundImage();
		median_background_image2 = median_background2.GetBackgroundImage();
		Mat median_difference;
		absdiff(median_background_image1,median_background_image2,median_difference);

		Mat gray_median_difference;
		cvtColor(median_difference, gray_median_difference, CV_BGR2GRAY);

		// Binary thresholding (manual)
		int current_threshold = 30;
		int max_threshold = 255;
		Mat binary_median_difference;
		threshold(gray_median_difference,binary_median_difference,current_threshold,max_threshold,THRESH_BINARY);

		//Closing and Opening (To remove noise)
		Mat closed_image;
		
		morphologyEx(binary_median_difference,closed_image,MORPH_CLOSE,Mat());
		morphologyEx(closed_image,binary_median_difference,MORPH_OPEN,Mat());

		//Connected Components
		vector<vector<Point>> contours;
		vector<Vec4i> hierarchy;
		Mat binary_median_difference_copy = binary_median_difference.clone();
		findContours(binary_median_difference_copy,contours,hierarchy,CV_RETR_TREE,CV_CHAIN_APPROX_NONE);
		Mat contours_median_difference = Mat::zeros(binary_median_difference.size(), CV_8UC3);

		for (int contour_number=0; (contour_number<(int)contours.size()); contour_number++)
		{
			Scalar colour(255,255,255);
			drawContours( contours_median_difference, contours, contour_number, colour, CV_FILLED, 8, hierarchy );
			prev_area = curr_area;
			curr_area = contourArea(contours[contour_number]);
			
			if (curr_area > max_area)
			{
				max_area = curr_area;
				//cout << max_area << endl;
				if (frame_of_interest_num == 1)
				{
					frame_of_interest_1 = frame_count;
					frame1 = current_frame.clone();
					object1 = boundingRect(contours[contour_number]);
				}
				else
				{
					frame_of_interest_2 = frame_count;
					frame2 = current_frame.clone();
					object2 = boundingRect(contours[contour_number]);
				}
			}

			current_frame_contains_contours = true;
		}
		if (prev_area != 0 && current_frame_contains_contours == false)
		{
			max_area = 0;
			prev_area = 0;
			curr_area = 0;
			//cout << "AREA RESET" << endl;
			if (frame_of_interest_num == 1)
				frame_of_interest_num = 2;
		}
		if (current_frame_contains_contours == true)
			current_frame_contains_contours = false;
		
		binary_median_difference = contours_median_difference.clone();

		duration = static_cast<double>(getTickCount())-duration;
		duration /= getTickFrequency()/1000.0;
		int delay = (time_between_frames>duration) ? ((int) (time_between_frames-duration)) : 1;
		char c = cvWaitKey(delay);
		
		char frame_str[100];
		sprintf( frame_str, "Frame = %d", frame_count);
		
		Mat temp_median_output = JoinImagesHorizontally(current_frame, frame_str, median_background_image1, "Median Background 1", 4 );
		Mat median_output = JoinImagesHorizontally(temp_median_output, frame_str, median_background_image2, "Median Background 2", 4 );
		
		imshow("Median Background Model", median_output);
		imshow("Connected Components Median Update Difference", contours_median_difference);
	 	surveillance_video >> current_frame;
	}
	cvDestroyAllWindows();
}

double dice_coefficient(Rect rect1, Rect rect2)
{
	Rect overlapRect = rect1 & rect2;
	double overlapArea = overlapRect.width*overlapRect.height;
	double rect1Area = rect1.width*rect1.height;
	double rect2Area = rect2.width*rect2.height;
	return (2*overlapArea)/(rect1Area + rect2Area);
}

double detection_time(int frame1, int frame2, int frame_rate)
{
	int frame_diff = abs(frame1 - frame2);
	return frame_diff/frame_rate;
}

int objectAbandoned(Mat frame_of_interest, Rect object_of_interest)
{
	Mat cropped_frame_of_interest = frame_of_interest(object_of_interest);

	int width = object_of_interest.width;
	int height = object_of_interest.height;

	Point top_left_roi = Point(object_of_interest.x, object_of_interest.y);
	Point bottom_right_roi = Point(object_of_interest.x + width, object_of_interest.y + height);

	Rect upper_background_region(top_left_roi.x, top_left_roi.y - height/2, width, height/2);
	Rect lower_background_region(top_left_roi.x, top_left_roi.y + height, width, height/2);
	Rect left_background_region(top_left_roi.x - width/2, top_left_roi.y - height/2, width/2, 2*height);
	Rect right_background_region(top_left_roi.x + width, top_left_roi.y - height/2, width/2, 2*height);

	Mat upper_frame_of_interest = frame_of_interest(upper_background_region);
	Mat lower_frame_of_interest = frame_of_interest(lower_background_region);
	Mat left_frame_of_interest = frame_of_interest(left_background_region);
	Mat right_frame_of_interest = frame_of_interest(right_background_region);

	Mat hls_cropped_frame_of_interest, hls_upper_frame_of_interest, hls_lower_frame_of_interest, hls_left_frame_of_interest, hls_right_frame_of_interest;
	
	cvtColor(cropped_frame_of_interest, hls_cropped_frame_of_interest, CV_BGR2HLS);
	cvtColor(upper_frame_of_interest, hls_upper_frame_of_interest, CV_BGR2HLS);
	cvtColor(lower_frame_of_interest, hls_lower_frame_of_interest, CV_BGR2HLS);
	cvtColor(left_frame_of_interest, hls_left_frame_of_interest, CV_BGR2HLS);
	cvtColor(right_frame_of_interest, hls_right_frame_of_interest, CV_BGR2HLS);

	ColourHistogram foreground_histogram(hls_cropped_frame_of_interest,4);
	ColourHistogram upper_histogram(hls_upper_frame_of_interest,4);
	ColourHistogram lower_histogram(hls_lower_frame_of_interest,4);
	ColourHistogram left_histogram(hls_left_frame_of_interest,4);
	ColourHistogram right_histogram(hls_right_frame_of_interest,4);

	MatND temp1, temp2, _background_histogram;

	add(upper_histogram.getHistogram(), lower_histogram.getHistogram(), temp1);
	add(left_histogram.getHistogram(), right_histogram.getHistogram(), temp2);
	add(temp1, temp2, _background_histogram);

	ColourHistogram background_histogram;
	background_histogram.mHistogram = _background_histogram;

	foreground_histogram.NormaliseHistogram();
	background_histogram.NormaliseHistogram();

	double matching_score = compareHist(background_histogram.getHistogram(),foreground_histogram.getHistogram(),CV_COMP_CORREL);
	//0.68 represents 1 standard deviation away from 0 correlation
	if (matching_score >= 0.68)
		return 0;

	return 1;
}

int main(int argc, const char** argv)
{
	char* file_location = "Media/";
	//Load videos
	char* video_files[] = { 
		"ObjectAbandonmentAndRemoval1.avi",
		"ObjectAbandonmentAndRemoval2.avi"};
	int number_of_videos = sizeof(video_files)/sizeof(video_files[0]);
	VideoCapture* video = new VideoCapture[number_of_videos];
	for (int video_file_no=0; (video_file_no < number_of_videos); video_file_no++)
	{
		string filename(file_location);
		filename.append(video_files[video_file_no]);
		video[video_file_no].open(filename);
		if( !video[video_file_no].isOpened() )
		{
			cout << "Cannot open video file: " << filename << endl;
			return -1;
		}
	}

	int frame_rate = 25;

	//Ground Truth Variables
	int ground_truth_frame_of_interest_1[2];
	int ground_truth_frame_of_interest_2[2];
	Point ground_truth_object_location_topleft[2];
	Point ground_truth_object_location_bottomright[2];
	Rect ground_truth_object[2];
	//Ground Truth for Abandonment(1)/Removal(0)
	int ground_truth_object_1_change_type[2];
	int ground_truth_object_2_change_type[2];

	//Video 1 Ground Truth
	ground_truth_frame_of_interest_1[0] = 183;
	ground_truth_frame_of_interest_2[0] = 509;
	ground_truth_object_location_topleft[0] = Point(356,208);
	ground_truth_object_location_bottomright[0] = Point(390,239);
	ground_truth_object[0] = Rect(ground_truth_object_location_topleft[0], ground_truth_object_location_bottomright[0]);
	ground_truth_object_1_change_type[0] = 1;
	ground_truth_object_2_change_type[0] = 0;

	//Video 2 Ground Truth
	ground_truth_frame_of_interest_1[1] = 215;
	ground_truth_frame_of_interest_2[1] = 551;
	ground_truth_object_location_topleft[1] = Point(287,261);
	ground_truth_object_location_bottomright[1] = Point(352,323);
	ground_truth_object[1] = Rect(ground_truth_object_location_topleft[1], ground_truth_object_location_bottomright[1]);
	ground_truth_object_1_change_type[1] = 1;
	ground_truth_object_2_change_type[1] = 0;

	//Testing Variables
	int frame_of_interest_1[2];
	int frame_of_interest_2[2];
	Mat frame_1[2];
	Mat frame_2[2];
	Rect object_1[2];
	Rect object_2[2];
	Point2i object1_location_topleft[2];
	Point2i object1_location_bottomright[2];
	Point2i object2_location_topleft[2];
	Point2i object2_location_bottomright[2];
	int object_1_change_type[2];
	int object_2_change_type[2];

	//Dice Coefficient Variables
	double dice_coefficient_object_1[2];
	double dice_coefficient_object_2[2];

	//Detection Time Variables
	double detection_time_object_1[2];
	double detection_time_object_2[2];

	for (int i=0; i<2; i++)
	{
		//Pass testing variables by reference, determine the location of the two objects of interest
		ObjectsOfInterest(video[i],0,frame_of_interest_1[i],frame_of_interest_2[i],frame_1[i],frame_2[i],object_1[i],object_2[i]);

		//Top left and bottom right points of first object in sequence
		object1_location_topleft[i].x = object_1[i].x;
		object1_location_topleft[i].y = object_1[i].y;
		object1_location_bottomright[i].x = object_1[i].x + object_1[i].width;
		object1_location_bottomright[i].y = object_1[i].y + object_1[i].height;
		//Top left and bottom right points of second object in sequence
		object2_location_topleft[i].x = object_2[i].x;
		object2_location_topleft[i].y = object_2[i].y;
		object2_location_bottomright[i].x = object_2[i].x + object_2[i].width;
		object2_location_bottomright[i].y = object_2[i].y + object_2[i].height;

		//Determine if object is abandoned or removed
		object_1_change_type[i] = objectAbandoned(frame_1[i], object_1[i]);
		object_2_change_type[i] = objectAbandoned(frame_2[i], object_2[i]);

		//Calculate Dice Coefficient For Both Objects
		dice_coefficient_object_1[i] = dice_coefficient(object_1[i], ground_truth_object[i]);
		dice_coefficient_object_2[i] = dice_coefficient(object_2[i], ground_truth_object[i]);

		//Calculate Detection Time For Both Objects
		detection_time_object_1[i] = detection_time(frame_of_interest_1[i], ground_truth_frame_of_interest_1[i], frame_rate);
		detection_time_object_2[i] = detection_time(frame_of_interest_2[i], ground_truth_frame_of_interest_2[i], frame_rate);

		//Output results
		cout << "Video: " << i+1 << endl;
		cout << "Object 1 Top left: " << object1_location_topleft[i] << endl << "Object 1 Bottom right: " << object1_location_bottomright[i] << endl;
		if (object_1_change_type[i] == ground_truth_object_1_change_type[i] && ground_truth_object_1_change_type[i] == 1)
			cout << "Object 1 Correctly Classified as Abandoned" << endl;
		else if (object_1_change_type[i] == ground_truth_object_1_change_type[i] && ground_truth_object_1_change_type[i] == 0)
			cout << "Object 1 Correctly Classified as Removed" << endl;
		else if (object_1_change_type[i] != ground_truth_object_1_change_type[i] && ground_truth_object_1_change_type[i] == 0)
			cout << "Object 1 Incorrectly Classified as Abandoned" << endl;
		else if (object_1_change_type[i] != ground_truth_object_1_change_type[i] && ground_truth_object_1_change_type[i] == 1)
			cout << "Object 1 Incorrectly Classified as Removed" << endl;
		cout << "Object 1 Dice Coefficient: " << dice_coefficient_object_1[i] << endl;
		cout << "Object 1 Detection Time: " << detection_time_object_1[i] << " seconds" << endl;
		cout << "Object 2 Top left: " << object2_location_topleft[i] << endl << "Object 2 Bottom right: " << object2_location_bottomright[i] << endl;
		if (object_2_change_type[i] == ground_truth_object_2_change_type[i] && ground_truth_object_2_change_type[i] == 1)
			cout << "Object 2 Correctly Classified as Abandoned" << endl;
		else if (object_2_change_type[i] == ground_truth_object_2_change_type[i] && ground_truth_object_2_change_type[i] == 0)
			cout << "Object 2 Correctly Classified as Removed" << endl;
		else if (object_2_change_type[i] != ground_truth_object_2_change_type[i] && ground_truth_object_2_change_type[i] == 0)
			cout << "Object 2 Incorrectly Classified as Abandoned" << endl;
		else if (object_2_change_type[i] != ground_truth_object_2_change_type[i] && ground_truth_object_2_change_type[i] == 1)
			cout << "Object Incorrectly Classified as Removed" << endl;
		cout << "Object 2 Dice Coefficient: " << dice_coefficient_object_2[i] << endl;
		cout << "Object 2 Detection Time: " << detection_time_object_2[i] << " seconds" << endl;
		cout << endl;

		//Display frames
		char frame_1_str[100];
		char frame_2_str[100];
		sprintf(frame_1_str, "Video: %d, Frame Of Interest #1 = %d", i+1, frame_of_interest_1[i]);
		sprintf(frame_2_str, "Video: %d, Frame Of Interest #2 = %d", i+1, frame_of_interest_2[i]);
		rectangle(frame_1[i], object1_location_topleft[i], object1_location_bottomright[i], Scalar(0,0,255), 1, 8, 0);
		imshow(frame_1_str, frame_1[i]);
		rectangle(frame_2[i], object2_location_topleft[i], object2_location_bottomright[i], Scalar(0,0,255), 1, 8, 0);
		imshow(frame_2_str, frame_2[i]);
	}

	char c = cvWaitKey();
    cvDestroyAllWindows();
}  