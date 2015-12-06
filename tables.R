%%%%%%%%%%%% Tables %%%%%%%%%%%%
  \newpage\section{Tables}
% Descriptive Statistics
\subsection{Descriptive Statistics}
%
%% Sibling in Sample Summary Stats
%%% Gen 1
\begin{longtable}{@{\extracolsep{5pt}}lcccccc}
\caption{Gen1 Summary Statistics by Sibling Status.}\label{table_summary_stats_sibinsampleg1}
\partialinput{2}{10}{../Common/content/tables/table_summary_stats_sibinsampleg1.tex}
\end{longtable}\linebreak
%%%
%%% Gen 2
\begin{longtable}{@{\extracolsep{5pt}}lcccccc}
\caption{Gen2 Summary Statistics by Sibling Status.}\label{table_summary_stats_sibinsampleg2}
\partialinput{2}{10}{../Common/content/tables/table_summary_stats_sibinsampleg2.tex}
\end{longtable}\pagebreak
%%
  %% AFI by Gender, Race, and Gender by Race
\npnoround
\begin{longtable}{@{\extracolsep{5pt}}lllcc}
\caption{Gen2 Mean AFI by Gender, Race, and Gender by Race.}\label{table_afi_race_gender}
\partialinput{2}{18}{../Common/content/tables/table_summary_stats_AFIRACEGENDER.tex}
\end{longtable}\pagebreak
%%
  % Measurement
\subsection{Measurement}
%%
  %% Age 9
%%% Measurement Model
\begin{longtable}{@{\extracolsep{5pt}}cc} 
\caption{Gen2 Measurement Model.}\label{table_gen2measurement_9}
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
& g at Age 9.5 \\ 
\hline \\[-1.8ex] 
\partialinput{12}{34}{../Common/content/tables/table_g2_9measurement.tex}
\end{longtable}\pagebreak
%%%
%%% Factor Loadings
\begin{longtable}{@{\extracolsep{5pt}}cccccc} 
\caption{Gen2 Factor Loadings.}\label{table_g2loading_9}
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
& Test & Estimate & S.E. & Est./.S.E. & P.Value \\  
\hline \\[-1.8ex] 
\partialinput{12}{17}{../Common/content/tables/table_g2loading_9.tex}
\end{longtable}\pagebreak
%
% Difference Scores
\subsection{Difference Scores}
%
%% AFI
%%% AFI Test-Retest Gen 1
\begin{minipage}{\linewidth}
\begin{longtable}{@{\extracolsep{5pt}}rlll} \caption{Correlation of Gen1 Self-Reported AFI Across 1983-1985 }\label{table_measurement_trt_g1afi}
\partialinput{6}{12}{../Common/content/tables/table_ttafireliable_z.tex}
\end{longtable}
\linebreak
%%%
%%% AFI Sibling Differences
\begin{longtable}{@{\extracolsep{5pt}}rlll} \caption{Correlation of Gen1 Sibling Differences in Self-Reported AFI across 1983-1985 (Standardized by Gender)}\label{table_measurement_diffafireliable_z.tex}
\partialinput{6}{12}{../Common/content/tables/table_diffafireliable_z.tex}
\end{longtable}
%%
  %% Intelligence
%%% Test-retest Gen 2 intelligence
\begin{longtable}{@{\extracolsep{5pt}}rlll} \caption{Correlation of Gen2 Aggregated Intelligence across Ages 9.5, 10.5, 11.5 }\label{table_measurement_trt_g2int}
\partialinput{6}{12}{../Common/content/tables/table_ttintreliable_z.tex}
\end{longtable}\end{minipage}
\pagebreak
\newpage
%%%
%%% Cousin Difference Scores Gen 2 intelligence
%%%% First Born Child
\begin{minipage}{\linewidth}
\begin{longtable}{@{\extracolsep{5pt}}rlll} \caption{Correlation of Gen2 First Born Cousin Differences in Intelligence across Ages 9.5-11.5}\label{table_measurement_diffintreliable_z}
\partialinput{6}{12}{../Common/content/tables/table_diffintreliable_z.tex}
\end{longtable}
%%%%
  %%%% First Born Daughter
\begin{longtable}{@{\extracolsep{5pt}}rlll} \caption{Correlation of Gen2 First Female Cousin Differences in Intelligence across Ages 9.5-11.5}\label{table_measurement_diffintreliable_g}
\partialinput{6}{12}{../Common/content/tables/table_diffintreliable_g.tex}
\end{longtable}
%%%%
  %%%% First Born Son
\begin{longtable}{@{\extracolsep{5pt}}rlll} \caption{Correlation of Gen2 First Male Cousin Differences in Intelligence across Ages 9.5-11.5}\label{table_measurement_diffintreliable_b}
\partialinput{6}{12}{../Common/content/tables/table_diffintreliable_b.tex}
\end{longtable}\end{minipage}
\pagebreak
%
% Between Family Analyses
\begin{landscape}
\subsection{Between Family Analyses}
%%
  %% Mom -> Child
\begin{longtable}{@{\extracolsep{5pt}}lccc} 
\caption{Gen1 Mean Intelligence $\rightarrow$ Gen2 Mean AFI}\label{table_Mean_Mom_Intelligence_Mean_Child_AFI_9}
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
& \multicolumn{3}{c}{\textit{Dependent variable:} Average of Gen2 AFI} \\ 
\cline{2-4}
\partialinput{10}{22}{../Common/content/tables/table_Mean_Mom_Intelligence_Mean_Child_AFI_9.tex}
\end{longtable}\pagebreak
%%
  %% Child -> Child
\begin{longtable}{@{\extracolsep{5pt}}lccc} 
\caption{Gen2 Mean Intelligence $\rightarrow$ Gen2 Mean AFI}\label{table_Mean_Child_Intelligence_Mean_Child_AFI_9}
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
& \multicolumn{3}{c}{\textit{Dependent variable:} Average of Gen2 AFI} \\ 
\cline{2-4}
\partialinput{10}{22}{../Common/content/tables/table_Mean_Child_Intelligence_Mean_Child_AFI_9.tex}
\end{longtable}\pagebreak
%%
  %% Mom Child -> Child
\begin{longtable}{@{\extracolsep{5pt}}lccc} 
\caption{Mean Joint Intelligence $\rightarrow$ Gen2 Mean AFI}\label{table_Mean_Joint_Intelligence_Mean_Child_AFI_9}
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
& \multicolumn{3}{c}{\textit{Dependent variable:} Average of Gen2 AFI} \\ 
\cline{2-4}
\partialinput{10}{23}{../Common/content/tables/table_Mean_Joint_Intelligence_Mean_Child_AFI_9.tex}
\end{longtable}\pagebreak
%
% Within Family Analyses
\subsection{Within Family Analyses}
%%
  %% Mom -> Child
\begin{longtable}{@{\extracolsep{5pt}}lccc} 
\caption{Gen1 Dif Intelligence $\rightarrow$ Gen2 Dif AFI}\label{table_Dif_Mom_Intelligence_Dif_Child_AFI_9}
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
& \multicolumn{3}{c}{\textit{Dependent variable:} Differences in Gen2 Mean AFI} \\ 
\cline{2-4}
\partialinput{10}{24}{../Common/content/tables/table_Dif_Mom_Intelligence_Dif_Child_AFI_9.tex}
\end{longtable}\pagebreak
%%
  %% Child -> Child
\begin{longtable}{@{\extracolsep{5pt}}lccc} 
\caption{Gen2 Dif Intelligence $\rightarrow$ Gen2 Dif AFI}\label{table_Dif_Child_Intelligence_Dif_Child_AFI_9}
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
& \multicolumn{3}{c}{\textit{Dependent variable:} Differences in Gen2 Mean AFI} \\ 
\cline{2-4}
\partialinput{10}{24}{../Common/content/tables/table_Dif_Child_Intelligence_Dif_Child_AFI_9.tex}
\end{longtable}\pagebreak
%%
  %% Mom Child -> Child
\begin{longtable}{@{\extracolsep{5pt}}lccc} 
\caption{Dif Joint Intelligence $\rightarrow$ Gen2 Dif AFI}\label{table_Dif_Joint_Intelligence_Dif_Child_AFI_9}
\\[-1.8ex]\hline 
\hline \\[-1.8ex] 
& \multicolumn{3}{c}{\textit{Dependent variable:} Differences in Gen2 Mean AFI} \\ 
\cline{2-4}
\partialinput{10}{26}{../Common/content/tables/table_Dif_Joint_Intelligence_Dif_Child_AFI_9.tex}
\end{longtable}\end{landscape}

%%%%%%%%%%%% Figures %%%%%%%%%%%%
  \section{Figures}
\begin{center}
\captionof{figure}{Smoothed Density Plots of AFI by Sex and Race}
\label{plot_afi_by_race_sex}
<<plot_afi_by_race_sex,fig=TRUE,echo=FALSE,cache=TRUE,echo=FALSE, fig.height=5*.6, fig.width=5,out.width=".8\\paperwidth",warning=FALSE>>=
  # Color Blind Palette 
  cbbPalette <- c("#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7","#000000")
  # Data Prep
  dataframe<-data.frame(Gen2AFIConcor_2,Gen2AFIConcor$Intel_G2)
  names(dataframe)<- c("CASEID","MCASEID","RACE","SEX","AFI","Intel")
  
  ## Race by Sex factor
  dataframe$RACEbySEX<-"0"
  ###
  ### Hispanic
  #### Male
  dataframe$RACEbySEX[dataframe$RACE=='Hispanic' & dataframe$SEX=='Male']<-"Hispanic Male"
  ####
  #### Female
  dataframe$RACEbySEX[dataframe$RACE=='Hispanic'&dataframe$SEX=='Female']<-"Hispanic Female"
  ###
  ### Black
  #### Male
  dataframe$RACEbySEX[dataframe$RACE=='Black'&dataframe$SEX=='Male']<-"Black Male"
  ####
  #### Female
  dataframe$RACEbySEX[dataframe$RACE=='Black'&dataframe$SEX=='Female']<-"Black Female"
  ###
  ### Non-Black, Non-Hispanic
  #### Male
  dataframe$RACEbySEX[dataframe$RACE=='Non-Black, Non-Hispanic'&dataframe$SEX=='Male']<-"White Male"
  ####
  #### Female
  dataframe$RACEbySEX[dataframe$RACE=='Non-Black, Non-Hispanic'&dataframe$SEX=='Female']<-"White Female"
  ###
  ### Unknown Race
  dataframe$RACEbySEX[dataframe$RACEbySEX=='0']<-"Unknown"
  dataframe$RACE<-revalue(dataframe$RACE, c("Non-Black, Non-Hispanic"="White"))
  #summary(as.factor(dataframe$RACEbySEX))
  
  ggplot(dataframe, aes(x=AFI, colour=RACE, group=RACEbySEX, linetype = SEX))+ geom_density(fill=NA,adjust=2)+ theme_bw() + theme(axis.text=element_text(size=10), axis.title=element_text(size=12), plot.title=element_text(size=12)) +  theme(legend.position="right",  legend.justification=c(1, 0.5)) +   xlab("AFI") + ylab("Density") +scale_colour_manual(values= c("#56B4E9", "#009E73", "#CC79A7")) + coord_cartesian(ylim=c(0,0.30), xlim=c(12,25))
  @
    \end{center}
  \pagebreak
  %
  \begin{center}
  <<plot_corplotmatrix_within,fig=TRUE,echo=FALSE,cache=TRUE,fig.height=7*.6, fig.width=7,out.width="1.1\\paperwidth",warning=FALSE>>=
    # Croat Cor Matrix Plot for Between Family and Sibling Effects
    dataframe<- LinkedMDAN_discord_AFI_z_9
  C<-dataframe[,c(8,13,23,24,26,31,41,42)]#,56,57,66,67,70,71
  ##
  ## Rename variables
  names(C)<-c("Intel_Mom_1","AFI_Mom_1","AFI_Kid_1","Intel_Kid_1","Intel_Mom_2","AFI_Mom_2","AFI_Kid_2","Intel_Kid_2")
  ##
  ## Reorder Variables
  C<-C[c("Intel_Mom_1","Intel_Mom_2","Intel_Kid_1","Intel_Kid_2","AFI_Mom_1","AFI_Mom_2","AFI_Kid_1","AFI_Kid_2")]
  ##
  ## Plot
  corrplot(Cor(C), method = "ellipse",type="lower",tl.col="black")
  @
    \captionof{figure}{Within Family Correlations}
  \label{plot_within}
  \end{center}
  \pagebreak
  %
  \begin{center}
  <<plot_corplotmatrix_between,fig=TRUE,echo=FALSE,cache=TRUE, fig.height=7*.6, fig.width=7,out.width="1.1\\paperwidth",warning=FALSE>>=
    # Create Cor Matrix Plot for Between Family and Sibling Effects
    dataframe<- LinkedMDAN_discord_AFI_z_9
  C<-dataframe[,c(56,57,66,67,70,71,89,90)]
  ##
  ## Rename variables
  names(C)<-c("AFI_Mom_diff","AFI_Mom_mean","Intel_Mom_diff","Intel_Mom_mean","AFI_Kid_diff","AFI_Kid_mean","Intel_Kid_mean","Intel_Kid_diff")
  ##
  ## Reorder Variables
  C<-C[c("Intel_Mom_mean","Intel_Mom_diff","Intel_Kid_mean","Intel_Kid_diff","AFI_Mom_mean","AFI_Mom_diff","AFI_Kid_mean","AFI_Kid_diff")]
  ##
  ## Plot
  corrplot(Cor(C), method = "ellipse",type="lower",tl.col="black")
  @
    \captionof{figure}{Between Family Correlations}
  \label{plot_between}
  \end{center}
  \pagebreak
  
  \begin{center}
  <<plot_spaghetti,fig=TRUE,echo=FALSE,cache=TRUE, fig.height=7, fig.width=7,out.width=".8\\paperwidth",warning=FALSE>>=
    # Plot Set up
    mytheme <- theme_classic() %+replace% 
    theme(axis.title.x = element_text(face="bold",angle=0), 
          axis.title.y = element_text(face="bold",angle=90)) 
  # Data Set Up
  dataframe<- LinkedMDAN_discord_AFI_z_9
  C<-dataframe[,c(2,8,13,23,24,26,31,41,42)]#,56,57,66,67,70,71
  ##
  ## Rename variables
  names(C)<-c("ID","Intel_Mom_1","AFI_Mom_1","AFI_Kid_1","Intel_Kid_1","Intel_Mom_2","AFI_Mom_2","AFI_Kid_2","Intel_Kid_2")
  ##
  ## Reorder Variables
  C<-C[c("ID","Intel_Mom_1","Intel_Mom_2","Intel_Kid_1","Intel_Kid_2","AFI_Mom_1","AFI_Mom_2","AFI_Kid_1","AFI_Kid_2")]
  
  C2<-C
  names(C2)<-c("ID","Intel_Mom_2","Intel_Mom_1","Intel_Kid_2","Intel_Kid_1","AFI_Mom_2","AFI_Mom_1","AFI_Kid_2","AFI_Kid_1")
  C2<-C2[c("ID","Intel_Mom_1","Intel_Mom_2","Intel_Kid_1","Intel_Kid_2","AFI_Mom_1","AFI_Mom_2","AFI_Kid_1","AFI_Kid_2")]
  
  Stack<-rbind(C,C2)
  
  Stack$slope <- (Stack$AFI_Kid_2-Stack$AFI_Kid_1)/(Stack$Intel_Kid_2-Stack$Intel_Kid_1)
  Stack$slopebinary<- as.numeric(NA)
  Stack$slopebinary[Stack$slope>0]<- 1
  Stack$slopebinary[Stack$slope<0]<- -1
  Stack$slopebinary[Stack$slope==0]<- 0
  Stack$slopebinary<-factor(Stack$slopebinary, levels=c("1", "0", "-1"), labels=c("Positive", "Zero", "Negative"))
  Stack2<-Stack[,c(1,2,4,6,8,11)]
  
  Stack3<-Stack2
  ### Generate within vs. between slopes
  
  x <- rep(-5:5, length=233)
  
  
  btwn <- Cor(data.frame(Stack2$AFI_Kid_1,Stack2$Intel_Kid_1))[1,2] * x 
  
  within <- Mean(Stack$slope)* x
  within2 <- Median(Stack$slope)* x
  df <- data.frame(x, y=btwn)
  
  # create a copy of original data, but set y = x
  # this data will be used for the one-to-one line
  df2 <- data.frame(x, y=within)
  df22 <- data.frame(x, y=within2)
  # bind original and 'one-to-one data' together
  df3 <- rbind.data.frame(df, df2, df22)
  
  # create a grouping variable to separate stat_smoothers based on original and one-to-one data 
  df3$grp <- as.factor(rep(1:3, each = nrow(df)))
  
  df3$grp<-factor(df3$grp, levels=c("1", "2", "3"), labels=c("Between Family Slope", "Within Family Slope (mean)", "Within Family Slope (median)"))
  df3=df3[1:698,]
  # If you rather want to stack the two keys in the legend you can add:
  # guide = guide_legend(direction = "vertical")
  #...as argument in scale_colour_manual
  p1 <- ggplot(data = Stack2, aes(x = Intel_Kid_1, y = AFI_Kid_1, group = ID, color=slopebinary )) +
    mytheme + scale_colour_manual(name = "Within Family \nSlope",values= c("#56B4E9", "#009E73", "#CC79A7")) +
    labs(list(title = "Gen2. Within Family Spaghetti Plot of \nAFI by Intelligence", y = "Gender Standardized AFI", x = "Standardized Intelligence")) + 
    geom_line(size=1,alpha=0.4)  + theme(legend.position="right",  legend.justification=c(1, 0.5)) + coord_cartesian(xlim = c(Min(Stack2$Intel_Kid_1),Max(Stack2$Intel_Kid_1) ),ylim = c(Min(Stack2$AFI_Kid_1),Max(Stack2$AFI_Kid_1)))  +
    stat_smooth(aes(x = df3$x, y = df3$y, group = df3$grp, linetype=df3$grp), method = "lm", se = FALSE, size = 1) + scale_linetype_manual(name = "Slopes",values=c("solid","twodash", "dotted")) 
  
  p1 #+
  # geom_smooth(method = "lm", se = FALSE, size = 1)
  
  @
    \captionof{figure}{Spaghetti Plot. The mean Within-Family Slope is \Sexpr{Mean(Stack$slope)}; the median Within-Family Slope is \Sexpr{Median(Stack$slope)}}
  \label{plot_spaghetti}
  \end{center}
  %
  %%%%%%%%%%%% Appendix %%%%%%%%%%%%
    \appendix\label{appen}
  %
  % Age 10.5 Replication
  \section{Age 10.5 Replication}\label{appen10}
  %% Between Family
  \begin{landscape}
  \subsection{Between Family Analyses}
  %%%
  %%% Mom -> Child
  \begin{longtable}{@{\extracolsep{5pt}}lccc} 
  \caption{Mean Gen1 Mean Intelligence $\rightarrow$ Gen2 Mean AFI}\label{table_Mean_Mom_Intelligence_Mean_Child_AFI_10}
  \\[-1.8ex]\hline 
  \hline \\[-1.8ex] 
  & \multicolumn{3}{c}{\textit{Dependent variable:} Average of Gen2 AFI} \\ 
  \cline{2-4}
  \partialinput{10}{22}{../Common/content/tables/table_Mean_Mom_Intelligence_Mean_Child_AFI_10.tex}
  \end{longtable}\pagebreak
  %%%
  %%% Child -> Child
  \begin{longtable}{@{\extracolsep{5pt}}lccc} 
  \caption{Gen2 Mean Intelligence $\rightarrow$ Gen2 Mean AFI}\label{table_Mean_Child_Intelligence_Mean_Child_AFI_10}
  \\[-1.8ex]\hline 
  \hline \\[-1.8ex] 
  & \multicolumn{3}{c}{\textit{Dependent variable:} Average of Gen2 AFI} \\ 
  \cline{2-4}
  \partialinput{10}{22}{../Common/content/tables/table_Mean_Child_Intelligence_Mean_Child_AFI_10.tex}
  \end{longtable}\pagebreak
  %%%
  %%% Mom Child -> Child
  \begin{longtable}{@{\extracolsep{5pt}}lccc} 
  \caption{Mean Joint Intelligence $\rightarrow$ Gen2 Mean AFI}\label{table_Mean_Joint_Intelligence_Mean_Child_AFI_10}
  \\[-1.8ex]\hline 
  \hline \\[-1.8ex] 
  & \multicolumn{3}{c}{\textit{Dependent variable:} Average of Gen2 AFI} \\ 
  \cline{2-4}
  \partialinput{10}{23}{../Common/content/tables/table_Mean_Joint_Intelligence_Mean_Child_AFI_10.tex}
  \end{longtable}\pagebreak
  %%
    %% Within Family
  \subsection{Within Family Analyses}
  %%%
  %%% Mom -> Child
  \begin{longtable}{@{\extracolsep{5pt}}lccc} 
  \caption{Gen1 Dif Intelligence $\rightarrow$ Gen2 Dif AFI}\label{table_Dif_Mom_Intelligence_Dif_Child_AFI_10}
  \\[-1.8ex]\hline 
  \hline \\[-1.8ex] 
  & \multicolumn{3}{c}{\textit{Dependent variable:} Difference in Gen2 Mean AFI} \\ 
  \cline{2-4}
  \partialinput{10}{24}{../Common/content/tables/table_Dif_Mom_Intelligence_Dif_Child_AFI_10.tex}
  \end{longtable}\pagebreak
  %%%
  %%% Child -> Child
  \begin{longtable}{@{\extracolsep{5pt}}lccc} 
  \caption{Gen2 Dif Intelligence $\rightarrow$ Gen2 Dif AFI}\label{table_Dif_Child_Intelligence_Dif_Child_AFI_10}
  \\[-1.8ex]\hline 
  \hline \\[-1.8ex] 
  & \multicolumn{3}{c}{\textit{Dependent variable:} Difference in Gen2 Mean AFI} \\ 
  \cline{2-4}
  \partialinput{10}{24}{../Common/content/tables/table_Dif_Child_Intelligence_Dif_Child_AFI_10.tex}
  \end{longtable}\pagebreak
  %%%
  %%% Mom Child -> Child
  \begin{longtable}{@{\extracolsep{5pt}}lccc} 
  \caption{Joint Dif Intelligence $\rightarrow$ Gen2 Dif AFI}\label{table_Dif_Joint_Intelligence_Dif_Child_AFI_10}
  \\[-1.8ex]\hline 
  \hline \\[-1.8ex] 
  & \multicolumn{3}{c}{\textit{Dependent variable:} Difference in Gen2 Mean AFI} \\ 
  \cline{2-4}
  \partialinput{10}{26}{../Common/content/tables/table_Dif_Joint_Intelligence_Dif_Child_AFI_10.tex}
  \end{longtable}
  \end{landscape}
  %
  % Age 11.5 Replication
  \section{Age 11.5 Replication}\label{appen11}
  %% Measurement
  %%% Measurement Model
  \begin{longtable}{@{\extracolsep{5pt}}cc} 
  \caption{Gen2 Measurement Model.}\label{table_gen2measurement_11}
  \\[-1.8ex]\hline 
  \hline \\[-1.8ex] 
  & g at Age 11.5 \\ 
  \hline \\[-1.8ex] 
  \partialinput{12}{34}{../Common/content/tables/table_g2_11measurement.tex}
  \end{longtable}\pagebreak
  %%%
  %%% Factor Loadings
  \begin{longtable}{@{\extracolsep{5pt}}cccccc} 
  \caption{Gen2 Factor Loadings.}\label{table_g2loading_11}
  \\[-1.8ex]\hline 
  \hline \\[-1.8ex] 
  & Test & Estimate & S.E. & Est./.S.E. & P.Value \\  
  \hline \\[-1.8ex] 
  \partialinput{12}{17}{../Common/content/tables/table_g2loading_11.tex}
  \end{longtable}\pagebreak
  %%
    %% Between Family
  \begin{landscape}
  \subsection{Between Family Analyses}
  %%%
  %%% Mom -> Child
  \begin{longtable}{@{\extracolsep{5pt}}lccc} 
  \caption{Mean Gen1 Mean Intelligence $\rightarrow$ Gen2 Mean AFI}\label{table_Mean_Mom_Intelligence_Mean_Child_AFI_11}
  \\[-1.8ex]\hline 
  \hline \\[-1.8ex] 
  & \multicolumn{3}{c}{\textit{Dependent variable:} Average of Gen2 AFI} \\ 
  \cline{2-4}
  \partialinput{10}{22}{../Common/content/tables/table_Mean_Mom_Intelligence_Mean_Child_AFI_11.tex}
  \end{longtable}\pagebreak
  %%%
  %%% Child -> Child
  \begin{longtable}{@{\extracolsep{5pt}}lccc} 
  \caption{Gen2 Mean Intelligence $\rightarrow$ Gen2 Mean AFI}\label{table_Mean_Child_Intelligence_Mean_Child_AFI_11}
  \\[-1.8ex]\hline 
  \hline \\[-1.8ex] 
  & \multicolumn{3}{c}{\textit{Dependent variable:} Average of Gen2 AFI} \\ 
  \cline{2-4}
  \partialinput{10}{22}{../Common/content/tables/table_Mean_Child_Intelligence_Mean_Child_AFI_11.tex}
  \end{longtable}\pagebreak
  %%%
  %%% Mom Child -> Child
  \begin{longtable}{@{\extracolsep{5pt}}lccc} 
  \caption{Mean Joint Intelligence $\rightarrow$ Gen2 Mean AFI}\label{table_Mean_Joint_Intelligence_Mean_Child_AFI_11}
  \\[-1.8ex]\hline 
  \hline \\[-1.8ex] 
  & \multicolumn{3}{c}{\textit{Dependent variable:} Average of Gen2 AFI} \\ 
  \cline{2-4}
  \partialinput{10}{23}{../Common/content/tables/table_Mean_Joint_Intelligence_Mean_Child_AFI_11.tex}
  \end{longtable}\pagebreak
  %%
    %% Within Family
  \subsection{Within Family Analyses}
  %%%
  %%% Child -> Child
  \begin{longtable}{@{\extracolsep{5pt}}lccc} 
  \caption{Gen1 Dif Intelligence $\rightarrow$ Gen2 Dif AFI}\label{table_Dif_Mom_Intelligence_Dif_Child_AFI_11}
  \\[-1.8ex]\hline 
  \hline \\[-1.8ex] 
  & \multicolumn{3}{c}{\textit{Dependent variable:} Differences in Gen2 Mean AFI} \\ 
  \cline{2-4}
  \partialinput{10}{24}{../Common/content/tables/table_Dif_Mom_Intelligence_Dif_Child_AFI_11.tex}
  \end{longtable}\pagebreak
  %%%
  %%% Child -> Child
  \begin{longtable}{@{\extracolsep{5pt}}lccc} 
  \caption{Gen2 Dif Intelligence $\rightarrow$ Gen2 Dif AFI}\label{table_Dif_Child_Intelligence_Dif_Child_AFI_11}
  \\[-1.8ex]\hline 
  \hline \\[-1.8ex] 
  & \multicolumn{3}{c}{\textit{Dependent variable:} Differences in Gen2 Mean AFI} \\ 
  \cline{2-4}
  \partialinput{10}{24}{../Common/content/tables/table_Dif_Child_Intelligence_Dif_Child_AFI_11.tex}
  \end{longtable}\pagebreak
  %%%
  %%% Mom Child -> Child
  \begin{longtable}{@{\extracolsep{5pt}}lccc} 
  \caption{Dif Joint Intelligence $\rightarrow$ Gen2 Dif AFI}\label{table_Dif_Joint_Intelligence_Dif_Child_AFI_11}
  \\[-1.8ex]\hline 
  \hline \\[-1.8ex] 
  & \multicolumn{3}{c}{\textit{Dependent variable:} Differences in Gen2 Mean AFI} \\ 
  \cline{2-4}
  \partialinput{10}{26}{../Common/content/tables/table_Dif_Joint_Intelligence_Dif_Child_AFI_11.tex}
  \end{longtable}
  \end{landscape}
  %