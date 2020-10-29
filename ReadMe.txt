Web Usage Mining is the application of data mining techniques to discover interesting usage patterns from Web data in order to understand and better serve the needs of Web-based applications.
Usage data captures the identity or origin of Web users along with their browsing behavior at a Web site.

====
This matrix shows an example of predicting of the user's browsing preference using collaborative filtering. At first, people brows in different website. Each time a user brows a website, the number in the matrix will plus one, which means that this person have already browse.  After that, the system is making predictions about user's preference for an URL, which the user hasn't browse yet. These predictions are built upon the existing browsing history of other users, who have similar preference (namely the browsing number) with the active user. For instance, in this case the system are able to make a prediction that User 1 has the similar preference with User 3 because they have the same browsing history , so the system will think User 1 may have interest in the content of URL 3 because User 3 has the browsing history.
Collaborative filtering 
Look for users who share the same  browsing history with the active user (the user whom the prediction is for). and Use the browsing history from those like-minded users found in step 1 to calculate a prediction for the active user
====
Then let's talk about the process.
The first thing is to collect the raw data and remove the dirty data, Nomorlly in log files, failure codes are 403, 401 and 404 and they respectively imply the request that is forbidden to a confined subdirectory, authentication failure and the undetected file, These are irrelevant data and should be removed.

====

Then we get a scatter plot like this figure

the horizontal axis refers to USER, the vertical axis refers to WEB

the point in the figure means, someone has a browsing history in one website, but it doesn's reflect how many times this user has browsed this web.

====



Then we use K-means Clustering and set K equals to 10 and get the figure like this. the horizontal axis refers to USER, the vertical axis refers to WEB

We can see that event though some website with a little browsing history can be clustered in one of the clustering.

If the website has no browsing history,  this website belongs to no clustering. 
=======
Then we use DBSCAN Clustering Algorithm to cluster the point and get the figure like this,  the horizontal axis refers to WEb, the vertical axis refers to User

because we store the IP address as Natural number, so the distance of adjacent IP is 1, thus the radius of the circle should bigger than 1.

if the radius less than 1, the clustering result is useless.

=========
On the other hand, we focus on browsing history of each websit

this figure shows the broswing history of each website

the horizontal axis refers to the URL of the web site, the vertical axis refers to the quantity of browsing history.

We notice that many website have no browsing history, a few website has a plenty of browsing history, which means people prefer to brows the specific website but seldom to brows some website which other people also doesn't like.
===============
Base on these data, we can get our user-web matrix, as the figure shows,  
each unique IP and URL has the quantity of browsing history.

we see that the URL with number of ¡°161¡±has the most browsing history, thus in the left hand figure, it is on the top of the decresing column, in the figure on the bottom of the page, this URL is darker than other URL, which means it has the most browsing history.
