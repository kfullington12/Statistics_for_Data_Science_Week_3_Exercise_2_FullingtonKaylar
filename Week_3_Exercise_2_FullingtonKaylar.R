library(ggplot2)
community_survey_df = read.csv("acs-14-1yr-s0201.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
summary(community_survey_df)
str(community_survey_df)
nrow(community_survey_df)
ncol(community_survey_df)
HSDegree_Histogram = ggplot(community_survey_df, aes(x = HSDegree)) + geom_histogram(bins = 10) + ggtitle("High School Degrees") + xlab("% of Population with High School Degree") + ylab("Frequency")
# Is the data distrubtion unimodel?
# Yes, it is unimodal. The peak of the distribution occurs at around the 80% level
# Is it approximately symmetrical?
# No, the histogram is not symmetrical - one side is higher than the other side
# Is it approximately bell-shaped?
# It is sort of bell-shaped, except that there's a very sharp drop-off on the right side of the graph after a large peak
# Is it approximately normal?
# No, it is not.
# If not normal, is the distribution skewed? If so, in which direction?
# Yes, it is skewed left
# Include a normal curve to the Histogram you plotted
HSDegree_Histogram = ggplot(community_survey_df, aes(x = HSDegree)) + geom_histogram(aes(y = ..density..), bins = 10) + ggtitle("High School Degrees") + xlab("% of Population with High School Degree") + ylab("Frequency") + stat_function(fun = dnorm, args = list(mean = mean(community_survey_df$HSDegree, na.rm = TRUE), sd = sd(community_survey_df$HSDegree, na.rm = TRUE)))
# Explain whether a normal distribution can accurately be used as a model for this data.
# The normal curve that was applied to the graph in the previous task shows a relatively accurate representation of 
# the data and how it is skewed left
HSDegree_Prob_Plot = qplot(sample = community_survey_df$HSDegree, stat = "qq")
# Based on what you see in this probability plot, is the distribution approximately normal? Explain how you know.
# The distribution is not normal and is skewed left - this is because the line of points is not straight and symmetrical, but curved.
# If not normal, is the distribution skewed? If so, in which direction? Explain how you know.
# Yes, the distribution is skewed left - this is because the curve of the points is upward like the top of a hill. If it were more like a valley, that would imply right skew and if it were a straight slope it would imply normal distribution
library("pastecs")
HSDegree_Num_Describe = stat.desc(community_survey_df$HSDegree, basic = TRUE, norm = TRUE)
# In several sentences provide an explanation of the result produced for skew, kurtosis, and z-scores. In addition, explain how a change in the sample size may change your explanation?
# The data is skewed left because these days the majority of Americans have high school degrees. It wouldn't make much sense for a community to have an extremely low number of people with that degree. A change in sample size could influence the results, but really only if it included many people outside of the US in developing countries. This data could be considered leptokurtic, because there is a sharp tail on the left side (showing the small number of communities with low rates of high school graduation). The data also have a sharp drop off after the 80% range. Most of the z-scores of a given data point are going to be fairly close to the mean, given the concentration of data around the 70 to 80% range. Only some data points will have negative scores.
