# ekf
An Extended Kalman Filter used for estimation and localization, including outlier detection mode and track simulation.

Done for an applied estimation course at KTH.

# Instructions

The file runlocalization track.m  is the entrance function. This function reads two ﬁles determined by simoutﬁle and mapﬁle input arguments which contain information about sensor readings and the map of the environment respectively, runs a loop for all the
sensor readings and calls the ekf localize.m to perform one iteration of EKF localization on the readings and plots the estimation(red)/ground truth(green)
and odometry(blue) information. 

The verbose parameter determines the verbose level (0= no visual output and bigger values correspond to more visual
information).

The ekf localize.m is responsible to perform the EKF localization (lol). 

You can use the USE KNOWN ASSOCIATIONS parameter for de-
bugging purposes and USE BATCH UPDATE to determine if the ﬁlter shouldwork in the batch mode or in the sequential mode.

An example command to run your code on the map "map o3.txt" and sensor readings "so o3 ie.txt" is:

runlocalization track(’so o3 ie.txt’, ’map o3.txt’, 1, 1, 1, 2);

The trajectory plot is color coded by red= estimated, green=true, and blue=
odometry. Often the red is mostly covered by the green and thus not very
visible.

# How I use it

In the project, I run certain data sets under certain conditions:

1. map o3.txt + so o3 ie.txt:

In this data set, the laser scanner has an
accuracy of (1 cm,1 degree), the odometry information has an un-modeled
noise of approximately 1 cm and 1 degree per time step. The resulting mean
absolute error of your estimations should be less than 0.01 on all dimensions.

2. map pent big 10.txt + so pb 10 outlier.txt: 

In this data set, there are certain outliers that need to be detected(and rejected). The measurements have undergone a white Gaussian with the standard deviation of
0.2(m,rad). You can see how this noise aﬀects the measurements by setting the verbose ﬂag of runlocalization track to 3. The resulting mean absolute error of your estimations should be
less than 0.06 on all dimensions.

3. map pent big 40.txt + so pb 40 no.txt: 

This data set does not include any odometry information and therefore, we should compensate for
it by considering a big standard deviation for the process noise. Model the
measurement noise with a standard deviation of 0.1(m,rad), the process
noise with a standard deviation of 1(m,m,rad) and set δ M to 1 to disable
the outlier detection. Run your algorithm on the data set using 1) the
sequential update algorithm, 2) the batch update algorithm. You should be able to see a sensible diﬀerence between the results of the two algorithms with mean absolute error of the
batch update algorithm being less than 0.1 on all dimensions.
