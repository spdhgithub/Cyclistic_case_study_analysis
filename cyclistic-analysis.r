{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "882c1019",
   "metadata": {
    "papermill": {
     "duration": 0.011799,
     "end_time": "2022-08-23T18:33:28.920519",
     "exception": false,
     "start_time": "2022-08-23T18:33:28.908720",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Scenario**\n",
    "\n",
    "I am working as a Junior data analyst in the marketing analyst team at a fictional company Cyclistic, a bike-share company in Chicago. The director of marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore, the team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights,the team will design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives must approve the recommendations, so they must be backed up with compelling data insights and professional data visualizations."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "40a39956",
   "metadata": {
    "papermill": {
     "duration": 0.010638,
     "end_time": "2022-08-23T18:33:28.942454",
     "exception": false,
     "start_time": "2022-08-23T18:33:28.931816",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "\n",
    "**About the Company**\n",
    "\n",
    "In 2016, Cyclistic launched a successful bike-share offering. Since then, the program has grown to a fleet of 5,824 bicycles that are geotracked and locked into a network of 692 stations across Chicago. The bikes can be unlocked from one station and returned to any other station in the system anytime.\n",
    "\n",
    "Cyclistic has 3 pricing plans; single-ride passes, full-day passes and annual memberships. Customers who use the single ride and full day passes are called casual customer and those with annual memerships are called members. According to the finance team annual memberships (members) are more profitable than the other two pricing plans.\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "9f605d7d",
   "metadata": {
    "papermill": {
     "duration": 0.010934,
     "end_time": "2022-08-23T18:33:28.963960",
     "exception": false,
     "start_time": "2022-08-23T18:33:28.953026",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Business task**\n",
    "\n",
    "1. How do annual members and casual riders use Cyclistic bikes differently?\n",
    "2. Why would casual riders buy Cyclistic annual memberships?\n",
    "3. How can Cyclistic use digital media to influence casual riders to become members?\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "1de7049d",
   "metadata": {
    "papermill": {
     "duration": 0.01099,
     "end_time": "2022-08-23T18:33:28.985953",
     "exception": false,
     "start_time": "2022-08-23T18:33:28.974963",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Data source**\n",
    "https://divvy-tripdata.s3.amazonaws.com/index.html"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "5ff6592c",
   "metadata": {
    "papermill": {
     "duration": 0.010854,
     "end_time": "2022-08-23T18:33:29.007351",
     "exception": false,
     "start_time": "2022-08-23T18:33:28.996497",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Data cleaning and visualization**\n",
    "\n",
    "I will be using R for data cleaning, updating and visualizing the data.\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "4dbd5c4f",
   "metadata": {
    "papermill": {
     "duration": 0.010485,
     "end_time": "2022-08-23T18:33:29.028130",
     "exception": false,
     "start_time": "2022-08-23T18:33:29.017645",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Installing and loading required packages for our analysis**\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "86599b2c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-08-23T18:33:29.053503Z",
     "iopub.status.busy": "2022-08-23T18:33:29.051717Z",
     "iopub.status.idle": "2022-08-23T18:33:30.494570Z",
     "shell.execute_reply": "2022-08-23T18:33:30.492944Z"
    },
    "papermill": {
     "duration": 1.457728,
     "end_time": "2022-08-23T18:33:30.496760",
     "exception": false,
     "start_time": "2022-08-23T18:33:29.039032",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching packages\u001b[22m ─────────────────────────────────────── tidyverse 1.3.1 ──\n",
      "\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2\u001b[39m 3.3.6     \u001b[32m✔\u001b[39m \u001b[34mpurrr  \u001b[39m 0.3.4\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtibble \u001b[39m 3.1.7     \u001b[32m✔\u001b[39m \u001b[34mdplyr  \u001b[39m 1.0.9\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtidyr  \u001b[39m 1.2.0     \u001b[32m✔\u001b[39m \u001b[34mstringr\u001b[39m 1.4.0\n",
      "\u001b[32m✔\u001b[39m \u001b[34mreadr  \u001b[39m 2.1.2     \u001b[32m✔\u001b[39m \u001b[34mforcats\u001b[39m 0.5.1\n",
      "\n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "\n",
      "\n",
      "Attaching package: ‘janitor’\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:stats’:\n",
      "\n",
      "    chisq.test, fisher.test\n",
      "\n",
      "\n",
      "\n",
      "Attaching package: ‘lubridate’\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:base’:\n",
      "\n",
      "    date, intersect, setdiff, union\n",
      "\n",
      "\n"
     ]
    }
   ],
   "source": [
    "library(tidyverse)\n",
    "library(skimr)\n",
    "library(tidyr)\n",
    "library(dplyr)\n",
    "library(janitor)\n",
    "library(lubridate)\n",
    "library(ggplot2)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "8fc69a0c",
   "metadata": {
    "papermill": {
     "duration": 0.011647,
     "end_time": "2022-08-23T18:33:30.519983",
     "exception": false,
     "start_time": "2022-08-23T18:33:30.508336",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Importing datasets**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "11832c32",
   "metadata": {
    "_cell_guid": "512aa3ad-28c4-49d0-91d8-740fdd965ddc",
    "_uuid": "1b3059ac-c751-40e6-af69-430d91327250",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-08-23T18:33:30.571646Z",
     "iopub.status.busy": "2022-08-23T18:33:30.544752Z",
     "iopub.status.idle": "2022-08-23T18:35:12.047222Z",
     "shell.execute_reply": "2022-08-23T18:35:12.045760Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 101.517192,
     "end_time": "2022-08-23T18:35:12.049068",
     "exception": false,
     "start_time": "2022-08-23T18:33:30.531876",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "trips_2021_01<-read.csv(\"../input/cyclistic-dataset/202101-divvy-tripdata.csv\")\n",
    "trips_2021_02<-read.csv(\"../input/cyclistic-dataset/202102-divvy-tripdata.csv\")\n",
    "trips_2021_03<-read.csv(\"../input/cyclistic-dataset/202103-divvy-tripdata.csv\")\n",
    "trips_2021_04<-read.csv(\"../input/cyclistic-dataset/202104-divvy-tripdata.csv\")\n",
    "trips_2021_05<-read.csv(\"../input/cyclistic-dataset/202105-divvy-tripdata.csv\")\n",
    "trips_2021_06<-read.csv(\"../input/cyclistic-dataset/202106-divvy-tripdata.csv\")\n",
    "trips_2021_07<-read.csv(\"../input/cyclistic-dataset/202107-divvy-tripdata.csv\")\n",
    "trips_2021_08<-read.csv(\"../input/cyclistic-dataset/202108-divvy-tripdata.csv\")\n",
    "trips_2021_09<-read.csv(\"../input/cyclistic-dataset/202109-divvy-tripdata.csv\")\n",
    "trips_2021_10<-read.csv(\"../input/cyclistic-dataset/202110-divvy-tripdata.csv\")\n",
    "trips_2021_11<-read.csv(\"../input/cyclistic-dataset/202111-divvy-tripdata.csv\")\n",
    "trips_2021_12<-read.csv(\"../input/cyclistic-dataset/202112-divvy-tripdata.csv\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "11ea3795",
   "metadata": {
    "_cell_guid": "8ac82a4b-ebad-4f93-852d-5cde07b351f6",
    "_uuid": "6cfa5095-268f-4e80-8bdb-5a9e9f502ab6",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-08-23T18:35:12.076055Z",
     "iopub.status.busy": "2022-08-23T18:35:12.074836Z",
     "iopub.status.idle": "2022-08-23T18:35:12.089977Z",
     "shell.execute_reply": "2022-08-23T18:35:12.088614Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.029434,
     "end_time": "2022-08-23T18:35:12.091690",
     "exception": false,
     "start_time": "2022-08-23T18:35:12.062256",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "colnames(trips_2021_01)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "46fc28d0",
   "metadata": {
    "papermill": {
     "duration": 0.012229,
     "end_time": "2022-08-23T18:35:12.115080",
     "exception": false,
     "start_time": "2022-08-23T18:35:12.102851",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**combining 12 data frames into 1 dataframe**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "91efe81d",
   "metadata": {
    "_cell_guid": "cc509f5a-d6d9-4d51-8fc8-1ab38a4e7db7",
    "_uuid": "a4dc1f5c-8b56-4988-8927-9670998141c0",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-08-23T18:35:12.140211Z",
     "iopub.status.busy": "2022-08-23T18:35:12.138893Z",
     "iopub.status.idle": "2022-08-23T18:35:46.781963Z",
     "shell.execute_reply": "2022-08-23T18:35:46.780518Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 34.657767,
     "end_time": "2022-08-23T18:35:46.784040",
     "exception": false,
     "start_time": "2022-08-23T18:35:12.126273",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 13</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>ride_id</th><th scope=col>rideable_type</th><th scope=col>started_at</th><th scope=col>ended_at</th><th scope=col>start_station_name</th><th scope=col>start_station_id</th><th scope=col>end_station_name</th><th scope=col>end_station_id</th><th scope=col>start_lat</th><th scope=col>start_lng</th><th scope=col>end_lat</th><th scope=col>end_lng</th><th scope=col>member_casual</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>E19E6F1B8D4C42ED</td><td>electric_bike</td><td>2021-01-23 16:14:19</td><td>2021-01-23 16:24:44</td><td>California Ave &amp; Cortez St</td><td>17660</td><td></td><td></td><td>41.90034</td><td>-87.69674</td><td>41.89</td><td>-87.72</td><td>member</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>DC88F20C2C55F27F</td><td>electric_bike</td><td>2021-01-27 18:43:08</td><td>2021-01-27 18:47:12</td><td>California Ave &amp; Cortez St</td><td>17660</td><td></td><td></td><td>41.90033</td><td>-87.69671</td><td>41.90</td><td>-87.69</td><td>member</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>EC45C94683FE3F27</td><td>electric_bike</td><td>2021-01-21 22:35:54</td><td>2021-01-21 22:37:14</td><td>California Ave &amp; Cortez St</td><td>17660</td><td></td><td></td><td>41.90031</td><td>-87.69664</td><td>41.90</td><td>-87.70</td><td>member</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>4FA453A75AE377DB</td><td>electric_bike</td><td>2021-01-07 13:31:13</td><td>2021-01-07 13:42:55</td><td>California Ave &amp; Cortez St</td><td>17660</td><td></td><td></td><td>41.90040</td><td>-87.69666</td><td>41.92</td><td>-87.69</td><td>member</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>BE5E8EB4E7263A0B</td><td>electric_bike</td><td>2021-01-23 02:24:02</td><td>2021-01-23 02:24:45</td><td>California Ave &amp; Cortez St</td><td>17660</td><td></td><td></td><td>41.90033</td><td>-87.69670</td><td>41.90</td><td>-87.70</td><td>casual</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>5D8969F88C773979</td><td>electric_bike</td><td>2021-01-09 14:24:07</td><td>2021-01-09 15:17:54</td><td>California Ave &amp; Cortez St</td><td>17660</td><td></td><td></td><td>41.90041</td><td>-87.69676</td><td>41.94</td><td>-87.71</td><td>casual</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 13\n",
       "\\begin{tabular}{r|lllllllllllll}\n",
       "  & ride\\_id & rideable\\_type & started\\_at & ended\\_at & start\\_station\\_name & start\\_station\\_id & end\\_station\\_name & end\\_station\\_id & start\\_lat & start\\_lng & end\\_lat & end\\_lng & member\\_casual\\\\\n",
       "  & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <chr>\\\\\n",
       "\\hline\n",
       "\t1 & E19E6F1B8D4C42ED & electric\\_bike & 2021-01-23 16:14:19 & 2021-01-23 16:24:44 & California Ave \\& Cortez St & 17660 &  &  & 41.90034 & -87.69674 & 41.89 & -87.72 & member\\\\\n",
       "\t2 & DC88F20C2C55F27F & electric\\_bike & 2021-01-27 18:43:08 & 2021-01-27 18:47:12 & California Ave \\& Cortez St & 17660 &  &  & 41.90033 & -87.69671 & 41.90 & -87.69 & member\\\\\n",
       "\t3 & EC45C94683FE3F27 & electric\\_bike & 2021-01-21 22:35:54 & 2021-01-21 22:37:14 & California Ave \\& Cortez St & 17660 &  &  & 41.90031 & -87.69664 & 41.90 & -87.70 & member\\\\\n",
       "\t4 & 4FA453A75AE377DB & electric\\_bike & 2021-01-07 13:31:13 & 2021-01-07 13:42:55 & California Ave \\& Cortez St & 17660 &  &  & 41.90040 & -87.69666 & 41.92 & -87.69 & member\\\\\n",
       "\t5 & BE5E8EB4E7263A0B & electric\\_bike & 2021-01-23 02:24:02 & 2021-01-23 02:24:45 & California Ave \\& Cortez St & 17660 &  &  & 41.90033 & -87.69670 & 41.90 & -87.70 & casual\\\\\n",
       "\t6 & 5D8969F88C773979 & electric\\_bike & 2021-01-09 14:24:07 & 2021-01-09 15:17:54 & California Ave \\& Cortez St & 17660 &  &  & 41.90041 & -87.69676 & 41.94 & -87.71 & casual\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 13\n",
       "\n",
       "| <!--/--> | ride_id &lt;chr&gt; | rideable_type &lt;chr&gt; | started_at &lt;chr&gt; | ended_at &lt;chr&gt; | start_station_name &lt;chr&gt; | start_station_id &lt;chr&gt; | end_station_name &lt;chr&gt; | end_station_id &lt;chr&gt; | start_lat &lt;dbl&gt; | start_lng &lt;dbl&gt; | end_lat &lt;dbl&gt; | end_lng &lt;dbl&gt; | member_casual &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | E19E6F1B8D4C42ED | electric_bike | 2021-01-23 16:14:19 | 2021-01-23 16:24:44 | California Ave &amp; Cortez St | 17660 | <!----> | <!----> | 41.90034 | -87.69674 | 41.89 | -87.72 | member |\n",
       "| 2 | DC88F20C2C55F27F | electric_bike | 2021-01-27 18:43:08 | 2021-01-27 18:47:12 | California Ave &amp; Cortez St | 17660 | <!----> | <!----> | 41.90033 | -87.69671 | 41.90 | -87.69 | member |\n",
       "| 3 | EC45C94683FE3F27 | electric_bike | 2021-01-21 22:35:54 | 2021-01-21 22:37:14 | California Ave &amp; Cortez St | 17660 | <!----> | <!----> | 41.90031 | -87.69664 | 41.90 | -87.70 | member |\n",
       "| 4 | 4FA453A75AE377DB | electric_bike | 2021-01-07 13:31:13 | 2021-01-07 13:42:55 | California Ave &amp; Cortez St | 17660 | <!----> | <!----> | 41.90040 | -87.69666 | 41.92 | -87.69 | member |\n",
       "| 5 | BE5E8EB4E7263A0B | electric_bike | 2021-01-23 02:24:02 | 2021-01-23 02:24:45 | California Ave &amp; Cortez St | 17660 | <!----> | <!----> | 41.90033 | -87.69670 | 41.90 | -87.70 | casual |\n",
       "| 6 | 5D8969F88C773979 | electric_bike | 2021-01-09 14:24:07 | 2021-01-09 15:17:54 | California Ave &amp; Cortez St | 17660 | <!----> | <!----> | 41.90041 | -87.69676 | 41.94 | -87.71 | casual |\n",
       "\n"
      ],
      "text/plain": [
       "  ride_id          rideable_type started_at          ended_at           \n",
       "1 E19E6F1B8D4C42ED electric_bike 2021-01-23 16:14:19 2021-01-23 16:24:44\n",
       "2 DC88F20C2C55F27F electric_bike 2021-01-27 18:43:08 2021-01-27 18:47:12\n",
       "3 EC45C94683FE3F27 electric_bike 2021-01-21 22:35:54 2021-01-21 22:37:14\n",
       "4 4FA453A75AE377DB electric_bike 2021-01-07 13:31:13 2021-01-07 13:42:55\n",
       "5 BE5E8EB4E7263A0B electric_bike 2021-01-23 02:24:02 2021-01-23 02:24:45\n",
       "6 5D8969F88C773979 electric_bike 2021-01-09 14:24:07 2021-01-09 15:17:54\n",
       "  start_station_name         start_station_id end_station_name end_station_id\n",
       "1 California Ave & Cortez St 17660                                           \n",
       "2 California Ave & Cortez St 17660                                           \n",
       "3 California Ave & Cortez St 17660                                           \n",
       "4 California Ave & Cortez St 17660                                           \n",
       "5 California Ave & Cortez St 17660                                           \n",
       "6 California Ave & Cortez St 17660                                           \n",
       "  start_lat start_lng end_lat end_lng member_casual\n",
       "1 41.90034  -87.69674 41.89   -87.72  member       \n",
       "2 41.90033  -87.69671 41.90   -87.69  member       \n",
       "3 41.90031  -87.69664 41.90   -87.70  member       \n",
       "4 41.90040  -87.69666 41.92   -87.69  member       \n",
       "5 41.90033  -87.69670 41.90   -87.70  casual       \n",
       "6 41.90041  -87.69676 41.94   -87.71  casual       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "bike_rides<-rbind(trips_2021_01,trips_2021_02,trips_2021_03,trips_2021_04,trips_2021_05,\n",
    "            trips_2021_06,trips_2021_07,trips_2021_07,trips_2021_08,trips_2021_09,\n",
    "                  trips_2021_10,trips_2021_11,trips_2021_12)\n",
    "\n",
    "colnames(bike_rides)\n",
    "head(bike_rides)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "db354aee",
   "metadata": {
    "papermill": {
     "duration": 0.012367,
     "end_time": "2022-08-23T18:35:46.809034",
     "exception": false,
     "start_time": "2022-08-23T18:35:46.796667",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**checking the type of rideable type**\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "2214e057",
   "metadata": {
    "_cell_guid": "bb4f20a2-0525-4fd3-95ee-1855c196867f",
    "_uuid": "1734177a-0e8c-468c-9794-3a056d1e22de",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-08-23T18:35:46.836177Z",
     "iopub.status.busy": "2022-08-23T18:35:46.834867Z",
     "iopub.status.idle": "2022-08-23T18:35:46.944756Z",
     "shell.execute_reply": "2022-08-23T18:35:46.943358Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.126178,
     "end_time": "2022-08-23T18:35:46.946935",
     "exception": false,
     "start_time": "2022-08-23T18:35:46.820757",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'electric_bike'</li><li>'classic_bike'</li><li>'docked_bike'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'electric\\_bike'\n",
       "\\item 'classic\\_bike'\n",
       "\\item 'docked\\_bike'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'electric_bike'\n",
       "2. 'classic_bike'\n",
       "3. 'docked_bike'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] \"electric_bike\" \"classic_bike\"  \"docked_bike\"  "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "unique(bike_rides$rideable_type)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "bd0550c8",
   "metadata": {
    "_cell_guid": "0bbdcb83-801d-4666-a038-951e34a7cdb8",
    "_uuid": "1c9e21a7-94bf-41b8-a09c-11294225ec52",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-08-23T18:35:46.973923Z",
     "iopub.status.busy": "2022-08-23T18:35:46.972623Z",
     "iopub.status.idle": "2022-08-23T18:35:47.004811Z",
     "shell.execute_reply": "2022-08-23T18:35:47.003238Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.048055,
     "end_time": "2022-08-23T18:35:47.007053",
     "exception": false,
     "start_time": "2022-08-23T18:35:46.958998",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "'data.frame':\t6417473 obs. of  13 variables:\n",
      " $ ride_id           : chr  \"E19E6F1B8D4C42ED\" \"DC88F20C2C55F27F\" \"EC45C94683FE3F27\" \"4FA453A75AE377DB\" ...\n",
      " $ rideable_type     : chr  \"electric_bike\" \"electric_bike\" \"electric_bike\" \"electric_bike\" ...\n",
      " $ started_at        : chr  \"2021-01-23 16:14:19\" \"2021-01-27 18:43:08\" \"2021-01-21 22:35:54\" \"2021-01-07 13:31:13\" ...\n",
      " $ ended_at          : chr  \"2021-01-23 16:24:44\" \"2021-01-27 18:47:12\" \"2021-01-21 22:37:14\" \"2021-01-07 13:42:55\" ...\n",
      " $ start_station_name: chr  \"California Ave & Cortez St\" \"California Ave & Cortez St\" \"California Ave & Cortez St\" \"California Ave & Cortez St\" ...\n",
      " $ start_station_id  : chr  \"17660\" \"17660\" \"17660\" \"17660\" ...\n",
      " $ end_station_name  : chr  \"\" \"\" \"\" \"\" ...\n",
      " $ end_station_id    : chr  \"\" \"\" \"\" \"\" ...\n",
      " $ start_lat         : num  41.9 41.9 41.9 41.9 41.9 ...\n",
      " $ start_lng         : num  -87.7 -87.7 -87.7 -87.7 -87.7 ...\n",
      " $ end_lat           : num  41.9 41.9 41.9 41.9 41.9 ...\n",
      " $ end_lng           : num  -87.7 -87.7 -87.7 -87.7 -87.7 ...\n",
      " $ member_casual     : chr  \"member\" \"member\" \"member\" \"member\" ...\n"
     ]
    }
   ],
   "source": [
    "str(bike_rides)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "b2a65be6",
   "metadata": {
    "papermill": {
     "duration": 0.012034,
     "end_time": "2022-08-23T18:35:47.031455",
     "exception": false,
     "start_time": "2022-08-23T18:35:47.019421",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**now changing the data type of start_station_id and end_station_id from chr to double**\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "49aec5e8",
   "metadata": {
    "_cell_guid": "3a2f6e8d-f874-4068-88e9-7759d0586bcd",
    "_uuid": "c70d60e6-67e1-4864-85d1-39252e23b9e5",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-08-23T18:35:47.058418Z",
     "iopub.status.busy": "2022-08-23T18:35:47.057119Z",
     "iopub.status.idle": "2022-08-23T18:35:52.227273Z",
     "shell.execute_reply": "2022-08-23T18:35:52.225510Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 5.186862,
     "end_time": "2022-08-23T18:35:52.230467",
     "exception": false,
     "start_time": "2022-08-23T18:35:47.043605",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Warning message in mask$eval_all_mutate(quo):\n",
      "“NAs introduced by coercion”\n",
      "Warning message in mask$eval_all_mutate(quo):\n",
      "“NAs introduced by coercion”\n",
      "Warning message in mask$eval_all_mutate(quo):\n",
      "“NAs introduced by coercion”\n"
     ]
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "'data.frame':\t6417473 obs. of  13 variables:\n",
      " $ ride_id           : num  NA NA NA NA NA NA NA NA NA NA ...\n",
      " $ rideable_type     : chr  \"electric_bike\" \"electric_bike\" \"electric_bike\" \"electric_bike\" ...\n",
      " $ started_at        : chr  \"2021-01-23 16:14:19\" \"2021-01-27 18:43:08\" \"2021-01-21 22:35:54\" \"2021-01-07 13:31:13\" ...\n",
      " $ ended_at          : chr  \"2021-01-23 16:24:44\" \"2021-01-27 18:47:12\" \"2021-01-21 22:37:14\" \"2021-01-07 13:42:55\" ...\n",
      " $ start_station_name: chr  \"California Ave & Cortez St\" \"California Ave & Cortez St\" \"California Ave & Cortez St\" \"California Ave & Cortez St\" ...\n",
      " $ start_station_id  : num  17660 17660 17660 17660 17660 ...\n",
      " $ end_station_name  : chr  \"\" \"\" \"\" \"\" ...\n",
      " $ end_station_id    : num  NA NA NA NA NA NA NA NA NA 657 ...\n",
      " $ start_lat         : num  41.9 41.9 41.9 41.9 41.9 ...\n",
      " $ start_lng         : num  -87.7 -87.7 -87.7 -87.7 -87.7 ...\n",
      " $ end_lat           : num  41.9 41.9 41.9 41.9 41.9 ...\n",
      " $ end_lng           : num  -87.7 -87.7 -87.7 -87.7 -87.7 ...\n",
      " $ member_casual     : chr  \"member\" \"member\" \"member\" \"member\" ...\n"
     ]
    }
   ],
   "source": [
    "bike_rides <- bike_rides%>%\n",
    "mutate(bike_rides, start_station_id = as.double(start_station_id),\n",
    "          end_station_id = as.double(end_station_id),\n",
    "          ride_id = as.double(ride_id))\n",
    " \n",
    "str(bike_rides)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "9f38298b",
   "metadata": {
    "papermill": {
     "duration": 0.014154,
     "end_time": "2022-08-23T18:35:52.257362",
     "exception": false,
     "start_time": "2022-08-23T18:35:52.243208",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**now changing the data type of start_station_id and end_station_id from chr to double**\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "81d52067",
   "metadata": {
    "_cell_guid": "e382d53d-151f-47d5-bf5c-952bb6d19bdb",
    "_uuid": "2a42a32b-ac39-4683-821a-374c6f53cf79",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-08-23T18:35:52.287874Z",
     "iopub.status.busy": "2022-08-23T18:35:52.286516Z",
     "iopub.status.idle": "2022-08-23T18:36:28.194026Z",
     "shell.execute_reply": "2022-08-23T18:36:28.191805Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 35.938655,
     "end_time": "2022-08-23T18:36:28.209203",
     "exception": false,
     "start_time": "2022-08-23T18:35:52.270548",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "'data.frame':\t6417473 obs. of  13 variables:\n",
      " $ ride_id           : num  NA NA NA NA NA NA NA NA NA NA ...\n",
      " $ rideable_type     : chr  \"electric_bike\" \"electric_bike\" \"electric_bike\" \"electric_bike\" ...\n",
      " $ started_at        : POSIXct, format: \"2021-01-23 16:14:19\" \"2021-01-27 18:43:08\" ...\n",
      " $ ended_at          : POSIXct, format: \"2021-01-23 16:24:44\" \"2021-01-27 18:47:12\" ...\n",
      " $ start_station_name: chr  \"California Ave & Cortez St\" \"California Ave & Cortez St\" \"California Ave & Cortez St\" \"California Ave & Cortez St\" ...\n",
      " $ start_station_id  : num  17660 17660 17660 17660 17660 ...\n",
      " $ end_station_name  : chr  \"\" \"\" \"\" \"\" ...\n",
      " $ end_station_id    : num  NA NA NA NA NA NA NA NA NA 657 ...\n",
      " $ start_lat         : num  41.9 41.9 41.9 41.9 41.9 ...\n",
      " $ start_lng         : num  -87.7 -87.7 -87.7 -87.7 -87.7 ...\n",
      " $ end_lat           : num  41.9 41.9 41.9 41.9 41.9 ...\n",
      " $ end_lng           : num  -87.7 -87.7 -87.7 -87.7 -87.7 ...\n",
      " $ member_casual     : chr  \"member\" \"member\" \"member\" \"member\" ...\n"
     ]
    }
   ],
   "source": [
    "bike_rides <- bike_rides %>%\n",
    "  mutate(bike_rides, started_at = as.POSIXct(started_at),\n",
    "         ended_at = as.POSIXct(ended_at))\n",
    "\n",
    "str(bike_rides)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "c6a8e275",
   "metadata": {
    "papermill": {
     "duration": 0.011957,
     "end_time": "2022-08-23T18:36:28.233003",
     "exception": false,
     "start_time": "2022-08-23T18:36:28.221046",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**creating some new columns**\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "ad959fcb",
   "metadata": {
    "_cell_guid": "240fc7d4-fab2-4d9c-84bc-ba1a5a05259c",
    "_uuid": "7e034777-4ac6-4bab-992b-a03f1fbfc50f",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-08-23T18:36:28.260572Z",
     "iopub.status.busy": "2022-08-23T18:36:28.258940Z",
     "iopub.status.idle": "2022-08-23T18:36:44.892233Z",
     "shell.execute_reply": "2022-08-23T18:36:44.890211Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 16.64919,
     "end_time": "2022-08-23T18:36:44.894230",
     "exception": false,
     "start_time": "2022-08-23T18:36:28.245040",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "bike_rides <- bike_rides %>%\n",
    "  mutate(date= as.Date(started_at)\n",
    "         ,month= format(as.Date(date),\"%m\")\n",
    "         ,year= format(as.Date(date),\"%Y\")\n",
    "         ,day= format (as.Date(date),\"%d\")\n",
    "         ,week_day= format(as.Date(date),\"%A\")\n",
    "         ,hour_of_day= format(as.POSIXct(started_at),\"%H\"))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "8d16f709",
   "metadata": {
    "papermill": {
     "duration": 0.012437,
     "end_time": "2022-08-23T18:36:44.919070",
     "exception": false,
     "start_time": "2022-08-23T18:36:44.906633",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**creating a new column ride_length to find the difference between the ride timing**\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "4b3edbba",
   "metadata": {
    "_cell_guid": "d140990c-516b-49c7-93e4-06a453ee450f",
    "_uuid": "89544817-590a-4f8e-bd32-d814ddc5d4dd",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-08-23T18:36:44.946616Z",
     "iopub.status.busy": "2022-08-23T18:36:44.945394Z",
     "iopub.status.idle": "2022-08-23T18:36:45.036972Z",
     "shell.execute_reply": "2022-08-23T18:36:45.035642Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.107698,
     "end_time": "2022-08-23T18:36:45.038840",
     "exception": false,
     "start_time": "2022-08-23T18:36:44.931142",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "'data.frame':\t6417473 obs. of  20 variables:\n",
      " $ ride_id           : num  NA NA NA NA NA NA NA NA NA NA ...\n",
      " $ rideable_type     : chr  \"electric_bike\" \"electric_bike\" \"electric_bike\" \"electric_bike\" ...\n",
      " $ started_at        : POSIXct, format: \"2021-01-23 16:14:19\" \"2021-01-27 18:43:08\" ...\n",
      " $ ended_at          : POSIXct, format: \"2021-01-23 16:24:44\" \"2021-01-27 18:47:12\" ...\n",
      " $ start_station_name: chr  \"California Ave & Cortez St\" \"California Ave & Cortez St\" \"California Ave & Cortez St\" \"California Ave & Cortez St\" ...\n",
      " $ start_station_id  : num  17660 17660 17660 17660 17660 ...\n",
      " $ end_station_name  : chr  \"\" \"\" \"\" \"\" ...\n",
      " $ end_station_id    : num  NA NA NA NA NA NA NA NA NA 657 ...\n",
      " $ start_lat         : num  41.9 41.9 41.9 41.9 41.9 ...\n",
      " $ start_lng         : num  -87.7 -87.7 -87.7 -87.7 -87.7 ...\n",
      " $ end_lat           : num  41.9 41.9 41.9 41.9 41.9 ...\n",
      " $ end_lng           : num  -87.7 -87.7 -87.7 -87.7 -87.7 ...\n",
      " $ member_casual     : chr  \"member\" \"member\" \"member\" \"member\" ...\n",
      " $ date              : Date, format: \"2021-01-23\" \"2021-01-27\" ...\n",
      " $ month             : chr  \"01\" \"01\" \"01\" \"01\" ...\n",
      " $ year              : chr  \"2021\" \"2021\" \"2021\" \"2021\" ...\n",
      " $ day               : chr  \"23\" \"27\" \"21\" \"07\" ...\n",
      " $ week_day          : chr  \"Saturday\" \"Wednesday\" \"Thursday\" \"Thursday\" ...\n",
      " $ hour_of_day       : chr  \"16\" \"18\" \"22\" \"13\" ...\n",
      " $ ride_length       : 'difftime' num  625 244 80 702 ...\n",
      "  ..- attr(*, \"units\")= chr \"secs\"\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 20</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>ride_id</th><th scope=col>rideable_type</th><th scope=col>started_at</th><th scope=col>ended_at</th><th scope=col>start_station_name</th><th scope=col>start_station_id</th><th scope=col>end_station_name</th><th scope=col>end_station_id</th><th scope=col>start_lat</th><th scope=col>start_lng</th><th scope=col>end_lat</th><th scope=col>end_lng</th><th scope=col>member_casual</th><th scope=col>date</th><th scope=col>month</th><th scope=col>year</th><th scope=col>day</th><th scope=col>week_day</th><th scope=col>hour_of_day</th><th scope=col>ride_length</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;date&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;drtn&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>NA</td><td>electric_bike</td><td>2021-01-23 16:14:19</td><td>2021-01-23 16:24:44</td><td>California Ave &amp; Cortez St</td><td>17660</td><td></td><td>NA</td><td>41.90034</td><td>-87.69674</td><td>41.89</td><td>-87.72</td><td>member</td><td>2021-01-23</td><td>01</td><td>2021</td><td>23</td><td>Saturday </td><td>16</td><td> 625 secs</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>NA</td><td>electric_bike</td><td>2021-01-27 18:43:08</td><td>2021-01-27 18:47:12</td><td>California Ave &amp; Cortez St</td><td>17660</td><td></td><td>NA</td><td>41.90033</td><td>-87.69671</td><td>41.90</td><td>-87.69</td><td>member</td><td>2021-01-27</td><td>01</td><td>2021</td><td>27</td><td>Wednesday</td><td>18</td><td> 244 secs</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>NA</td><td>electric_bike</td><td>2021-01-21 22:35:54</td><td>2021-01-21 22:37:14</td><td>California Ave &amp; Cortez St</td><td>17660</td><td></td><td>NA</td><td>41.90031</td><td>-87.69664</td><td>41.90</td><td>-87.70</td><td>member</td><td>2021-01-21</td><td>01</td><td>2021</td><td>21</td><td>Thursday </td><td>22</td><td><span style=white-space:pre-wrap>  80 secs</span></td></tr>\n",
       "\t<tr><th scope=row>4</th><td>NA</td><td>electric_bike</td><td>2021-01-07 13:31:13</td><td>2021-01-07 13:42:55</td><td>California Ave &amp; Cortez St</td><td>17660</td><td></td><td>NA</td><td>41.90040</td><td>-87.69666</td><td>41.92</td><td>-87.69</td><td>member</td><td>2021-01-07</td><td>01</td><td>2021</td><td>07</td><td>Thursday </td><td>13</td><td> 702 secs</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>NA</td><td>electric_bike</td><td>2021-01-23 02:24:02</td><td>2021-01-23 02:24:45</td><td>California Ave &amp; Cortez St</td><td>17660</td><td></td><td>NA</td><td>41.90033</td><td>-87.69670</td><td>41.90</td><td>-87.70</td><td>casual</td><td>2021-01-23</td><td>01</td><td>2021</td><td>23</td><td>Saturday </td><td>02</td><td><span style=white-space:pre-wrap>  43 secs</span></td></tr>\n",
       "\t<tr><th scope=row>6</th><td>NA</td><td>electric_bike</td><td>2021-01-09 14:24:07</td><td>2021-01-09 15:17:54</td><td>California Ave &amp; Cortez St</td><td>17660</td><td></td><td>NA</td><td>41.90041</td><td>-87.69676</td><td>41.94</td><td>-87.71</td><td>casual</td><td>2021-01-09</td><td>01</td><td>2021</td><td>09</td><td>Saturday </td><td>14</td><td>3227 secs</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 20\n",
       "\\begin{tabular}{r|llllllllllllllllllll}\n",
       "  & ride\\_id & rideable\\_type & started\\_at & ended\\_at & start\\_station\\_name & start\\_station\\_id & end\\_station\\_name & end\\_station\\_id & start\\_lat & start\\_lng & end\\_lat & end\\_lng & member\\_casual & date & month & year & day & week\\_day & hour\\_of\\_day & ride\\_length\\\\\n",
       "  & <dbl> & <chr> & <dttm> & <dttm> & <chr> & <dbl> & <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <chr> & <date> & <chr> & <chr> & <chr> & <chr> & <chr> & <drtn>\\\\\n",
       "\\hline\n",
       "\t1 & NA & electric\\_bike & 2021-01-23 16:14:19 & 2021-01-23 16:24:44 & California Ave \\& Cortez St & 17660 &  & NA & 41.90034 & -87.69674 & 41.89 & -87.72 & member & 2021-01-23 & 01 & 2021 & 23 & Saturday  & 16 &  625 secs\\\\\n",
       "\t2 & NA & electric\\_bike & 2021-01-27 18:43:08 & 2021-01-27 18:47:12 & California Ave \\& Cortez St & 17660 &  & NA & 41.90033 & -87.69671 & 41.90 & -87.69 & member & 2021-01-27 & 01 & 2021 & 27 & Wednesday & 18 &  244 secs\\\\\n",
       "\t3 & NA & electric\\_bike & 2021-01-21 22:35:54 & 2021-01-21 22:37:14 & California Ave \\& Cortez St & 17660 &  & NA & 41.90031 & -87.69664 & 41.90 & -87.70 & member & 2021-01-21 & 01 & 2021 & 21 & Thursday  & 22 &   80 secs\\\\\n",
       "\t4 & NA & electric\\_bike & 2021-01-07 13:31:13 & 2021-01-07 13:42:55 & California Ave \\& Cortez St & 17660 &  & NA & 41.90040 & -87.69666 & 41.92 & -87.69 & member & 2021-01-07 & 01 & 2021 & 07 & Thursday  & 13 &  702 secs\\\\\n",
       "\t5 & NA & electric\\_bike & 2021-01-23 02:24:02 & 2021-01-23 02:24:45 & California Ave \\& Cortez St & 17660 &  & NA & 41.90033 & -87.69670 & 41.90 & -87.70 & casual & 2021-01-23 & 01 & 2021 & 23 & Saturday  & 02 &   43 secs\\\\\n",
       "\t6 & NA & electric\\_bike & 2021-01-09 14:24:07 & 2021-01-09 15:17:54 & California Ave \\& Cortez St & 17660 &  & NA & 41.90041 & -87.69676 & 41.94 & -87.71 & casual & 2021-01-09 & 01 & 2021 & 09 & Saturday  & 14 & 3227 secs\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 20\n",
       "\n",
       "| <!--/--> | ride_id &lt;dbl&gt; | rideable_type &lt;chr&gt; | started_at &lt;dttm&gt; | ended_at &lt;dttm&gt; | start_station_name &lt;chr&gt; | start_station_id &lt;dbl&gt; | end_station_name &lt;chr&gt; | end_station_id &lt;dbl&gt; | start_lat &lt;dbl&gt; | start_lng &lt;dbl&gt; | end_lat &lt;dbl&gt; | end_lng &lt;dbl&gt; | member_casual &lt;chr&gt; | date &lt;date&gt; | month &lt;chr&gt; | year &lt;chr&gt; | day &lt;chr&gt; | week_day &lt;chr&gt; | hour_of_day &lt;chr&gt; | ride_length &lt;drtn&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | NA | electric_bike | 2021-01-23 16:14:19 | 2021-01-23 16:24:44 | California Ave &amp; Cortez St | 17660 | <!----> | NA | 41.90034 | -87.69674 | 41.89 | -87.72 | member | 2021-01-23 | 01 | 2021 | 23 | Saturday  | 16 |  625 secs |\n",
       "| 2 | NA | electric_bike | 2021-01-27 18:43:08 | 2021-01-27 18:47:12 | California Ave &amp; Cortez St | 17660 | <!----> | NA | 41.90033 | -87.69671 | 41.90 | -87.69 | member | 2021-01-27 | 01 | 2021 | 27 | Wednesday | 18 |  244 secs |\n",
       "| 3 | NA | electric_bike | 2021-01-21 22:35:54 | 2021-01-21 22:37:14 | California Ave &amp; Cortez St | 17660 | <!----> | NA | 41.90031 | -87.69664 | 41.90 | -87.70 | member | 2021-01-21 | 01 | 2021 | 21 | Thursday  | 22 |   80 secs |\n",
       "| 4 | NA | electric_bike | 2021-01-07 13:31:13 | 2021-01-07 13:42:55 | California Ave &amp; Cortez St | 17660 | <!----> | NA | 41.90040 | -87.69666 | 41.92 | -87.69 | member | 2021-01-07 | 01 | 2021 | 07 | Thursday  | 13 |  702 secs |\n",
       "| 5 | NA | electric_bike | 2021-01-23 02:24:02 | 2021-01-23 02:24:45 | California Ave &amp; Cortez St | 17660 | <!----> | NA | 41.90033 | -87.69670 | 41.90 | -87.70 | casual | 2021-01-23 | 01 | 2021 | 23 | Saturday  | 02 |   43 secs |\n",
       "| 6 | NA | electric_bike | 2021-01-09 14:24:07 | 2021-01-09 15:17:54 | California Ave &amp; Cortez St | 17660 | <!----> | NA | 41.90041 | -87.69676 | 41.94 | -87.71 | casual | 2021-01-09 | 01 | 2021 | 09 | Saturday  | 14 | 3227 secs |\n",
       "\n"
      ],
      "text/plain": [
       "  ride_id rideable_type started_at          ended_at           \n",
       "1 NA      electric_bike 2021-01-23 16:14:19 2021-01-23 16:24:44\n",
       "2 NA      electric_bike 2021-01-27 18:43:08 2021-01-27 18:47:12\n",
       "3 NA      electric_bike 2021-01-21 22:35:54 2021-01-21 22:37:14\n",
       "4 NA      electric_bike 2021-01-07 13:31:13 2021-01-07 13:42:55\n",
       "5 NA      electric_bike 2021-01-23 02:24:02 2021-01-23 02:24:45\n",
       "6 NA      electric_bike 2021-01-09 14:24:07 2021-01-09 15:17:54\n",
       "  start_station_name         start_station_id end_station_name end_station_id\n",
       "1 California Ave & Cortez St 17660                             NA            \n",
       "2 California Ave & Cortez St 17660                             NA            \n",
       "3 California Ave & Cortez St 17660                             NA            \n",
       "4 California Ave & Cortez St 17660                             NA            \n",
       "5 California Ave & Cortez St 17660                             NA            \n",
       "6 California Ave & Cortez St 17660                             NA            \n",
       "  start_lat start_lng end_lat end_lng member_casual date       month year day\n",
       "1 41.90034  -87.69674 41.89   -87.72  member        2021-01-23 01    2021 23 \n",
       "2 41.90033  -87.69671 41.90   -87.69  member        2021-01-27 01    2021 27 \n",
       "3 41.90031  -87.69664 41.90   -87.70  member        2021-01-21 01    2021 21 \n",
       "4 41.90040  -87.69666 41.92   -87.69  member        2021-01-07 01    2021 07 \n",
       "5 41.90033  -87.69670 41.90   -87.70  casual        2021-01-23 01    2021 23 \n",
       "6 41.90041  -87.69676 41.94   -87.71  casual        2021-01-09 01    2021 09 \n",
       "  week_day  hour_of_day ride_length\n",
       "1 Saturday  16           625 secs  \n",
       "2 Wednesday 18           244 secs  \n",
       "3 Thursday  22            80 secs  \n",
       "4 Thursday  13           702 secs  \n",
       "5 Saturday  02            43 secs  \n",
       "6 Saturday  14          3227 secs  "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "bike_rides <- bike_rides %>%\n",
    "  mutate(ride_length = difftime(ended_at, started_at))\n",
    "\n",
    "\n",
    "str(bike_rides)\n",
    "head(bike_rides)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "4ba5c87a",
   "metadata": {
    "papermill": {
     "duration": 0.012805,
     "end_time": "2022-08-23T18:36:45.064181",
     "exception": false,
     "start_time": "2022-08-23T18:36:45.051376",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**changing the data type of new columns**\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "a8f7af30",
   "metadata": {
    "_cell_guid": "9ceed1a0-6273-4882-b1f3-3c7ab8b06b5a",
    "_uuid": "8b0c17a5-2b20-4bc1-af7b-54b79575c21e",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-08-23T18:36:45.092194Z",
     "iopub.status.busy": "2022-08-23T18:36:45.091007Z",
     "iopub.status.idle": "2022-08-23T18:36:49.887592Z",
     "shell.execute_reply": "2022-08-23T18:36:49.886081Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 4.812863,
     "end_time": "2022-08-23T18:36:49.889791",
     "exception": false,
     "start_time": "2022-08-23T18:36:45.076928",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "bike_rides <- bike_rides %>%\n",
    "  mutate(year =as.numeric(year)\n",
    "         ,hour_of_day = as.numeric(hour_of_day)\n",
    "         ,day= as.numeric(day)\n",
    "         ,ride_length = as.numeric(ride_length)\n",
    "         ,month_name = month.abb[as.numeric(month)])"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "b0a34a5f",
   "metadata": {
    "papermill": {
     "duration": 0.022423,
     "end_time": "2022-08-23T18:36:49.924639",
     "exception": false,
     "start_time": "2022-08-23T18:36:49.902216",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**filtering out the ride duration less than 0**\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "e78e2419",
   "metadata": {
    "_cell_guid": "808e0e10-895f-4774-b138-2a4e39446eda",
    "_uuid": "f40f1431-825f-439f-b4fb-d376e9b51244",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-08-23T18:36:49.952437Z",
     "iopub.status.busy": "2022-08-23T18:36:49.951182Z",
     "iopub.status.idle": "2022-08-23T18:36:59.093073Z",
     "shell.execute_reply": "2022-08-23T18:36:59.091654Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 9.158202,
     "end_time": "2022-08-23T18:36:59.095726",
     "exception": false,
     "start_time": "2022-08-23T18:36:49.937524",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 21</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>ride_id</th><th scope=col>rideable_type</th><th scope=col>started_at</th><th scope=col>ended_at</th><th scope=col>start_station_name</th><th scope=col>start_station_id</th><th scope=col>end_station_name</th><th scope=col>end_station_id</th><th scope=col>start_lat</th><th scope=col>start_lng</th><th scope=col>⋯</th><th scope=col>end_lng</th><th scope=col>member_casual</th><th scope=col>date</th><th scope=col>month</th><th scope=col>year</th><th scope=col>day</th><th scope=col>week_day</th><th scope=col>hour_of_day</th><th scope=col>ride_length</th><th scope=col>month_name</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>⋯</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;date&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>NA</td><td>electric_bike</td><td>2021-01-23 16:14:19</td><td>2021-01-23 16:24:44</td><td>California Ave &amp; Cortez St</td><td>17660</td><td></td><td>NA</td><td>41.90034</td><td>-87.69674</td><td>⋯</td><td>-87.72</td><td>member</td><td>2021-01-23</td><td>01</td><td>2021</td><td>23</td><td>Saturday </td><td>16</td><td> 625</td><td>Jan</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>NA</td><td>electric_bike</td><td>2021-01-27 18:43:08</td><td>2021-01-27 18:47:12</td><td>California Ave &amp; Cortez St</td><td>17660</td><td></td><td>NA</td><td>41.90033</td><td>-87.69671</td><td>⋯</td><td>-87.69</td><td>member</td><td>2021-01-27</td><td>01</td><td>2021</td><td>27</td><td>Wednesday</td><td>18</td><td> 244</td><td>Jan</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>NA</td><td>electric_bike</td><td>2021-01-21 22:35:54</td><td>2021-01-21 22:37:14</td><td>California Ave &amp; Cortez St</td><td>17660</td><td></td><td>NA</td><td>41.90031</td><td>-87.69664</td><td>⋯</td><td>-87.70</td><td>member</td><td>2021-01-21</td><td>01</td><td>2021</td><td>21</td><td>Thursday </td><td>22</td><td><span style=white-space:pre-wrap>  80</span></td><td>Jan</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>NA</td><td>electric_bike</td><td>2021-01-07 13:31:13</td><td>2021-01-07 13:42:55</td><td>California Ave &amp; Cortez St</td><td>17660</td><td></td><td>NA</td><td>41.90040</td><td>-87.69666</td><td>⋯</td><td>-87.69</td><td>member</td><td>2021-01-07</td><td>01</td><td>2021</td><td> 7</td><td>Thursday </td><td>13</td><td> 702</td><td>Jan</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>NA</td><td>electric_bike</td><td>2021-01-23 02:24:02</td><td>2021-01-23 02:24:45</td><td>California Ave &amp; Cortez St</td><td>17660</td><td></td><td>NA</td><td>41.90033</td><td>-87.69670</td><td>⋯</td><td>-87.70</td><td>casual</td><td>2021-01-23</td><td>01</td><td>2021</td><td>23</td><td>Saturday </td><td> 2</td><td><span style=white-space:pre-wrap>  43</span></td><td>Jan</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>NA</td><td>electric_bike</td><td>2021-01-09 14:24:07</td><td>2021-01-09 15:17:54</td><td>California Ave &amp; Cortez St</td><td>17660</td><td></td><td>NA</td><td>41.90041</td><td>-87.69676</td><td>⋯</td><td>-87.71</td><td>casual</td><td>2021-01-09</td><td>01</td><td>2021</td><td> 9</td><td>Saturday </td><td>14</td><td>3227</td><td>Jan</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 21\n",
       "\\begin{tabular}{r|lllllllllllllllllllll}\n",
       "  & ride\\_id & rideable\\_type & started\\_at & ended\\_at & start\\_station\\_name & start\\_station\\_id & end\\_station\\_name & end\\_station\\_id & start\\_lat & start\\_lng & ⋯ & end\\_lng & member\\_casual & date & month & year & day & week\\_day & hour\\_of\\_day & ride\\_length & month\\_name\\\\\n",
       "  & <dbl> & <chr> & <dttm> & <dttm> & <chr> & <dbl> & <chr> & <dbl> & <dbl> & <dbl> & ⋯ & <dbl> & <chr> & <date> & <chr> & <dbl> & <dbl> & <chr> & <dbl> & <dbl> & <chr>\\\\\n",
       "\\hline\n",
       "\t1 & NA & electric\\_bike & 2021-01-23 16:14:19 & 2021-01-23 16:24:44 & California Ave \\& Cortez St & 17660 &  & NA & 41.90034 & -87.69674 & ⋯ & -87.72 & member & 2021-01-23 & 01 & 2021 & 23 & Saturday  & 16 &  625 & Jan\\\\\n",
       "\t2 & NA & electric\\_bike & 2021-01-27 18:43:08 & 2021-01-27 18:47:12 & California Ave \\& Cortez St & 17660 &  & NA & 41.90033 & -87.69671 & ⋯ & -87.69 & member & 2021-01-27 & 01 & 2021 & 27 & Wednesday & 18 &  244 & Jan\\\\\n",
       "\t3 & NA & electric\\_bike & 2021-01-21 22:35:54 & 2021-01-21 22:37:14 & California Ave \\& Cortez St & 17660 &  & NA & 41.90031 & -87.69664 & ⋯ & -87.70 & member & 2021-01-21 & 01 & 2021 & 21 & Thursday  & 22 &   80 & Jan\\\\\n",
       "\t4 & NA & electric\\_bike & 2021-01-07 13:31:13 & 2021-01-07 13:42:55 & California Ave \\& Cortez St & 17660 &  & NA & 41.90040 & -87.69666 & ⋯ & -87.69 & member & 2021-01-07 & 01 & 2021 &  7 & Thursday  & 13 &  702 & Jan\\\\\n",
       "\t5 & NA & electric\\_bike & 2021-01-23 02:24:02 & 2021-01-23 02:24:45 & California Ave \\& Cortez St & 17660 &  & NA & 41.90033 & -87.69670 & ⋯ & -87.70 & casual & 2021-01-23 & 01 & 2021 & 23 & Saturday  &  2 &   43 & Jan\\\\\n",
       "\t6 & NA & electric\\_bike & 2021-01-09 14:24:07 & 2021-01-09 15:17:54 & California Ave \\& Cortez St & 17660 &  & NA & 41.90041 & -87.69676 & ⋯ & -87.71 & casual & 2021-01-09 & 01 & 2021 &  9 & Saturday  & 14 & 3227 & Jan\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 21\n",
       "\n",
       "| <!--/--> | ride_id &lt;dbl&gt; | rideable_type &lt;chr&gt; | started_at &lt;dttm&gt; | ended_at &lt;dttm&gt; | start_station_name &lt;chr&gt; | start_station_id &lt;dbl&gt; | end_station_name &lt;chr&gt; | end_station_id &lt;dbl&gt; | start_lat &lt;dbl&gt; | start_lng &lt;dbl&gt; | ⋯ ⋯ | end_lng &lt;dbl&gt; | member_casual &lt;chr&gt; | date &lt;date&gt; | month &lt;chr&gt; | year &lt;dbl&gt; | day &lt;dbl&gt; | week_day &lt;chr&gt; | hour_of_day &lt;dbl&gt; | ride_length &lt;dbl&gt; | month_name &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | NA | electric_bike | 2021-01-23 16:14:19 | 2021-01-23 16:24:44 | California Ave &amp; Cortez St | 17660 | <!----> | NA | 41.90034 | -87.69674 | ⋯ | -87.72 | member | 2021-01-23 | 01 | 2021 | 23 | Saturday  | 16 |  625 | Jan |\n",
       "| 2 | NA | electric_bike | 2021-01-27 18:43:08 | 2021-01-27 18:47:12 | California Ave &amp; Cortez St | 17660 | <!----> | NA | 41.90033 | -87.69671 | ⋯ | -87.69 | member | 2021-01-27 | 01 | 2021 | 27 | Wednesday | 18 |  244 | Jan |\n",
       "| 3 | NA | electric_bike | 2021-01-21 22:35:54 | 2021-01-21 22:37:14 | California Ave &amp; Cortez St | 17660 | <!----> | NA | 41.90031 | -87.69664 | ⋯ | -87.70 | member | 2021-01-21 | 01 | 2021 | 21 | Thursday  | 22 |   80 | Jan |\n",
       "| 4 | NA | electric_bike | 2021-01-07 13:31:13 | 2021-01-07 13:42:55 | California Ave &amp; Cortez St | 17660 | <!----> | NA | 41.90040 | -87.69666 | ⋯ | -87.69 | member | 2021-01-07 | 01 | 2021 |  7 | Thursday  | 13 |  702 | Jan |\n",
       "| 5 | NA | electric_bike | 2021-01-23 02:24:02 | 2021-01-23 02:24:45 | California Ave &amp; Cortez St | 17660 | <!----> | NA | 41.90033 | -87.69670 | ⋯ | -87.70 | casual | 2021-01-23 | 01 | 2021 | 23 | Saturday  |  2 |   43 | Jan |\n",
       "| 6 | NA | electric_bike | 2021-01-09 14:24:07 | 2021-01-09 15:17:54 | California Ave &amp; Cortez St | 17660 | <!----> | NA | 41.90041 | -87.69676 | ⋯ | -87.71 | casual | 2021-01-09 | 01 | 2021 |  9 | Saturday  | 14 | 3227 | Jan |\n",
       "\n"
      ],
      "text/plain": [
       "  ride_id rideable_type started_at          ended_at           \n",
       "1 NA      electric_bike 2021-01-23 16:14:19 2021-01-23 16:24:44\n",
       "2 NA      electric_bike 2021-01-27 18:43:08 2021-01-27 18:47:12\n",
       "3 NA      electric_bike 2021-01-21 22:35:54 2021-01-21 22:37:14\n",
       "4 NA      electric_bike 2021-01-07 13:31:13 2021-01-07 13:42:55\n",
       "5 NA      electric_bike 2021-01-23 02:24:02 2021-01-23 02:24:45\n",
       "6 NA      electric_bike 2021-01-09 14:24:07 2021-01-09 15:17:54\n",
       "  start_station_name         start_station_id end_station_name end_station_id\n",
       "1 California Ave & Cortez St 17660                             NA            \n",
       "2 California Ave & Cortez St 17660                             NA            \n",
       "3 California Ave & Cortez St 17660                             NA            \n",
       "4 California Ave & Cortez St 17660                             NA            \n",
       "5 California Ave & Cortez St 17660                             NA            \n",
       "6 California Ave & Cortez St 17660                             NA            \n",
       "  start_lat start_lng ⋯ end_lng member_casual date       month year day\n",
       "1 41.90034  -87.69674 ⋯ -87.72  member        2021-01-23 01    2021 23 \n",
       "2 41.90033  -87.69671 ⋯ -87.69  member        2021-01-27 01    2021 27 \n",
       "3 41.90031  -87.69664 ⋯ -87.70  member        2021-01-21 01    2021 21 \n",
       "4 41.90040  -87.69666 ⋯ -87.69  member        2021-01-07 01    2021  7 \n",
       "5 41.90033  -87.69670 ⋯ -87.70  casual        2021-01-23 01    2021 23 \n",
       "6 41.90041  -87.69676 ⋯ -87.71  casual        2021-01-09 01    2021  9 \n",
       "  week_day  hour_of_day ride_length month_name\n",
       "1 Saturday  16           625        Jan       \n",
       "2 Wednesday 18           244        Jan       \n",
       "3 Thursday  22            80        Jan       \n",
       "4 Thursday  13           702        Jan       \n",
       "5 Saturday   2            43        Jan       \n",
       "6 Saturday  14          3227        Jan       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "'data.frame':\t6416738 obs. of  21 variables:\n",
      " $ ride_id           : num  NA NA NA NA NA NA NA NA NA NA ...\n",
      " $ rideable_type     : chr  \"electric_bike\" \"electric_bike\" \"electric_bike\" \"electric_bike\" ...\n",
      " $ started_at        : POSIXct, format: \"2021-01-23 16:14:19\" \"2021-01-27 18:43:08\" ...\n",
      " $ ended_at          : POSIXct, format: \"2021-01-23 16:24:44\" \"2021-01-27 18:47:12\" ...\n",
      " $ start_station_name: chr  \"California Ave & Cortez St\" \"California Ave & Cortez St\" \"California Ave & Cortez St\" \"California Ave & Cortez St\" ...\n",
      " $ start_station_id  : num  17660 17660 17660 17660 17660 ...\n",
      " $ end_station_name  : chr  \"\" \"\" \"\" \"\" ...\n",
      " $ end_station_id    : num  NA NA NA NA NA NA NA NA NA 657 ...\n",
      " $ start_lat         : num  41.9 41.9 41.9 41.9 41.9 ...\n",
      " $ start_lng         : num  -87.7 -87.7 -87.7 -87.7 -87.7 ...\n",
      " $ end_lat           : num  41.9 41.9 41.9 41.9 41.9 ...\n",
      " $ end_lng           : num  -87.7 -87.7 -87.7 -87.7 -87.7 ...\n",
      " $ member_casual     : chr  \"member\" \"member\" \"member\" \"member\" ...\n",
      " $ date              : Date, format: \"2021-01-23\" \"2021-01-27\" ...\n",
      " $ month             : chr  \"01\" \"01\" \"01\" \"01\" ...\n",
      " $ year              : num  2021 2021 2021 2021 2021 ...\n",
      " $ day               : num  23 27 21 7 23 9 4 14 9 24 ...\n",
      " $ week_day          : chr  \"Saturday\" \"Wednesday\" \"Thursday\" \"Thursday\" ...\n",
      " $ hour_of_day       : num  16 18 22 13 2 14 5 15 9 19 ...\n",
      " $ ride_length       : num  625 244 80 702 43 ...\n",
      " $ month_name        : chr  \"Jan\" \"Jan\" \"Jan\" \"Jan\" ...\n"
     ]
    }
   ],
   "source": [
    "bike_rides <- bike_rides %>%\n",
    "     filter(ride_length > 0)\n",
    "\n",
    "head(bike_rides)\n",
    "str(bike_rides)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "45bd3b73",
   "metadata": {
    "papermill": {
     "duration": 0.01308,
     "end_time": "2022-08-23T18:36:59.121624",
     "exception": false,
     "start_time": "2022-08-23T18:36:59.108544",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**deleting unneccessory columns that are not required for our analysis**\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "13a14a4e",
   "metadata": {
    "_cell_guid": "9d17568a-a670-4f05-8a36-598477811f57",
    "_uuid": "d847ec7b-6db2-4e68-aa01-739d7bef1d11",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-08-23T18:36:59.150325Z",
     "iopub.status.busy": "2022-08-23T18:36:59.149016Z",
     "iopub.status.idle": "2022-08-23T18:37:07.599554Z",
     "shell.execute_reply": "2022-08-23T18:37:07.598203Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 8.467048,
     "end_time": "2022-08-23T18:37:07.601637",
     "exception": false,
     "start_time": "2022-08-23T18:36:59.134589",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 15</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>ride_id</th><th scope=col>rideable_type</th><th scope=col>started_at</th><th scope=col>ended_at</th><th scope=col>start_station_name</th><th scope=col>end_station_name</th><th scope=col>member_casual</th><th scope=col>date</th><th scope=col>month</th><th scope=col>year</th><th scope=col>day</th><th scope=col>week_day</th><th scope=col>hour_of_day</th><th scope=col>ride_length</th><th scope=col>month_name</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;date&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>NA</td><td>electric_bike</td><td>2021-01-23 16:14:19</td><td>2021-01-23 16:24:44</td><td>California Ave &amp; Cortez St</td><td></td><td>member</td><td>2021-01-23</td><td>01</td><td>2021</td><td>23</td><td>Saturday </td><td>16</td><td> 625</td><td>Jan</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>NA</td><td>electric_bike</td><td>2021-01-27 18:43:08</td><td>2021-01-27 18:47:12</td><td>California Ave &amp; Cortez St</td><td></td><td>member</td><td>2021-01-27</td><td>01</td><td>2021</td><td>27</td><td>Wednesday</td><td>18</td><td> 244</td><td>Jan</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>NA</td><td>electric_bike</td><td>2021-01-21 22:35:54</td><td>2021-01-21 22:37:14</td><td>California Ave &amp; Cortez St</td><td></td><td>member</td><td>2021-01-21</td><td>01</td><td>2021</td><td>21</td><td>Thursday </td><td>22</td><td><span style=white-space:pre-wrap>  80</span></td><td>Jan</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>NA</td><td>electric_bike</td><td>2021-01-07 13:31:13</td><td>2021-01-07 13:42:55</td><td>California Ave &amp; Cortez St</td><td></td><td>member</td><td>2021-01-07</td><td>01</td><td>2021</td><td> 7</td><td>Thursday </td><td>13</td><td> 702</td><td>Jan</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>NA</td><td>electric_bike</td><td>2021-01-23 02:24:02</td><td>2021-01-23 02:24:45</td><td>California Ave &amp; Cortez St</td><td></td><td>casual</td><td>2021-01-23</td><td>01</td><td>2021</td><td>23</td><td>Saturday </td><td> 2</td><td><span style=white-space:pre-wrap>  43</span></td><td>Jan</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>NA</td><td>electric_bike</td><td>2021-01-09 14:24:07</td><td>2021-01-09 15:17:54</td><td>California Ave &amp; Cortez St</td><td></td><td>casual</td><td>2021-01-09</td><td>01</td><td>2021</td><td> 9</td><td>Saturday </td><td>14</td><td>3227</td><td>Jan</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 15\n",
       "\\begin{tabular}{r|lllllllllllllll}\n",
       "  & ride\\_id & rideable\\_type & started\\_at & ended\\_at & start\\_station\\_name & end\\_station\\_name & member\\_casual & date & month & year & day & week\\_day & hour\\_of\\_day & ride\\_length & month\\_name\\\\\n",
       "  & <dbl> & <chr> & <dttm> & <dttm> & <chr> & <chr> & <chr> & <date> & <chr> & <dbl> & <dbl> & <chr> & <dbl> & <dbl> & <chr>\\\\\n",
       "\\hline\n",
       "\t1 & NA & electric\\_bike & 2021-01-23 16:14:19 & 2021-01-23 16:24:44 & California Ave \\& Cortez St &  & member & 2021-01-23 & 01 & 2021 & 23 & Saturday  & 16 &  625 & Jan\\\\\n",
       "\t2 & NA & electric\\_bike & 2021-01-27 18:43:08 & 2021-01-27 18:47:12 & California Ave \\& Cortez St &  & member & 2021-01-27 & 01 & 2021 & 27 & Wednesday & 18 &  244 & Jan\\\\\n",
       "\t3 & NA & electric\\_bike & 2021-01-21 22:35:54 & 2021-01-21 22:37:14 & California Ave \\& Cortez St &  & member & 2021-01-21 & 01 & 2021 & 21 & Thursday  & 22 &   80 & Jan\\\\\n",
       "\t4 & NA & electric\\_bike & 2021-01-07 13:31:13 & 2021-01-07 13:42:55 & California Ave \\& Cortez St &  & member & 2021-01-07 & 01 & 2021 &  7 & Thursday  & 13 &  702 & Jan\\\\\n",
       "\t5 & NA & electric\\_bike & 2021-01-23 02:24:02 & 2021-01-23 02:24:45 & California Ave \\& Cortez St &  & casual & 2021-01-23 & 01 & 2021 & 23 & Saturday  &  2 &   43 & Jan\\\\\n",
       "\t6 & NA & electric\\_bike & 2021-01-09 14:24:07 & 2021-01-09 15:17:54 & California Ave \\& Cortez St &  & casual & 2021-01-09 & 01 & 2021 &  9 & Saturday  & 14 & 3227 & Jan\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 15\n",
       "\n",
       "| <!--/--> | ride_id &lt;dbl&gt; | rideable_type &lt;chr&gt; | started_at &lt;dttm&gt; | ended_at &lt;dttm&gt; | start_station_name &lt;chr&gt; | end_station_name &lt;chr&gt; | member_casual &lt;chr&gt; | date &lt;date&gt; | month &lt;chr&gt; | year &lt;dbl&gt; | day &lt;dbl&gt; | week_day &lt;chr&gt; | hour_of_day &lt;dbl&gt; | ride_length &lt;dbl&gt; | month_name &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | NA | electric_bike | 2021-01-23 16:14:19 | 2021-01-23 16:24:44 | California Ave &amp; Cortez St | <!----> | member | 2021-01-23 | 01 | 2021 | 23 | Saturday  | 16 |  625 | Jan |\n",
       "| 2 | NA | electric_bike | 2021-01-27 18:43:08 | 2021-01-27 18:47:12 | California Ave &amp; Cortez St | <!----> | member | 2021-01-27 | 01 | 2021 | 27 | Wednesday | 18 |  244 | Jan |\n",
       "| 3 | NA | electric_bike | 2021-01-21 22:35:54 | 2021-01-21 22:37:14 | California Ave &amp; Cortez St | <!----> | member | 2021-01-21 | 01 | 2021 | 21 | Thursday  | 22 |   80 | Jan |\n",
       "| 4 | NA | electric_bike | 2021-01-07 13:31:13 | 2021-01-07 13:42:55 | California Ave &amp; Cortez St | <!----> | member | 2021-01-07 | 01 | 2021 |  7 | Thursday  | 13 |  702 | Jan |\n",
       "| 5 | NA | electric_bike | 2021-01-23 02:24:02 | 2021-01-23 02:24:45 | California Ave &amp; Cortez St | <!----> | casual | 2021-01-23 | 01 | 2021 | 23 | Saturday  |  2 |   43 | Jan |\n",
       "| 6 | NA | electric_bike | 2021-01-09 14:24:07 | 2021-01-09 15:17:54 | California Ave &amp; Cortez St | <!----> | casual | 2021-01-09 | 01 | 2021 |  9 | Saturday  | 14 | 3227 | Jan |\n",
       "\n"
      ],
      "text/plain": [
       "  ride_id rideable_type started_at          ended_at           \n",
       "1 NA      electric_bike 2021-01-23 16:14:19 2021-01-23 16:24:44\n",
       "2 NA      electric_bike 2021-01-27 18:43:08 2021-01-27 18:47:12\n",
       "3 NA      electric_bike 2021-01-21 22:35:54 2021-01-21 22:37:14\n",
       "4 NA      electric_bike 2021-01-07 13:31:13 2021-01-07 13:42:55\n",
       "5 NA      electric_bike 2021-01-23 02:24:02 2021-01-23 02:24:45\n",
       "6 NA      electric_bike 2021-01-09 14:24:07 2021-01-09 15:17:54\n",
       "  start_station_name         end_station_name member_casual date       month\n",
       "1 California Ave & Cortez St                  member        2021-01-23 01   \n",
       "2 California Ave & Cortez St                  member        2021-01-27 01   \n",
       "3 California Ave & Cortez St                  member        2021-01-21 01   \n",
       "4 California Ave & Cortez St                  member        2021-01-07 01   \n",
       "5 California Ave & Cortez St                  casual        2021-01-23 01   \n",
       "6 California Ave & Cortez St                  casual        2021-01-09 01   \n",
       "  year day week_day  hour_of_day ride_length month_name\n",
       "1 2021 23  Saturday  16           625        Jan       \n",
       "2 2021 27  Wednesday 18           244        Jan       \n",
       "3 2021 21  Thursday  22            80        Jan       \n",
       "4 2021  7  Thursday  13           702        Jan       \n",
       "5 2021 23  Saturday   2            43        Jan       \n",
       "6 2021  9  Saturday  14          3227        Jan       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>6416738</li><li>15</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 6416738\n",
       "\\item 15\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 6416738\n",
       "2. 15\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] 6416738      15"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "bike_rides <- subset(bike_rides, select = -c(start_lat, start_lng, end_lat, end_lng, start_station_id, end_station_id))\n",
    "\n",
    "head(bike_rides)\n",
    "dim(bike_rides)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "adb4ff73",
   "metadata": {
    "papermill": {
     "duration": 0.013238,
     "end_time": "2022-08-23T18:37:07.628427",
     "exception": false,
     "start_time": "2022-08-23T18:37:07.615189",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**sorting our data according to weekdays and month**\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "id": "facadc96",
   "metadata": {
    "_cell_guid": "c940798b-c258-4eb4-b26c-c94be8b949de",
    "_uuid": "e89dbcad-0ab4-4448-8991-3f7956584aa2",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-08-23T18:37:07.657507Z",
     "iopub.status.busy": "2022-08-23T18:37:07.656118Z",
     "iopub.status.idle": "2022-08-23T18:37:07.813244Z",
     "shell.execute_reply": "2022-08-23T18:37:07.811624Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.173613,
     "end_time": "2022-08-23T18:37:07.815024",
     "exception": false,
     "start_time": "2022-08-23T18:37:07.641411",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 15</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>ride_id</th><th scope=col>rideable_type</th><th scope=col>started_at</th><th scope=col>ended_at</th><th scope=col>start_station_name</th><th scope=col>end_station_name</th><th scope=col>member_casual</th><th scope=col>date</th><th scope=col>month</th><th scope=col>year</th><th scope=col>day</th><th scope=col>week_day</th><th scope=col>hour_of_day</th><th scope=col>ride_length</th><th scope=col>month_name</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;date&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;fct&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>NA</td><td>electric_bike</td><td>2021-01-23 16:14:19</td><td>2021-01-23 16:24:44</td><td>California Ave &amp; Cortez St</td><td></td><td>member</td><td>2021-01-23</td><td>01</td><td>2021</td><td>23</td><td>Saturday </td><td>16</td><td> 625</td><td>Jan</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>NA</td><td>electric_bike</td><td>2021-01-27 18:43:08</td><td>2021-01-27 18:47:12</td><td>California Ave &amp; Cortez St</td><td></td><td>member</td><td>2021-01-27</td><td>01</td><td>2021</td><td>27</td><td>Wednesday</td><td>18</td><td> 244</td><td>Jan</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>NA</td><td>electric_bike</td><td>2021-01-21 22:35:54</td><td>2021-01-21 22:37:14</td><td>California Ave &amp; Cortez St</td><td></td><td>member</td><td>2021-01-21</td><td>01</td><td>2021</td><td>21</td><td>Thursday </td><td>22</td><td><span style=white-space:pre-wrap>  80</span></td><td>Jan</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>NA</td><td>electric_bike</td><td>2021-01-07 13:31:13</td><td>2021-01-07 13:42:55</td><td>California Ave &amp; Cortez St</td><td></td><td>member</td><td>2021-01-07</td><td>01</td><td>2021</td><td> 7</td><td>Thursday </td><td>13</td><td> 702</td><td>Jan</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>NA</td><td>electric_bike</td><td>2021-01-23 02:24:02</td><td>2021-01-23 02:24:45</td><td>California Ave &amp; Cortez St</td><td></td><td>casual</td><td>2021-01-23</td><td>01</td><td>2021</td><td>23</td><td>Saturday </td><td> 2</td><td><span style=white-space:pre-wrap>  43</span></td><td>Jan</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>NA</td><td>electric_bike</td><td>2021-01-09 14:24:07</td><td>2021-01-09 15:17:54</td><td>California Ave &amp; Cortez St</td><td></td><td>casual</td><td>2021-01-09</td><td>01</td><td>2021</td><td> 9</td><td>Saturday </td><td>14</td><td>3227</td><td>Jan</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 15\n",
       "\\begin{tabular}{r|lllllllllllllll}\n",
       "  & ride\\_id & rideable\\_type & started\\_at & ended\\_at & start\\_station\\_name & end\\_station\\_name & member\\_casual & date & month & year & day & week\\_day & hour\\_of\\_day & ride\\_length & month\\_name\\\\\n",
       "  & <dbl> & <chr> & <dttm> & <dttm> & <chr> & <chr> & <chr> & <date> & <chr> & <dbl> & <dbl> & <fct> & <dbl> & <dbl> & <fct>\\\\\n",
       "\\hline\n",
       "\t1 & NA & electric\\_bike & 2021-01-23 16:14:19 & 2021-01-23 16:24:44 & California Ave \\& Cortez St &  & member & 2021-01-23 & 01 & 2021 & 23 & Saturday  & 16 &  625 & Jan\\\\\n",
       "\t2 & NA & electric\\_bike & 2021-01-27 18:43:08 & 2021-01-27 18:47:12 & California Ave \\& Cortez St &  & member & 2021-01-27 & 01 & 2021 & 27 & Wednesday & 18 &  244 & Jan\\\\\n",
       "\t3 & NA & electric\\_bike & 2021-01-21 22:35:54 & 2021-01-21 22:37:14 & California Ave \\& Cortez St &  & member & 2021-01-21 & 01 & 2021 & 21 & Thursday  & 22 &   80 & Jan\\\\\n",
       "\t4 & NA & electric\\_bike & 2021-01-07 13:31:13 & 2021-01-07 13:42:55 & California Ave \\& Cortez St &  & member & 2021-01-07 & 01 & 2021 &  7 & Thursday  & 13 &  702 & Jan\\\\\n",
       "\t5 & NA & electric\\_bike & 2021-01-23 02:24:02 & 2021-01-23 02:24:45 & California Ave \\& Cortez St &  & casual & 2021-01-23 & 01 & 2021 & 23 & Saturday  &  2 &   43 & Jan\\\\\n",
       "\t6 & NA & electric\\_bike & 2021-01-09 14:24:07 & 2021-01-09 15:17:54 & California Ave \\& Cortez St &  & casual & 2021-01-09 & 01 & 2021 &  9 & Saturday  & 14 & 3227 & Jan\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 15\n",
       "\n",
       "| <!--/--> | ride_id &lt;dbl&gt; | rideable_type &lt;chr&gt; | started_at &lt;dttm&gt; | ended_at &lt;dttm&gt; | start_station_name &lt;chr&gt; | end_station_name &lt;chr&gt; | member_casual &lt;chr&gt; | date &lt;date&gt; | month &lt;chr&gt; | year &lt;dbl&gt; | day &lt;dbl&gt; | week_day &lt;fct&gt; | hour_of_day &lt;dbl&gt; | ride_length &lt;dbl&gt; | month_name &lt;fct&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | NA | electric_bike | 2021-01-23 16:14:19 | 2021-01-23 16:24:44 | California Ave &amp; Cortez St | <!----> | member | 2021-01-23 | 01 | 2021 | 23 | Saturday  | 16 |  625 | Jan |\n",
       "| 2 | NA | electric_bike | 2021-01-27 18:43:08 | 2021-01-27 18:47:12 | California Ave &amp; Cortez St | <!----> | member | 2021-01-27 | 01 | 2021 | 27 | Wednesday | 18 |  244 | Jan |\n",
       "| 3 | NA | electric_bike | 2021-01-21 22:35:54 | 2021-01-21 22:37:14 | California Ave &amp; Cortez St | <!----> | member | 2021-01-21 | 01 | 2021 | 21 | Thursday  | 22 |   80 | Jan |\n",
       "| 4 | NA | electric_bike | 2021-01-07 13:31:13 | 2021-01-07 13:42:55 | California Ave &amp; Cortez St | <!----> | member | 2021-01-07 | 01 | 2021 |  7 | Thursday  | 13 |  702 | Jan |\n",
       "| 5 | NA | electric_bike | 2021-01-23 02:24:02 | 2021-01-23 02:24:45 | California Ave &amp; Cortez St | <!----> | casual | 2021-01-23 | 01 | 2021 | 23 | Saturday  |  2 |   43 | Jan |\n",
       "| 6 | NA | electric_bike | 2021-01-09 14:24:07 | 2021-01-09 15:17:54 | California Ave &amp; Cortez St | <!----> | casual | 2021-01-09 | 01 | 2021 |  9 | Saturday  | 14 | 3227 | Jan |\n",
       "\n"
      ],
      "text/plain": [
       "  ride_id rideable_type started_at          ended_at           \n",
       "1 NA      electric_bike 2021-01-23 16:14:19 2021-01-23 16:24:44\n",
       "2 NA      electric_bike 2021-01-27 18:43:08 2021-01-27 18:47:12\n",
       "3 NA      electric_bike 2021-01-21 22:35:54 2021-01-21 22:37:14\n",
       "4 NA      electric_bike 2021-01-07 13:31:13 2021-01-07 13:42:55\n",
       "5 NA      electric_bike 2021-01-23 02:24:02 2021-01-23 02:24:45\n",
       "6 NA      electric_bike 2021-01-09 14:24:07 2021-01-09 15:17:54\n",
       "  start_station_name         end_station_name member_casual date       month\n",
       "1 California Ave & Cortez St                  member        2021-01-23 01   \n",
       "2 California Ave & Cortez St                  member        2021-01-27 01   \n",
       "3 California Ave & Cortez St                  member        2021-01-21 01   \n",
       "4 California Ave & Cortez St                  member        2021-01-07 01   \n",
       "5 California Ave & Cortez St                  casual        2021-01-23 01   \n",
       "6 California Ave & Cortez St                  casual        2021-01-09 01   \n",
       "  year day week_day  hour_of_day ride_length month_name\n",
       "1 2021 23  Saturday  16           625        Jan       \n",
       "2 2021 27  Wednesday 18           244        Jan       \n",
       "3 2021 21  Thursday  22            80        Jan       \n",
       "4 2021  7  Thursday  13           702        Jan       \n",
       "5 2021 23  Saturday   2            43        Jan       \n",
       "6 2021  9  Saturday  14          3227        Jan       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "bike_rides <- bike_rides %>%\n",
    "  mutate(week_day = factor(week_day, levels =c(\"Sunday\", \"Monday\", \n",
    "                                               \"Tuesday\", \"Wednesday\", \"Thursday\", \"Friday\", \"Saturday\"))\n",
    "         ,month_name = factor(month_name, levels       =c(\"Jan\",\"Feb\",\"Mar\",\"Apr\",\"May\",\"Jun\",\"Jul\", \"Aug\",\"Sep\",\"Oct\",\"Nov\",\"Dec\")))\n",
    "                                                  \n",
    "\n",
    "head(bike_rides)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "58ee1bc9",
   "metadata": {
    "papermill": {
     "duration": 0.013622,
     "end_time": "2022-08-23T18:37:07.842241",
     "exception": false,
     "start_time": "2022-08-23T18:37:07.828619",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Now deleting all NA(missing) values from our dataframe**\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "id": "3db2cb7e",
   "metadata": {
    "_cell_guid": "9c11db50-3182-4f96-bc93-abb885ce492a",
    "_uuid": "002103a3-efb8-4d8f-bd2f-c16bde68be38",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-08-23T18:37:07.872597Z",
     "iopub.status.busy": "2022-08-23T18:37:07.871322Z",
     "iopub.status.idle": "2022-08-23T18:37:08.583867Z",
     "shell.execute_reply": "2022-08-23T18:37:08.582317Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.729756,
     "end_time": "2022-08-23T18:37:08.585722",
     "exception": false,
     "start_time": "2022-08-23T18:37:07.855966",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 15</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>ride_id</th><th scope=col>rideable_type</th><th scope=col>started_at</th><th scope=col>ended_at</th><th scope=col>start_station_name</th><th scope=col>end_station_name</th><th scope=col>member_casual</th><th scope=col>date</th><th scope=col>month</th><th scope=col>year</th><th scope=col>day</th><th scope=col>week_day</th><th scope=col>hour_of_day</th><th scope=col>ride_length</th><th scope=col>month_name</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;date&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;fct&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>380</th><td><span style=white-space:pre-wrap>         Inf</span></td><td>classic_bike </td><td>2021-01-21 11:50:00</td><td>2021-01-21 12:00:42</td><td><span style=white-space:pre-wrap>Michigan Ave &amp; 14th St       </span></td><td>Franklin St &amp; Adams St (Temp)</td><td>member</td><td>2021-01-21</td><td>01</td><td>2021</td><td>21</td><td>Thursday </td><td>11</td><td>642</td><td>Jan</td></tr>\n",
       "\t<tr><th scope=row>699</th><td>3.634103e+14</td><td>electric_bike</td><td>2021-01-16 01:19:00</td><td>2021-01-16 01:25:19</td><td><span style=white-space:pre-wrap>Clarendon Ave &amp; Junior Ter   </span></td><td><span style=white-space:pre-wrap>Broadway &amp; Cornelia Ave      </span></td><td>member</td><td>2021-01-16</td><td>01</td><td>2021</td><td>16</td><td>Saturday </td><td> 1</td><td>379</td><td>Jan</td></tr>\n",
       "\t<tr><th scope=row>778</th><td>7.450604e+15</td><td>classic_bike </td><td>2021-01-13 17:13:21</td><td>2021-01-13 17:27:10</td><td><span style=white-space:pre-wrap>Halsted St &amp; Clybourn Ave    </span></td><td><span style=white-space:pre-wrap>Clark St &amp; Schiller St       </span></td><td>member</td><td>2021-01-13</td><td>01</td><td>2021</td><td>13</td><td>Wednesday</td><td>17</td><td>829</td><td>Jan</td></tr>\n",
       "\t<tr><th scope=row>2525</th><td><span style=white-space:pre-wrap>         Inf</span></td><td>classic_bike </td><td>2021-01-06 08:59:01</td><td>2021-01-06 09:14:54</td><td><span style=white-space:pre-wrap>Michigan Ave &amp; Jackson Blvd  </span></td><td><span style=white-space:pre-wrap>Paulina St &amp; Flournoy St     </span></td><td>member</td><td>2021-01-06</td><td>01</td><td>2021</td><td> 6</td><td>Wednesday</td><td> 8</td><td>953</td><td>Jan</td></tr>\n",
       "\t<tr><th scope=row>2864</th><td><span style=white-space:pre-wrap>         Inf</span></td><td>classic_bike </td><td>2021-01-06 08:57:19</td><td>2021-01-06 09:13:03</td><td>Lakeview Ave &amp; Fullerton Pkwy</td><td><span style=white-space:pre-wrap>Halsted St &amp; Clybourn Ave    </span></td><td>member</td><td>2021-01-06</td><td>01</td><td>2021</td><td> 6</td><td>Wednesday</td><td> 8</td><td>944</td><td>Jan</td></tr>\n",
       "\t<tr><th scope=row>3189</th><td>6.319709e+15</td><td>classic_bike </td><td>2021-01-19 14:55:38</td><td>2021-01-19 15:09:04</td><td><span style=white-space:pre-wrap>Indiana Ave &amp; Roosevelt Rd   </span></td><td><span style=white-space:pre-wrap>Daley Center Plaza           </span></td><td>member</td><td>2021-01-19</td><td>01</td><td>2021</td><td>19</td><td><span style=white-space:pre-wrap>Tuesday  </span></td><td>14</td><td>806</td><td>Jan</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 15\n",
       "\\begin{tabular}{r|lllllllllllllll}\n",
       "  & ride\\_id & rideable\\_type & started\\_at & ended\\_at & start\\_station\\_name & end\\_station\\_name & member\\_casual & date & month & year & day & week\\_day & hour\\_of\\_day & ride\\_length & month\\_name\\\\\n",
       "  & <dbl> & <chr> & <dttm> & <dttm> & <chr> & <chr> & <chr> & <date> & <chr> & <dbl> & <dbl> & <fct> & <dbl> & <dbl> & <fct>\\\\\n",
       "\\hline\n",
       "\t380 &          Inf & classic\\_bike  & 2021-01-21 11:50:00 & 2021-01-21 12:00:42 & Michigan Ave \\& 14th St        & Franklin St \\& Adams St (Temp) & member & 2021-01-21 & 01 & 2021 & 21 & Thursday  & 11 & 642 & Jan\\\\\n",
       "\t699 & 3.634103e+14 & electric\\_bike & 2021-01-16 01:19:00 & 2021-01-16 01:25:19 & Clarendon Ave \\& Junior Ter    & Broadway \\& Cornelia Ave       & member & 2021-01-16 & 01 & 2021 & 16 & Saturday  &  1 & 379 & Jan\\\\\n",
       "\t778 & 7.450604e+15 & classic\\_bike  & 2021-01-13 17:13:21 & 2021-01-13 17:27:10 & Halsted St \\& Clybourn Ave     & Clark St \\& Schiller St        & member & 2021-01-13 & 01 & 2021 & 13 & Wednesday & 17 & 829 & Jan\\\\\n",
       "\t2525 &          Inf & classic\\_bike  & 2021-01-06 08:59:01 & 2021-01-06 09:14:54 & Michigan Ave \\& Jackson Blvd   & Paulina St \\& Flournoy St      & member & 2021-01-06 & 01 & 2021 &  6 & Wednesday &  8 & 953 & Jan\\\\\n",
       "\t2864 &          Inf & classic\\_bike  & 2021-01-06 08:57:19 & 2021-01-06 09:13:03 & Lakeview Ave \\& Fullerton Pkwy & Halsted St \\& Clybourn Ave     & member & 2021-01-06 & 01 & 2021 &  6 & Wednesday &  8 & 944 & Jan\\\\\n",
       "\t3189 & 6.319709e+15 & classic\\_bike  & 2021-01-19 14:55:38 & 2021-01-19 15:09:04 & Indiana Ave \\& Roosevelt Rd    & Daley Center Plaza            & member & 2021-01-19 & 01 & 2021 & 19 & Tuesday   & 14 & 806 & Jan\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 15\n",
       "\n",
       "| <!--/--> | ride_id &lt;dbl&gt; | rideable_type &lt;chr&gt; | started_at &lt;dttm&gt; | ended_at &lt;dttm&gt; | start_station_name &lt;chr&gt; | end_station_name &lt;chr&gt; | member_casual &lt;chr&gt; | date &lt;date&gt; | month &lt;chr&gt; | year &lt;dbl&gt; | day &lt;dbl&gt; | week_day &lt;fct&gt; | hour_of_day &lt;dbl&gt; | ride_length &lt;dbl&gt; | month_name &lt;fct&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 380 |          Inf | classic_bike  | 2021-01-21 11:50:00 | 2021-01-21 12:00:42 | Michigan Ave &amp; 14th St        | Franklin St &amp; Adams St (Temp) | member | 2021-01-21 | 01 | 2021 | 21 | Thursday  | 11 | 642 | Jan |\n",
       "| 699 | 3.634103e+14 | electric_bike | 2021-01-16 01:19:00 | 2021-01-16 01:25:19 | Clarendon Ave &amp; Junior Ter    | Broadway &amp; Cornelia Ave       | member | 2021-01-16 | 01 | 2021 | 16 | Saturday  |  1 | 379 | Jan |\n",
       "| 778 | 7.450604e+15 | classic_bike  | 2021-01-13 17:13:21 | 2021-01-13 17:27:10 | Halsted St &amp; Clybourn Ave     | Clark St &amp; Schiller St        | member | 2021-01-13 | 01 | 2021 | 13 | Wednesday | 17 | 829 | Jan |\n",
       "| 2525 |          Inf | classic_bike  | 2021-01-06 08:59:01 | 2021-01-06 09:14:54 | Michigan Ave &amp; Jackson Blvd   | Paulina St &amp; Flournoy St      | member | 2021-01-06 | 01 | 2021 |  6 | Wednesday |  8 | 953 | Jan |\n",
       "| 2864 |          Inf | classic_bike  | 2021-01-06 08:57:19 | 2021-01-06 09:13:03 | Lakeview Ave &amp; Fullerton Pkwy | Halsted St &amp; Clybourn Ave     | member | 2021-01-06 | 01 | 2021 |  6 | Wednesday |  8 | 944 | Jan |\n",
       "| 3189 | 6.319709e+15 | classic_bike  | 2021-01-19 14:55:38 | 2021-01-19 15:09:04 | Indiana Ave &amp; Roosevelt Rd    | Daley Center Plaza            | member | 2021-01-19 | 01 | 2021 | 19 | Tuesday   | 14 | 806 | Jan |\n",
       "\n"
      ],
      "text/plain": [
       "     ride_id      rideable_type started_at          ended_at           \n",
       "380           Inf classic_bike  2021-01-21 11:50:00 2021-01-21 12:00:42\n",
       "699  3.634103e+14 electric_bike 2021-01-16 01:19:00 2021-01-16 01:25:19\n",
       "778  7.450604e+15 classic_bike  2021-01-13 17:13:21 2021-01-13 17:27:10\n",
       "2525          Inf classic_bike  2021-01-06 08:59:01 2021-01-06 09:14:54\n",
       "2864          Inf classic_bike  2021-01-06 08:57:19 2021-01-06 09:13:03\n",
       "3189 6.319709e+15 classic_bike  2021-01-19 14:55:38 2021-01-19 15:09:04\n",
       "     start_station_name            end_station_name              member_casual\n",
       "380  Michigan Ave & 14th St        Franklin St & Adams St (Temp) member       \n",
       "699  Clarendon Ave & Junior Ter    Broadway & Cornelia Ave       member       \n",
       "778  Halsted St & Clybourn Ave     Clark St & Schiller St        member       \n",
       "2525 Michigan Ave & Jackson Blvd   Paulina St & Flournoy St      member       \n",
       "2864 Lakeview Ave & Fullerton Pkwy Halsted St & Clybourn Ave     member       \n",
       "3189 Indiana Ave & Roosevelt Rd    Daley Center Plaza            member       \n",
       "     date       month year day week_day  hour_of_day ride_length month_name\n",
       "380  2021-01-21 01    2021 21  Thursday  11          642         Jan       \n",
       "699  2021-01-16 01    2021 16  Saturday   1          379         Jan       \n",
       "778  2021-01-13 01    2021 13  Wednesday 17          829         Jan       \n",
       "2525 2021-01-06 01    2021  6  Wednesday  8          953         Jan       \n",
       "2864 2021-01-06 01    2021  6  Wednesday  8          944         Jan       \n",
       "3189 2021-01-19 01    2021 19  Tuesday   14          806         Jan       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "bike_rides_clean <- na.omit(bike_rides)\n",
    "\n",
    "head(bike_rides_clean)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "aa71c83c",
   "metadata": {
    "papermill": {
     "duration": 0.014111,
     "end_time": "2022-08-23T18:37:08.613537",
     "exception": false,
     "start_time": "2022-08-23T18:37:08.599426",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Descriptive analysis on ride_length**\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 16,
   "id": "d54e65c9",
   "metadata": {
    "_cell_guid": "c0cbe9a0-811b-4a80-9763-3f1f7c16ab37",
    "_uuid": "a0884cd2-3c66-4770-ab4d-2ae62c66e992",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-08-23T18:37:08.673362Z",
     "iopub.status.busy": "2022-08-23T18:37:08.671967Z",
     "iopub.status.idle": "2022-08-23T18:37:08.699416Z",
     "shell.execute_reply": "2022-08-23T18:37:08.697966Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.045023,
     "end_time": "2022-08-23T18:37:08.701789",
     "exception": false,
     "start_time": "2022-08-23T18:37:08.656766",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "1619.97497405144"
      ],
      "text/latex": [
       "1619.97497405144"
      ],
      "text/markdown": [
       "1619.97497405144"
      ],
      "text/plain": [
       "[1] 1619.975"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "731"
      ],
      "text/latex": [
       "731"
      ],
      "text/markdown": [
       "731"
      ],
      "text/plain": [
       "[1] 731"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "1477679"
      ],
      "text/latex": [
       "1477679"
      ],
      "text/markdown": [
       "1477679"
      ],
      "text/plain": [
       "[1] 1477679"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "1"
      ],
      "text/latex": [
       "1"
      ],
      "text/markdown": [
       "1"
      ],
      "text/plain": [
       "[1] 1"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "mean(bike_rides_clean$ride_length)\n",
    "median(bike_rides_clean$ride_length)\n",
    "max(bike_rides_clean$ride_length)\n",
    "min(bike_rides_clean$ride_length)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "8ad35324",
   "metadata": {
    "papermill": {
     "duration": 0.014003,
     "end_time": "2022-08-23T18:37:08.730142",
     "exception": false,
     "start_time": "2022-08-23T18:37:08.716139",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "we can execute the above four lines using summary function\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 17,
   "id": "c4572982",
   "metadata": {
    "_cell_guid": "e53c047e-deeb-432a-a58a-7c37b70743f4",
    "_uuid": "dccef21d-a73d-4f13-83c8-8691a72ea57f",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-08-23T18:37:08.762120Z",
     "iopub.status.busy": "2022-08-23T18:37:08.760678Z",
     "iopub.status.idle": "2022-08-23T18:37:08.784200Z",
     "shell.execute_reply": "2022-08-23T18:37:08.782724Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.041501,
     "end_time": "2022-08-23T18:37:08.785968",
     "exception": false,
     "start_time": "2022-08-23T18:37:08.744467",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "    ride_id          rideable_type        started_at                 \n",
       " Min.   :0.000e+00   Length:8671        Min.   :2021-01-01 07:48:09  \n",
       " 1st Qu.:4.883e+15   Class :character   1st Qu.:2021-06-15 13:27:01  \n",
       " Median :3.891e+36   Mode  :character   Median :2021-07-25 15:33:44  \n",
       " Mean   :      Inf                      Mean   :2021-07-27 23:30:02  \n",
       " 3rd Qu.:      Inf                      3rd Qu.:2021-09-16 18:31:13  \n",
       " Max.   :      Inf                      Max.   :2021-12-31 21:43:29  \n",
       "                                                                     \n",
       "    ended_at                   start_station_name end_station_name  \n",
       " Min.   :2021-01-01 08:05:25   Length:8671        Length:8671       \n",
       " 1st Qu.:2021-06-15 13:51:32   Class :character   Class :character  \n",
       " Median :2021-07-25 17:06:04   Mode  :character   Mode  :character  \n",
       " Mean   :2021-07-27 23:57:02                                        \n",
       " 3rd Qu.:2021-09-16 18:44:24                                        \n",
       " Max.   :2021-12-31 21:52:07                                        \n",
       "                                                                    \n",
       " member_casual           date               month                year     \n",
       " Length:8671        Min.   :2021-01-01   Length:8671        Min.   :2021  \n",
       " Class :character   1st Qu.:2021-06-15   Class :character   1st Qu.:2021  \n",
       " Mode  :character   Median :2021-07-25   Mode  :character   Median :2021  \n",
       "                    Mean   :2021-07-27                      Mean   :2021  \n",
       "                    3rd Qu.:2021-09-16                      3rd Qu.:2021  \n",
       "                    Max.   :2021-12-31                      Max.   :2021  \n",
       "                                                                          \n",
       "      day             week_day     hour_of_day     ride_length     \n",
       " Min.   : 1.00   Sunday   :1179   Min.   : 0.00   Min.   :      1  \n",
       " 1st Qu.: 8.00   Monday   :1145   1st Qu.:11.00   1st Qu.:    417  \n",
       " Median :16.00   Tuesday  :1105   Median :15.00   Median :    731  \n",
       " Mean   :15.71   Wednesday:1173   Mean   :14.21   Mean   :   1620  \n",
       " 3rd Qu.:23.00   Thursday :1179   3rd Qu.:18.00   3rd Qu.:   1310  \n",
       " Max.   :31.00   Friday   :1354   Max.   :23.00   Max.   :1477679  \n",
       "                 Saturday :1536                                    \n",
       "   month_name  \n",
       " Jul    :2216  \n",
       " Aug    :1090  \n",
       " Sep    :1032  \n",
       " Jun    : 993  \n",
       " Oct    : 884  \n",
       " May    : 675  \n",
       " (Other):1781  "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "summary(bike_rides_clean)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "aed22908",
   "metadata": {
    "papermill": {
     "duration": 0.014471,
     "end_time": "2022-08-23T18:37:08.815146",
     "exception": false,
     "start_time": "2022-08-23T18:37:08.800675",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**comparing members and casual users**\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 18,
   "id": "24e71615",
   "metadata": {
    "_cell_guid": "0f334c28-9a57-4652-acbb-c86254430961",
    "_uuid": "725fc184-729a-4f39-83a3-2e4a3ed2fb95",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-08-23T18:37:08.846514Z",
     "iopub.status.busy": "2022-08-23T18:37:08.845021Z",
     "iopub.status.idle": "2022-08-23T18:37:08.905326Z",
     "shell.execute_reply": "2022-08-23T18:37:08.903859Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.077665,
     "end_time": "2022-08-23T18:37:08.906996",
     "exception": false,
     "start_time": "2022-08-23T18:37:08.829331",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>bike_rides_clean$member_casual</th><th scope=col>bike_rides_clean$ride_length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>2539.9368</td></tr>\n",
       "\t<tr><td>member</td><td> 824.0863</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " bike\\_rides\\_clean\\$member\\_casual & bike\\_rides\\_clean\\$ride\\_length\\\\\n",
       " <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & 2539.9368\\\\\n",
       "\t member &  824.0863\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 2 × 2\n",
       "\n",
       "| bike_rides_clean$member_casual &lt;chr&gt; | bike_rides_clean$ride_length &lt;dbl&gt; |\n",
       "|---|---|\n",
       "| casual | 2539.9368 |\n",
       "| member |  824.0863 |\n",
       "\n"
      ],
      "text/plain": [
       "  bike_rides_clean$member_casual bike_rides_clean$ride_length\n",
       "1 casual                         2539.9368                   \n",
       "2 member                          824.0863                   "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>bike_rides_clean$member_casual</th><th scope=col>bike_rides_clean$ride_length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>962.5</td></tr>\n",
       "\t<tr><td>member</td><td>583.0</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " bike\\_rides\\_clean\\$member\\_casual & bike\\_rides\\_clean\\$ride\\_length\\\\\n",
       " <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & 962.5\\\\\n",
       "\t member & 583.0\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 2 × 2\n",
       "\n",
       "| bike_rides_clean$member_casual &lt;chr&gt; | bike_rides_clean$ride_length &lt;dbl&gt; |\n",
       "|---|---|\n",
       "| casual | 962.5 |\n",
       "| member | 583.0 |\n",
       "\n"
      ],
      "text/plain": [
       "  bike_rides_clean$member_casual bike_rides_clean$ride_length\n",
       "1 casual                         962.5                       \n",
       "2 member                         583.0                       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>bike_rides_clean$member_casual</th><th scope=col>bike_rides_clean$ride_length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>1477679</td></tr>\n",
       "\t<tr><td>member</td><td>  87339</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " bike\\_rides\\_clean\\$member\\_casual & bike\\_rides\\_clean\\$ride\\_length\\\\\n",
       " <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & 1477679\\\\\n",
       "\t member &   87339\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 2 × 2\n",
       "\n",
       "| bike_rides_clean$member_casual &lt;chr&gt; | bike_rides_clean$ride_length &lt;dbl&gt; |\n",
       "|---|---|\n",
       "| casual | 1477679 |\n",
       "| member |   87339 |\n",
       "\n"
      ],
      "text/plain": [
       "  bike_rides_clean$member_casual bike_rides_clean$ride_length\n",
       "1 casual                         1477679                     \n",
       "2 member                           87339                     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>bike_rides_clean$member_casual</th><th scope=col>bike_rides_clean$ride_length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>4</td></tr>\n",
       "\t<tr><td>member</td><td>1</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " bike\\_rides\\_clean\\$member\\_casual & bike\\_rides\\_clean\\$ride\\_length\\\\\n",
       " <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & 4\\\\\n",
       "\t member & 1\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 2 × 2\n",
       "\n",
       "| bike_rides_clean$member_casual &lt;chr&gt; | bike_rides_clean$ride_length &lt;dbl&gt; |\n",
       "|---|---|\n",
       "| casual | 4 |\n",
       "| member | 1 |\n",
       "\n"
      ],
      "text/plain": [
       "  bike_rides_clean$member_casual bike_rides_clean$ride_length\n",
       "1 casual                         4                           \n",
       "2 member                         1                           "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "aggregate(bike_rides_clean$ride_length ~ bike_rides_clean$member_casual, FUN = mean)\n",
    "aggregate(bike_rides_clean$ride_length ~ bike_rides_clean$member_casual, FUN = median)\n",
    "aggregate(bike_rides_clean$ride_length ~ bike_rides_clean$member_casual, FUN = max)\n",
    "aggregate(bike_rides_clean$ride_length ~ bike_rides_clean$member_casual, FUN = min)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "7b60f2b7",
   "metadata": {
    "papermill": {
     "duration": 0.014841,
     "end_time": "2022-08-23T18:37:08.936839",
     "exception": false,
     "start_time": "2022-08-23T18:37:08.921998",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**No. of Customers**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 19,
   "id": "b8042928",
   "metadata": {
    "_cell_guid": "35ffa19a-617f-4859-932e-b8e351cc0f41",
    "_uuid": "487a3ea2-41d7-4ba7-8b13-9636fbb0a5c5",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-08-23T18:37:08.969612Z",
     "iopub.status.busy": "2022-08-23T18:37:08.968205Z",
     "iopub.status.idle": "2022-08-23T18:37:08.987742Z",
     "shell.execute_reply": "2022-08-23T18:37:08.986225Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.037916,
     "end_time": "2022-08-23T18:37:08.989715",
     "exception": false,
     "start_time": "2022-08-23T18:37:08.951799",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>ride_id</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>4022</td></tr>\n",
       "\t<tr><td>member</td><td>4649</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " member\\_casual & ride\\_id\\\\\n",
       " <chr> & <int>\\\\\n",
       "\\hline\n",
       "\t casual & 4022\\\\\n",
       "\t member & 4649\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 2 × 2\n",
       "\n",
       "| member_casual &lt;chr&gt; | ride_id &lt;int&gt; |\n",
       "|---|---|\n",
       "| casual | 4022 |\n",
       "| member | 4649 |\n",
       "\n"
      ],
      "text/plain": [
       "  member_casual ride_id\n",
       "1 casual        4022   \n",
       "2 member        4649   "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "aggregate(ride_id~member_casual, data = bike_rides_clean, length)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "b23ac39a",
   "metadata": {
    "papermill": {
     "duration": 0.015635,
     "end_time": "2022-08-23T18:37:09.020830",
     "exception": false,
     "start_time": "2022-08-23T18:37:09.005195",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**no of customers VS week_day**\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 20,
   "id": "50c3d9cc",
   "metadata": {
    "_cell_guid": "c323cd10-3678-49bc-a0e1-bcb18d25ea29",
    "_uuid": "a65df7f5-557f-452d-98a6-00dd347ca62c",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-08-23T18:37:09.054241Z",
     "iopub.status.busy": "2022-08-23T18:37:09.052855Z",
     "iopub.status.idle": "2022-08-23T18:37:09.068009Z",
     "shell.execute_reply": "2022-08-23T18:37:09.066390Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.033762,
     "end_time": "2022-08-23T18:37:09.069882",
     "exception": false,
     "start_time": "2022-08-23T18:37:09.036120",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "weekly_riders <-aggregate(ride_id~member_casual + week_day, data = bike_rides_clean, length)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "39ff33e3",
   "metadata": {
    "papermill": {
     "duration": 0.015149,
     "end_time": "2022-08-23T18:37:09.100493",
     "exception": false,
     "start_time": "2022-08-23T18:37:09.085344",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**no of customers VS month**\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 21,
   "id": "795f2432",
   "metadata": {
    "_cell_guid": "d93bed0a-efcd-400e-9a36-a41b48e61aff",
    "_uuid": "c9bdc94c-5330-47ca-b596-c2adfe106c60",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-08-23T18:37:09.133303Z",
     "iopub.status.busy": "2022-08-23T18:37:09.132031Z",
     "iopub.status.idle": "2022-08-23T18:37:09.147181Z",
     "shell.execute_reply": "2022-08-23T18:37:09.145556Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.033657,
     "end_time": "2022-08-23T18:37:09.149087",
     "exception": false,
     "start_time": "2022-08-23T18:37:09.115430",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "monthly_riders <-aggregate(ride_id~member_casual + month_name, data = bike_rides_clean, length)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "800a4eb2",
   "metadata": {
    "papermill": {
     "duration": 0.014928,
     "end_time": "2022-08-23T18:37:09.179050",
     "exception": false,
     "start_time": "2022-08-23T18:37:09.164122",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**no of customers VS hour_of_day**\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 22,
   "id": "045f9b0f",
   "metadata": {
    "_cell_guid": "4f1b01dd-e2fc-4ccc-b020-2cd54420fed7",
    "_uuid": "5da76b91-539c-4e03-91e6-3bf161f780dc",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-08-23T18:37:09.213550Z",
     "iopub.status.busy": "2022-08-23T18:37:09.212241Z",
     "iopub.status.idle": "2022-08-23T18:37:09.234903Z",
     "shell.execute_reply": "2022-08-23T18:37:09.233411Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.043148,
     "end_time": "2022-08-23T18:37:09.237070",
     "exception": false,
     "start_time": "2022-08-23T18:37:09.193922",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "hourly_riders <-aggregate(ride_id~member_casual + hour_of_day, data = bike_rides_clean, length)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "0b872c47",
   "metadata": {
    "papermill": {
     "duration": 0.014891,
     "end_time": "2022-08-23T18:37:09.267240",
     "exception": false,
     "start_time": "2022-08-23T18:37:09.252349",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Calculating mean ride length grouping by member_casual and month name**\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 23,
   "id": "d21a6672",
   "metadata": {
    "_cell_guid": "da3ad324-edfe-4b0b-b824-c6aabefcce7a",
    "_uuid": "98d0e8e4-9ef1-4059-8ff6-542ce564c8f2",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-08-23T18:37:09.300065Z",
     "iopub.status.busy": "2022-08-23T18:37:09.298777Z",
     "iopub.status.idle": "2022-08-23T18:37:23.213073Z",
     "shell.execute_reply": "2022-08-23T18:37:23.211266Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 13.933448,
     "end_time": "2022-08-23T18:37:23.215497",
     "exception": false,
     "start_time": "2022-08-23T18:37:09.282049",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 24 × 4</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>month_name</th><th scope=col>ride_id</th><th scope=col>mean_trip_length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>Jan</td><td>  25</td><td>1301.4800</td></tr>\n",
       "\t<tr><td>casual</td><td>Feb</td><td>  15</td><td>7442.3333</td></tr>\n",
       "\t<tr><td>casual</td><td>Mar</td><td> 113</td><td>1969.4779</td></tr>\n",
       "\t<tr><td>casual</td><td>Apr</td><td> 196</td><td>2179.1735</td></tr>\n",
       "\t<tr><td>casual</td><td>May</td><td> 319</td><td>2883.1223</td></tr>\n",
       "\t<tr><td>casual</td><td>Jun</td><td> 513</td><td>2031.2612</td></tr>\n",
       "\t<tr><td>casual</td><td>Jul</td><td>1148</td><td>4037.6690</td></tr>\n",
       "\t<tr><td>casual</td><td>Aug</td><td> 591</td><td>1851.4298</td></tr>\n",
       "\t<tr><td>casual</td><td>Sep</td><td> 516</td><td>1718.3140</td></tr>\n",
       "\t<tr><td>casual</td><td>Oct</td><td> 366</td><td>1402.1803</td></tr>\n",
       "\t<tr><td>casual</td><td>Nov</td><td> 129</td><td>1489.6977</td></tr>\n",
       "\t<tr><td>casual</td><td>Dec</td><td>  91</td><td>1522.7912</td></tr>\n",
       "\t<tr><td>member</td><td>Jan</td><td> 117</td><td> 707.8803</td></tr>\n",
       "\t<tr><td>member</td><td>Feb</td><td>  52</td><td> 953.3269</td></tr>\n",
       "\t<tr><td>member</td><td>Mar</td><td> 194</td><td> 744.5825</td></tr>\n",
       "\t<tr><td>member</td><td>Apr</td><td> 269</td><td> 810.4424</td></tr>\n",
       "\t<tr><td>member</td><td>May</td><td> 356</td><td> 836.3904</td></tr>\n",
       "\t<tr><td>member</td><td>Jun</td><td> 480</td><td> 906.9396</td></tr>\n",
       "\t<tr><td>member</td><td>Jul</td><td>1068</td><td> 838.2079</td></tr>\n",
       "\t<tr><td>member</td><td>Aug</td><td> 499</td><td> 789.0581</td></tr>\n",
       "\t<tr><td>member</td><td>Sep</td><td> 516</td><td> 830.9302</td></tr>\n",
       "\t<tr><td>member</td><td>Oct</td><td> 518</td><td> 913.2606</td></tr>\n",
       "\t<tr><td>member</td><td>Nov</td><td> 335</td><td> 764.5761</td></tr>\n",
       "\t<tr><td>member</td><td>Dec</td><td> 245</td><td> 638.0816</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 24 × 4\n",
       "\\begin{tabular}{llll}\n",
       " member\\_casual & month\\_name & ride\\_id & mean\\_trip\\_length\\\\\n",
       " <chr> & <fct> & <int> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & Jan &   25 & 1301.4800\\\\\n",
       "\t casual & Feb &   15 & 7442.3333\\\\\n",
       "\t casual & Mar &  113 & 1969.4779\\\\\n",
       "\t casual & Apr &  196 & 2179.1735\\\\\n",
       "\t casual & May &  319 & 2883.1223\\\\\n",
       "\t casual & Jun &  513 & 2031.2612\\\\\n",
       "\t casual & Jul & 1148 & 4037.6690\\\\\n",
       "\t casual & Aug &  591 & 1851.4298\\\\\n",
       "\t casual & Sep &  516 & 1718.3140\\\\\n",
       "\t casual & Oct &  366 & 1402.1803\\\\\n",
       "\t casual & Nov &  129 & 1489.6977\\\\\n",
       "\t casual & Dec &   91 & 1522.7912\\\\\n",
       "\t member & Jan &  117 &  707.8803\\\\\n",
       "\t member & Feb &   52 &  953.3269\\\\\n",
       "\t member & Mar &  194 &  744.5825\\\\\n",
       "\t member & Apr &  269 &  810.4424\\\\\n",
       "\t member & May &  356 &  836.3904\\\\\n",
       "\t member & Jun &  480 &  906.9396\\\\\n",
       "\t member & Jul & 1068 &  838.2079\\\\\n",
       "\t member & Aug &  499 &  789.0581\\\\\n",
       "\t member & Sep &  516 &  830.9302\\\\\n",
       "\t member & Oct &  518 &  913.2606\\\\\n",
       "\t member & Nov &  335 &  764.5761\\\\\n",
       "\t member & Dec &  245 &  638.0816\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 24 × 4\n",
       "\n",
       "| member_casual &lt;chr&gt; | month_name &lt;fct&gt; | ride_id &lt;int&gt; | mean_trip_length &lt;dbl&gt; |\n",
       "|---|---|---|---|\n",
       "| casual | Jan |   25 | 1301.4800 |\n",
       "| casual | Feb |   15 | 7442.3333 |\n",
       "| casual | Mar |  113 | 1969.4779 |\n",
       "| casual | Apr |  196 | 2179.1735 |\n",
       "| casual | May |  319 | 2883.1223 |\n",
       "| casual | Jun |  513 | 2031.2612 |\n",
       "| casual | Jul | 1148 | 4037.6690 |\n",
       "| casual | Aug |  591 | 1851.4298 |\n",
       "| casual | Sep |  516 | 1718.3140 |\n",
       "| casual | Oct |  366 | 1402.1803 |\n",
       "| casual | Nov |  129 | 1489.6977 |\n",
       "| casual | Dec |   91 | 1522.7912 |\n",
       "| member | Jan |  117 |  707.8803 |\n",
       "| member | Feb |   52 |  953.3269 |\n",
       "| member | Mar |  194 |  744.5825 |\n",
       "| member | Apr |  269 |  810.4424 |\n",
       "| member | May |  356 |  836.3904 |\n",
       "| member | Jun |  480 |  906.9396 |\n",
       "| member | Jul | 1068 |  838.2079 |\n",
       "| member | Aug |  499 |  789.0581 |\n",
       "| member | Sep |  516 |  830.9302 |\n",
       "| member | Oct |  518 |  913.2606 |\n",
       "| member | Nov |  335 |  764.5761 |\n",
       "| member | Dec |  245 |  638.0816 |\n",
       "\n"
      ],
      "text/plain": [
       "   member_casual month_name ride_id mean_trip_length\n",
       "1  casual        Jan          25    1301.4800       \n",
       "2  casual        Feb          15    7442.3333       \n",
       "3  casual        Mar         113    1969.4779       \n",
       "4  casual        Apr         196    2179.1735       \n",
       "5  casual        May         319    2883.1223       \n",
       "6  casual        Jun         513    2031.2612       \n",
       "7  casual        Jul        1148    4037.6690       \n",
       "8  casual        Aug         591    1851.4298       \n",
       "9  casual        Sep         516    1718.3140       \n",
       "10 casual        Oct         366    1402.1803       \n",
       "11 casual        Nov         129    1489.6977       \n",
       "12 casual        Dec          91    1522.7912       \n",
       "13 member        Jan         117     707.8803       \n",
       "14 member        Feb          52     953.3269       \n",
       "15 member        Mar         194     744.5825       \n",
       "16 member        Apr         269     810.4424       \n",
       "17 member        May         356     836.3904       \n",
       "18 member        Jun         480     906.9396       \n",
       "19 member        Jul        1068     838.2079       \n",
       "20 member        Aug         499     789.0581       \n",
       "21 member        Sep         516     830.9302       \n",
       "22 member        Oct         518     913.2606       \n",
       "23 member        Nov         335     764.5761       \n",
       "24 member        Dec         245     638.0816       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "bike_rides_clean %>%\n",
    "  group_by(member_casual, month_name) %>%\n",
    "  summarise(ride_id = n()\n",
    "            ,mean_trip_length = mean(ride_length)\n",
    "            , .groups = \"drop\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "99188c74",
   "metadata": {
    "papermill": {
     "duration": 0.015355,
     "end_time": "2022-08-23T18:37:23.246861",
     "exception": false,
     "start_time": "2022-08-23T18:37:23.231506",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**calculating mean ride length grouping by member_casual and months**\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 24,
   "id": "55d82c27",
   "metadata": {
    "_cell_guid": "d33ded2b-fe9e-46a7-9c62-fc86758fc8da",
    "_uuid": "5152442f-d57a-439d-9706-130ff0c84bd1",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-08-23T18:37:23.279903Z",
     "iopub.status.busy": "2022-08-23T18:37:23.278662Z",
     "iopub.status.idle": "2022-08-23T18:37:23.395539Z",
     "shell.execute_reply": "2022-08-23T18:37:23.393774Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.135828,
     "end_time": "2022-08-23T18:37:23.397724",
     "exception": false,
     "start_time": "2022-08-23T18:37:23.261896",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1m\u001b[22m`summarise()` has grouped output by 'member_casual'. You can override using the\n",
      "`.groups` argument.\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A grouped_df: 24 × 4</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>month_name</th><th scope=col>mean_trip_length</th><th scope=col>ride_id</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>Jan</td><td>1301.4800</td><td>  25</td></tr>\n",
       "\t<tr><td>casual</td><td>Feb</td><td>7442.3333</td><td>  15</td></tr>\n",
       "\t<tr><td>casual</td><td>Mar</td><td>1969.4779</td><td> 113</td></tr>\n",
       "\t<tr><td>casual</td><td>Apr</td><td>2179.1735</td><td> 196</td></tr>\n",
       "\t<tr><td>casual</td><td>May</td><td>2883.1223</td><td> 319</td></tr>\n",
       "\t<tr><td>casual</td><td>Jun</td><td>2031.2612</td><td> 513</td></tr>\n",
       "\t<tr><td>casual</td><td>Jul</td><td>4037.6690</td><td>1148</td></tr>\n",
       "\t<tr><td>casual</td><td>Aug</td><td>1851.4298</td><td> 591</td></tr>\n",
       "\t<tr><td>casual</td><td>Sep</td><td>1718.3140</td><td> 516</td></tr>\n",
       "\t<tr><td>casual</td><td>Oct</td><td>1402.1803</td><td> 366</td></tr>\n",
       "\t<tr><td>casual</td><td>Nov</td><td>1489.6977</td><td> 129</td></tr>\n",
       "\t<tr><td>casual</td><td>Dec</td><td>1522.7912</td><td>  91</td></tr>\n",
       "\t<tr><td>member</td><td>Jan</td><td> 707.8803</td><td> 117</td></tr>\n",
       "\t<tr><td>member</td><td>Feb</td><td> 953.3269</td><td>  52</td></tr>\n",
       "\t<tr><td>member</td><td>Mar</td><td> 744.5825</td><td> 194</td></tr>\n",
       "\t<tr><td>member</td><td>Apr</td><td> 810.4424</td><td> 269</td></tr>\n",
       "\t<tr><td>member</td><td>May</td><td> 836.3904</td><td> 356</td></tr>\n",
       "\t<tr><td>member</td><td>Jun</td><td> 906.9396</td><td> 480</td></tr>\n",
       "\t<tr><td>member</td><td>Jul</td><td> 838.2079</td><td>1068</td></tr>\n",
       "\t<tr><td>member</td><td>Aug</td><td> 789.0581</td><td> 499</td></tr>\n",
       "\t<tr><td>member</td><td>Sep</td><td> 830.9302</td><td> 516</td></tr>\n",
       "\t<tr><td>member</td><td>Oct</td><td> 913.2606</td><td> 518</td></tr>\n",
       "\t<tr><td>member</td><td>Nov</td><td> 764.5761</td><td> 335</td></tr>\n",
       "\t<tr><td>member</td><td>Dec</td><td> 638.0816</td><td> 245</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 24 × 4\n",
       "\\begin{tabular}{llll}\n",
       " member\\_casual & month\\_name & mean\\_trip\\_length & ride\\_id\\\\\n",
       " <chr> & <fct> & <dbl> & <int>\\\\\n",
       "\\hline\n",
       "\t casual & Jan & 1301.4800 &   25\\\\\n",
       "\t casual & Feb & 7442.3333 &   15\\\\\n",
       "\t casual & Mar & 1969.4779 &  113\\\\\n",
       "\t casual & Apr & 2179.1735 &  196\\\\\n",
       "\t casual & May & 2883.1223 &  319\\\\\n",
       "\t casual & Jun & 2031.2612 &  513\\\\\n",
       "\t casual & Jul & 4037.6690 & 1148\\\\\n",
       "\t casual & Aug & 1851.4298 &  591\\\\\n",
       "\t casual & Sep & 1718.3140 &  516\\\\\n",
       "\t casual & Oct & 1402.1803 &  366\\\\\n",
       "\t casual & Nov & 1489.6977 &  129\\\\\n",
       "\t casual & Dec & 1522.7912 &   91\\\\\n",
       "\t member & Jan &  707.8803 &  117\\\\\n",
       "\t member & Feb &  953.3269 &   52\\\\\n",
       "\t member & Mar &  744.5825 &  194\\\\\n",
       "\t member & Apr &  810.4424 &  269\\\\\n",
       "\t member & May &  836.3904 &  356\\\\\n",
       "\t member & Jun &  906.9396 &  480\\\\\n",
       "\t member & Jul &  838.2079 & 1068\\\\\n",
       "\t member & Aug &  789.0581 &  499\\\\\n",
       "\t member & Sep &  830.9302 &  516\\\\\n",
       "\t member & Oct &  913.2606 &  518\\\\\n",
       "\t member & Nov &  764.5761 &  335\\\\\n",
       "\t member & Dec &  638.0816 &  245\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 24 × 4\n",
       "\n",
       "| member_casual &lt;chr&gt; | month_name &lt;fct&gt; | mean_trip_length &lt;dbl&gt; | ride_id &lt;int&gt; |\n",
       "|---|---|---|---|\n",
       "| casual | Jan | 1301.4800 |   25 |\n",
       "| casual | Feb | 7442.3333 |   15 |\n",
       "| casual | Mar | 1969.4779 |  113 |\n",
       "| casual | Apr | 2179.1735 |  196 |\n",
       "| casual | May | 2883.1223 |  319 |\n",
       "| casual | Jun | 2031.2612 |  513 |\n",
       "| casual | Jul | 4037.6690 | 1148 |\n",
       "| casual | Aug | 1851.4298 |  591 |\n",
       "| casual | Sep | 1718.3140 |  516 |\n",
       "| casual | Oct | 1402.1803 |  366 |\n",
       "| casual | Nov | 1489.6977 |  129 |\n",
       "| casual | Dec | 1522.7912 |   91 |\n",
       "| member | Jan |  707.8803 |  117 |\n",
       "| member | Feb |  953.3269 |   52 |\n",
       "| member | Mar |  744.5825 |  194 |\n",
       "| member | Apr |  810.4424 |  269 |\n",
       "| member | May |  836.3904 |  356 |\n",
       "| member | Jun |  906.9396 |  480 |\n",
       "| member | Jul |  838.2079 | 1068 |\n",
       "| member | Aug |  789.0581 |  499 |\n",
       "| member | Sep |  830.9302 |  516 |\n",
       "| member | Oct |  913.2606 |  518 |\n",
       "| member | Nov |  764.5761 |  335 |\n",
       "| member | Dec |  638.0816 |  245 |\n",
       "\n"
      ],
      "text/plain": [
       "   member_casual month_name mean_trip_length ride_id\n",
       "1  casual        Jan        1301.4800          25   \n",
       "2  casual        Feb        7442.3333          15   \n",
       "3  casual        Mar        1969.4779         113   \n",
       "4  casual        Apr        2179.1735         196   \n",
       "5  casual        May        2883.1223         319   \n",
       "6  casual        Jun        2031.2612         513   \n",
       "7  casual        Jul        4037.6690        1148   \n",
       "8  casual        Aug        1851.4298         591   \n",
       "9  casual        Sep        1718.3140         516   \n",
       "10 casual        Oct        1402.1803         366   \n",
       "11 casual        Nov        1489.6977         129   \n",
       "12 casual        Dec        1522.7912          91   \n",
       "13 member        Jan         707.8803         117   \n",
       "14 member        Feb         953.3269          52   \n",
       "15 member        Mar         744.5825         194   \n",
       "16 member        Apr         810.4424         269   \n",
       "17 member        May         836.3904         356   \n",
       "18 member        Jun         906.9396         480   \n",
       "19 member        Jul         838.2079        1068   \n",
       "20 member        Aug         789.0581         499   \n",
       "21 member        Sep         830.9302         516   \n",
       "22 member        Oct         913.2606         518   \n",
       "23 member        Nov         764.5761         335   \n",
       "24 member        Dec         638.0816         245   "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "bike_rides_clean %>%\n",
    "  group_by(member_casual, month_name)%>%\n",
    "  summarise(mean_trip_length = mean(ride_length)\n",
    "            ,ride_id = length(ride_id))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "b9127bfd",
   "metadata": {
    "papermill": {
     "duration": 0.015484,
     "end_time": "2022-08-23T18:37:23.428645",
     "exception": false,
     "start_time": "2022-08-23T18:37:23.413161",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**calculating mean ride length grouping by member_casual and week days**\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 25,
   "id": "74e2990d",
   "metadata": {
    "_cell_guid": "919b46ed-6c31-4d87-8e45-7c1e4d8665db",
    "_uuid": "fdfd2d02-4aa2-4bad-b4a5-33d7568253b4",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-08-23T18:37:23.462855Z",
     "iopub.status.busy": "2022-08-23T18:37:23.461622Z",
     "iopub.status.idle": "2022-08-23T18:37:23.548432Z",
     "shell.execute_reply": "2022-08-23T18:37:23.546695Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.106542,
     "end_time": "2022-08-23T18:37:23.550875",
     "exception": false,
     "start_time": "2022-08-23T18:37:23.444333",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1m\u001b[22m`summarise()` has grouped output by 'member_casual'. You can override using the\n",
      "`.groups` argument.\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A grouped_df: 14 × 4</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>week_day</th><th scope=col>mean_trip_length</th><th scope=col>ride_id</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>Sunday   </td><td>2090.8607</td><td>675</td></tr>\n",
       "\t<tr><td>casual</td><td>Monday   </td><td>2262.1674</td><td>460</td></tr>\n",
       "\t<tr><td>casual</td><td>Tuesday  </td><td>1577.1788</td><td>425</td></tr>\n",
       "\t<tr><td>casual</td><td>Wednesday</td><td>1497.9545</td><td>462</td></tr>\n",
       "\t<tr><td>casual</td><td>Thursday </td><td>1447.0381</td><td>499</td></tr>\n",
       "\t<tr><td>casual</td><td>Friday   </td><td>6194.7121</td><td>646</td></tr>\n",
       "\t<tr><td>casual</td><td>Saturday </td><td>1961.9719</td><td>855</td></tr>\n",
       "\t<tr><td>member</td><td>Sunday   </td><td> 909.6944</td><td>504</td></tr>\n",
       "\t<tr><td>member</td><td>Monday   </td><td> 765.0934</td><td>685</td></tr>\n",
       "\t<tr><td>member</td><td>Tuesday  </td><td> 829.8676</td><td>680</td></tr>\n",
       "\t<tr><td>member</td><td>Wednesday</td><td> 744.0999</td><td>711</td></tr>\n",
       "\t<tr><td>member</td><td>Thursday </td><td> 732.8382</td><td>680</td></tr>\n",
       "\t<tr><td>member</td><td>Friday   </td><td> 908.2274</td><td>708</td></tr>\n",
       "\t<tr><td>member</td><td>Saturday </td><td> 901.4420</td><td>681</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 14 × 4\n",
       "\\begin{tabular}{llll}\n",
       " member\\_casual & week\\_day & mean\\_trip\\_length & ride\\_id\\\\\n",
       " <chr> & <fct> & <dbl> & <int>\\\\\n",
       "\\hline\n",
       "\t casual & Sunday    & 2090.8607 & 675\\\\\n",
       "\t casual & Monday    & 2262.1674 & 460\\\\\n",
       "\t casual & Tuesday   & 1577.1788 & 425\\\\\n",
       "\t casual & Wednesday & 1497.9545 & 462\\\\\n",
       "\t casual & Thursday  & 1447.0381 & 499\\\\\n",
       "\t casual & Friday    & 6194.7121 & 646\\\\\n",
       "\t casual & Saturday  & 1961.9719 & 855\\\\\n",
       "\t member & Sunday    &  909.6944 & 504\\\\\n",
       "\t member & Monday    &  765.0934 & 685\\\\\n",
       "\t member & Tuesday   &  829.8676 & 680\\\\\n",
       "\t member & Wednesday &  744.0999 & 711\\\\\n",
       "\t member & Thursday  &  732.8382 & 680\\\\\n",
       "\t member & Friday    &  908.2274 & 708\\\\\n",
       "\t member & Saturday  &  901.4420 & 681\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 14 × 4\n",
       "\n",
       "| member_casual &lt;chr&gt; | week_day &lt;fct&gt; | mean_trip_length &lt;dbl&gt; | ride_id &lt;int&gt; |\n",
       "|---|---|---|---|\n",
       "| casual | Sunday    | 2090.8607 | 675 |\n",
       "| casual | Monday    | 2262.1674 | 460 |\n",
       "| casual | Tuesday   | 1577.1788 | 425 |\n",
       "| casual | Wednesday | 1497.9545 | 462 |\n",
       "| casual | Thursday  | 1447.0381 | 499 |\n",
       "| casual | Friday    | 6194.7121 | 646 |\n",
       "| casual | Saturday  | 1961.9719 | 855 |\n",
       "| member | Sunday    |  909.6944 | 504 |\n",
       "| member | Monday    |  765.0934 | 685 |\n",
       "| member | Tuesday   |  829.8676 | 680 |\n",
       "| member | Wednesday |  744.0999 | 711 |\n",
       "| member | Thursday  |  732.8382 | 680 |\n",
       "| member | Friday    |  908.2274 | 708 |\n",
       "| member | Saturday  |  901.4420 | 681 |\n",
       "\n"
      ],
      "text/plain": [
       "   member_casual week_day  mean_trip_length ride_id\n",
       "1  casual        Sunday    2090.8607        675    \n",
       "2  casual        Monday    2262.1674        460    \n",
       "3  casual        Tuesday   1577.1788        425    \n",
       "4  casual        Wednesday 1497.9545        462    \n",
       "5  casual        Thursday  1447.0381        499    \n",
       "6  casual        Friday    6194.7121        646    \n",
       "7  casual        Saturday  1961.9719        855    \n",
       "8  member        Sunday     909.6944        504    \n",
       "9  member        Monday     765.0934        685    \n",
       "10 member        Tuesday    829.8676        680    \n",
       "11 member        Wednesday  744.0999        711    \n",
       "12 member        Thursday   732.8382        680    \n",
       "13 member        Friday     908.2274        708    \n",
       "14 member        Saturday   901.4420        681    "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "bike_rides_clean %>%\n",
    "    group_by(member_casual, week_day) %>%\n",
    "    summarise(mean_trip_length = mean(ride_length)\n",
    "      ,ride_id = length(ride_id))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "22d04215",
   "metadata": {
    "papermill": {
     "duration": 0.015787,
     "end_time": "2022-08-23T18:37:23.582359",
     "exception": false,
     "start_time": "2022-08-23T18:37:23.566572",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Number of Customer By Day of the Week**\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 26,
   "id": "c4101086",
   "metadata": {
    "_cell_guid": "4c77e699-bbec-46a7-bfdb-22ccb81f3685",
    "_uuid": "a02a5a4e-2c51-4fd6-b585-7d95a93fa858",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-08-23T18:37:23.616784Z",
     "iopub.status.busy": "2022-08-23T18:37:23.615027Z",
     "iopub.status.idle": "2022-08-23T18:37:24.238424Z",
     "shell.execute_reply": "2022-08-23T18:37:24.235680Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.642699,
     "end_time": "2022-08-23T18:37:24.240534",
     "exception": false,
     "start_time": "2022-08-23T18:37:23.597835",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\n"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "bike_rides_clean%>%\n",
    "  group_by(member_casual, week_day)%>%\n",
    "  summarise(ride_id = n()\n",
    "            , .groups = \"drop\")%>%\n",
    "  ggplot(aes(y=ride_id, x=week_day, fill= member_casual))+\n",
    "  geom_col(position = \"dodge\")+\n",
    "  scale_fill_manual(values = c(\"#B25068\", \"tan\"))+\n",
    "  theme(panel.background = element_blank())+\n",
    "  theme_classic()+\n",
    "  ggtitle(\"Number of Member vs Customer By Day of the Week\")+\n",
    "  xlab(\"Day of the Week\")+\n",
    "  ylab(\"Number of Customers\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "cef5c694",
   "metadata": {
    "papermill": {
     "duration": 0.016229,
     "end_time": "2022-08-23T18:37:24.274186",
     "exception": false,
     "start_time": "2022-08-23T18:37:24.257957",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**no of rides per rider by month**\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 27,
   "id": "1e1ec7f3",
   "metadata": {
    "_cell_guid": "a1521d59-19eb-4989-a9fb-702296a75b25",
    "_uuid": "2cfd7067-add3-4d73-b2b6-93fbf98c6f51",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-08-23T18:37:24.308565Z",
     "iopub.status.busy": "2022-08-23T18:37:24.307248Z",
     "iopub.status.idle": "2022-08-23T18:37:24.622135Z",
     "shell.execute_reply": "2022-08-23T18:37:24.620623Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.333944,
     "end_time": "2022-08-23T18:37:24.623862",
     "exception": false,
     "start_time": "2022-08-23T18:37:24.289918",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\n2zQkbo7LMfPOKIrhy25F1OxF/fWf0jOZt8VAY/xHLxRTDqNeLC/+Nytv88F2z2xo52nQCTN4\nAq+T1yvYiUiJ3uvb53V5eHlZk/kn0tiVzi6Rs+dofPEpbZLd8bkWj9LviEhY4GkRiY24dCki\nJjb6rr3u+Qn0K8w5ISIPTz6Mv22WNxKmqGdEhfwVa7HYZ6lnSPCUXqEa2UXkyon7L6w5UfZZ\n6nfJ4XT33yHXo8wiEn5nxZq7YTmrfOWUYLaUlB7Uq3JuRcQ176Dq7vaP/pu552GUiMSEnRx5\nKtjBs+HQAm7WFUZu/bZmIffLv81t8HZxZ9fs5Ws0GjB2+p+ng5Pp8y0Xk4jsO/swmXXmzZ41\nc+bMY0nMkZuolFaS0isnpZ+aLT6OpLhky1u7w6id896xWGLndvjS2mhwLDa2cJaoR0c+v/xQ\nRB4FztkYFO7uO7Kqm52aPtVf/yk9k+7+7qk5SBHPNz1TtyEAzTBkdgEZTmc/6/fJPxbtu+XT\nd/e3v+CmZhNLOs9zoST4x13R2YmIonMQEYslWkQM9vkG9m+T6OY5ymeNv2hweOGHmOT/sCt6\nRUTMUak/wH79iy4eemjgX7f+VzXn2W++EpF6kysnUkEKDyrVMvzciohucvuCFWefGL72yo4P\nC13d9Gm42VJu0MS4Qpzzvhdw5tbBP9Zs2LRl1+69B3f9cmD7xuljB783dPX6SYkPldV9P99n\nE/85+uU+qdki0RUi7m3q3e9jRVHOftQnyboSXLcpr8SGV47Y6uNITt5mA6RrQOiNxSLTrC0t\nJ741pPnm78f/M2JJ1X/GzhWRKlM/VN+hyus/pWfS2pgKiWZrAK+V1y/YibgX6b2i/awW355t\n2eqbP5q8eP3o8HT++cUNt8MrujwzJHDvxHYRcSvuJyIG+4JZjfpgc9ikyZPTZep6O5fyekWJ\nuLc5VkT/7FsXd9wSEe8SqRweEJFCXYbK0Bbbh/wh+z6cPeu03i7n5JJeCVdL94NKSgafWyv/\nYf1k9kf/jv9BPhzzw2cHFJ1xWs9nvn8Uxa5c3bbl6rYVkdjw21tXf/NBl1EbP2/6v09C38/q\nkLDDIr37KJO6Xd/W80BIo7dcEhk9urxqiog4Zmvva69P+K5V4tdtSiqx6ZUjGXhVxNHpnUWe\niby5351qr/v98s8jzIu3DlhxUW/0nFPHR32HKq9/W59JAIjzmv7vXZOFv/o7Ga9t7j1i362E\n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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "bike_rides_clean%>%\n",
    "  group_by(member_casual, month_name)%>%\n",
    "  summarise(mean_ride_length = mean(ride_length)\n",
    "            ,ride_id = length(ride_id)\n",
    "            , .groups = \"keep\")%>%\n",
    "  ggplot(aes(y=ride_id, x=month_name, fill= member_casual))+\n",
    "  geom_col(position = \"dodge\")+\n",
    "  scale_fill_manual(values = c(\"#B25068\", \"tan\"))+\n",
    "  theme(panel.background = element_blank())+\n",
    "  theme_classic()+\n",
    "  ggtitle(\"Number of Member vs Customer By Month\")+\n",
    "  xlab(\"Month Name\")+\n",
    "  ylab(\"Number of Customers\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "7d0cb0f8",
   "metadata": {
    "papermill": {
     "duration": 0.017105,
     "end_time": "2022-08-23T18:37:24.657768",
     "exception": false,
     "start_time": "2022-08-23T18:37:24.640663",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**avg ride length per customer**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 28,
   "id": "4eb20c6a",
   "metadata": {
    "_cell_guid": "430d9752-0477-4193-9131-3ac203968a52",
    "_uuid": "8d3882b7-b045-4bec-b185-dd56d2852ccf",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-08-23T18:37:24.695797Z",
     "iopub.status.busy": "2022-08-23T18:37:24.694575Z",
     "iopub.status.idle": "2022-08-23T18:37:24.903659Z",
     "shell.execute_reply": "2022-08-23T18:37:24.902227Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.229913,
     "end_time": "2022-08-23T18:37:24.905465",
     "exception": false,
     "start_time": "2022-08-23T18:37:24.675552",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\nTsIOACAS2dADAAAYH8IOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLC\nDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACAS\nwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAg\nEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4A\nIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIO\nACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLC\nDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACAS\nwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAg\nEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4A\nIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIO\nACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLC\nDgAgEsIOACASwg4AIBLCDgAgEsIOACAS/xcU/rBsiTaTEAAAAABJRU5ErkJggg=="
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "aggregate(ride_length ~ member_casual, data = bike_rides_clean, mean)%>%\n",
    "  ggplot(aes(y=ride_length, x=\"\", fill=member_casual)) +\n",
    "  geom_bar(stat= 'identity', width=1) + \n",
    "  coord_polar(\"y\", start=0) +\n",
    "  theme_void()+\n",
    "  scale_fill_manual(values = c(\"#B25068\", \"tan\"))+ \n",
    "  labs(title = \"Average Customer Trip Length\", size =10)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "3cb0aef0",
   "metadata": {
    "papermill": {
     "duration": 0.016974,
     "end_time": "2022-08-23T18:37:24.939223",
     "exception": false,
     "start_time": "2022-08-23T18:37:24.922249",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Average Customer Trip Length by Month**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 29,
   "id": "5e195dfc",
   "metadata": {
    "_cell_guid": "a17d6964-5477-4a41-a1d9-3ad3c7a35d48",
    "_uuid": "008be497-5fc1-4388-9f39-1b97b04ba9a1",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-08-23T18:37:24.976680Z",
     "iopub.status.busy": "2022-08-23T18:37:24.975381Z",
     "iopub.status.idle": "2022-08-23T18:37:25.270687Z",
     "shell.execute_reply": "2022-08-23T18:37:25.269254Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.31656,
     "end_time": "2022-08-23T18:37:25.272832",
     "exception": false,
     "start_time": "2022-08-23T18:37:24.956272",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1m\u001b[22m`summarise()` has grouped output by 'member_casual'. You can override using the\n",
      "`.groups` argument.\n"
     ]
    },
    {
     "data": {
      "image/png": "iVBORw0KGgoAAAANSUhEUgAAA0gAAANICAIAAAByhViMAAAABmJLR0QA/wD/AP+gvaeTAAAg\nAElEQVR4nOzdd2AT5R/H8e8lbdO9GaUUKKVQ9pApo8gQ2XsqUzb8FNmCCAiiIhtZIorKlKls\n2cgSEBApe+9ZCqW7TX5/BGqhpVzapsXj/foreXL33PcGzYe73HOKyWQSAAAA/PfpsroAAAAA\nZAyCHQAAgEYQ7AAAADSCYAcAAKARBDsAAACNINgBAABoBMEOAABAIwh2AAAAGvEaBTuTMaKg\no52iKDq93aHHcVldTtYzJYSvnvlZy7cr+uX0drC1c/PMXrpKnaGTFtyLM2Z1aa+uok52SjI6\nnY2Le7bSVeuN/e73pNvur49LKYpSd+eN1PucHOChKMr6B9HprC3i5gxFUezdqqSzn8xx9sdq\niqJU+/FsGubNZbBJtgt0Tq4eRSvUGv7Nihhrjrkeevpd8xI9C4174UTG6KCnx8n2hzFWrCaJ\n9GxPAFpik9UFZJ77/ww9GxUnIiZj3OCVl7Z1CMzqirJSxPVtTas02XwpXEQMLl45fXOE3b55\ndM/vR/f8PnP6/I2H1r7pZZ+xSzQZI/buO2pjyFOhrF/G9pz5cvgHuOiVxLfG+Nj7N64f3b3h\n6O4Ni7fNDFnUKwtrezVZY+/75A9w0j3ZC6aEyKuXb544sPXEga0Lfh1x7vfPbJXU506vsHOf\nhUQOLuqYwp/QB+dGn4607n8dtfSvCUDGeo3O2O0YuFpEctXLLyKHR/6Q1eVkpfio03WK1d98\nKTxv9S7r/zwb/ejepUtXwyLCj21d3LS4Z/ilrfXK987w0x7xUWeqVKnydvO5GdxvVpj057Gz\nSZy/ePlBZOgvY5qIyInFvcedf2ieLF/LMfPnzx8Q5JGlxb4SrLH3vzt0PHEXnLtwPSoqbM03\nfW0V5cqWMe3XXcnABSWn6GxMxphBv19L8dPDny4TEVudFaOllv41AchYr0uwM8aH9vvjpqLo\nvv12uYNOeXR5/O5HsVldVJb5sVntPWHRud8ZfWrrvLrlCzxp1TkUr9Fm2cGjwW6Ghxd+6P6y\nC4hIStG7tvxkVZ9cziKyZOYZc6NXmYYdO3aslcMhS0t7XejsXBv0mb68VX4R2Trsd6suy81/\niF5RDgxfmcJnpvih668aXCvVdDdYtQYASNHrEuzuHOx/PSbBxa9ffd/Sowp6mEwJHy+5kEnL\nNsXceZV+tRYduqbXpmt6O581yz+2T7b/9Qa/yR8WEZGNAzZnQXEvY0qIjIpNsPIy0r6/WlbN\nISJhx8IytKBXgTEiOj6ra1Cl0tCSIhJ5a2u6ennZMWDnUnFgHpcHp0ecjXp+szy6MuFQeGye\nxuP0kv4zdv+ZzQ7g1fG6BLtNA38XkTKje4hIy7HlROTvsXOSTrC+ib+iKGW/+Pu5Ga9vbaUo\nimeh0Yktl3cv6tSkum92D4Oje2Dxcr1Hzz4X+cwf31NzKiuK0vd82OPL69tULeJs5/jznUjz\nR6aEh4smDqxZvoiXm5ONnUM2v4J13/1g06mHyepN2DDj42rF/F0M9tn9Cnca8l2UUYo62bn4\ndHtuupcWk9zZeWPiTCbfmjNKOdmmOEGxwfNWr149b2xh89t9vYooitL85P2k05gSHiqK4pSt\nZdLG0OPrPmj7TgEfL4OtnZtX7qoNOi/585b5oyWFve2cy4jIoytjFEXxKpR4Kdy4c8EXjaqV\nyObubOfk5l/szd4j596IeSa6mX8V/v7pO98NaZbd2c3RYOPskb1q054H7kWLJKyfPrBS4TzO\nBltX77x1Ow1L/kWbnv1lKWOMUUScA5zNb4+OfuO5myeMcXfmjuhRrqCfs8HgnSt/s27D/wlL\n+cxxGvasRV7a/5PNfvbBoZ+HF8vt7uxga2Nw8i9R9ZM5yRP/Sw7XF+99EZHw85u7Nq2Ww8vV\n1t4pX/HKw2ZuSs96JUSZt+czh5A1joHOw0sYEyIH7nj+xPY/n/8oIm1Hlk5pJtVHe6qbPTO3\nJ4D/HtNrICHmmpetXtEZDofHmkym2MfHDDpFUXRbHkQnThN6aqiIOOV8/7l5Z5bOJiLN118x\nv903uYNeURRFyZGvSOUKJb2dbETEybfG1tuRibOcnP2miHQ9vKmUq51DjoK16jX89X6UyWQy\nxj/qVj67iOhs3EuWrRT8Zrl8HgYR0dv5/HY3MulCZ3QoJiKKzr5g6UpBfp4i4lu9t5/Bxjln\n16STqSkmuWkFPUWk3parKrfe3p6FRaTZiXtJG43xYSLi6N0iseXuX5PcbXQi4pm/aJXgKkXy\nuYmITu887USoyWQ6OumzwQM6i4jBtfLQoUM/m3jIPNfU9iVFRFGUHPmLV6tU1sNWLyJuBRqF\nRMQl9nxmflURCWpSSET8S1ZuXK+Gn4ONiDj5NJ7epZSisy1WoWbDWpWd9ToRyVHpC0s30Yv2\nV4qKONqKyMI7ESl9GN8mu6OIdPzjpvn9kVFlROSdHdeffBx9qXVhj8T1DfJ1ExF7z8odcziJ\nyLrQfxeatj37+MY35i2cyjTq+zdv9poTOimK4uRToGbDxlXK5DP/0Wgw9Z+kvb30cE1x75v7\nLzZkhK9B75wrsFbDxlXL5Hna//HU6/ex0z+3xRLNruErIt7Fv7VoZdUfA/dPtROR7KXWRIdt\n1ymKd4npz01Q093e1ql4jNFU39NBRLaF/ftHRv3Rnvpmz/DtCUBLXotgd21LSxHxDPoysWVM\noIeIVEz6984YU8bZTkQ2JPm2iI8676LX6Q2+t2MTTCbTwwszDTrFzrn4t1vOmSdIiLs3q29F\nEXEr0D3h6VzmL4ns/s41Pl4UmWBM7O369pYi4pKnxanQJ3/rjfHhczoXFJHiAw8kTnZ1Q3cR\ncQtoffT+k8nOrP/KRa8TkaTBTmUxybXK5igiYy4/Urn1VAa7gXldRaT93L1PGxLWDK8gItnL\nfGd+H/v4sIi45hmROMvFFe+JiMGt3K/HnnQeG36mf3UfEcnb4MfEyczfWIpiO2TBQXNL1J19\n+extRERvm23Wtsvmxrt/zbRVFEXRX4yOt2gTvWh/pSjlYJcQe+PsoXFdyopI9or9Yp728Vyw\nW/1eoIi4BTTdefGhueXq/kWFHZ+cN02MKWnesyqDncr+zZtdRCr3/ynqaeuuaY1ExMGrYWJv\nKg/X5Hs/sf83ByxI3GIH5rV77rhKUfJgZ0yIunz6yNSP6pr77LblmkUrq/4YSAx2JpPpA18X\nnY3rpafHm8lkenxjpoj4N9lgMj0f7Cw62l+62TN2ewLQktci2H1TKpuINFpzObHl3OKaIuKc\nq2fSybZ1KCgilaaHJLZcXttIRPI1+tX89ocqPiLSe8eNZ3o3xrXP4SQis28+NjeYvyQcs7V+\n7jv43M/9mjRp8vGW60kbwy4MFJE872xObOmXx1VEZl58Jnj93rXQc9+UKotJrqyLnYh8dyvF\nc04pUBnsAh1sReRs1L/nHmIfHxk1atS4Caufvn3+q6hrLmcR+WjPraQ9x0WezGXQKzr7o49j\nzS3mb6xc1X5MOtmyMtlFpOgHu5M2dsjhlDSap3N/paiIY8rXr598p/accDfu326SBrv4qAtu\nNjpFZ7/+2bOzVzZ0fi7YpXnPqgx2Kvs3b3ZH72axSXOOMdrTVqc35EpsUHm4viiIOHg1jnmm\n/xg3G52NQ/7UV8Ec7F6kavd5lq6s+mMgabA7PrWiiLR4GiJNJtPBQSVE5KOQ+6Zkwc6io/2l\nmz1jtycALdF+sIuLOuus1+ls3C5E/fsf69jwv8yDEaxJcsHl4aUvRcTFr39iy4SiXiIy7nyY\nyWQymRL87W30tt7Ryf4/v79vUREJXvLklID5SyKo656X1hYdevm7fsWSBrv46Mu2ipL8uzns\n4rBnvynVFpNcE28HERl7JYPP2A0OcBeRfHX7rNsbEpPSKY/nvorioy7oFcXGISAu2cSLyuYQ\nkfZH75rfmr+xKk4LSTrNtib+ItIm5JmqPs/nliQhZfz+Mj0Ndjn8AwokFeDv5WAjIgb3ItN3\n//vNnTTYhZ7pJSIeBb5+rkNjQoSvQZ+GspNTF+zU9m/e7IV77n1usiKOtno7H/Nr1YfrC4NI\nUPfnN3t+exsbe1XBzif/M3uhYOFi1eq3nbPpdBpWVv0xkDTYRYWuE5Hsb/x72be5t6ONQ/7H\nCUbTs8HO0qM99c1uyujtCUBLtD9A8fXf+z1OMIo8zO+Qwsp+9t3ZBoOLm1+75h1U3X3UzmtT\n9zz6orKrXXzkiREnQx28GgzN7yYiCdEXL0bHi9yzf8HwVI9OPEr61uONFEYvi4+8tHDuzzv/\nPHL23IVLly9du/P8bRMxD3fGmUyuHjWfa7d3ryny70j3lhaTVHkXw+p7UfvOPBI/lxdNM3P6\ntDijqUa3PsVTGn81RSO2/vRX7Q5bN8yov2GGrXP20uUqVAl+q0nrjlWDPFOcPjZ8f4LJ5OxR\n1ybZGgTWyCGHbl8OCZOS3omNOrsUbvRxtH3h3T8Zsr9eZNKfx9plc0zaYjJGrhrXsvmI9QPr\nNe/9cHfysh6fPyci2d6s+Fy7onNs6e045Xp42sq2lKX9uxd3T6U3lYdrKrzKeqmZLEXfHTpe\nzyO1YbStegyIiL1HvfdzOv3w95Abse/nstNF3V2y4l6k39sTnJItztKjPfXNnor0bE8A2qD9\nYLd4yD4Ryf5GxYLPBrv4yNP7D989MWmiDJ7/tE33RfuAStNDhq+6vKNj4JX1/aOMpnKDPjf/\nKTaZ4kTExj7fwH5tUlxQzgrZkr61SZYj7x/+rnxw7wuP47wD36hesXy1Bm0LFCxSLP+O8hUm\nJU5jMkaLiJJsoARFeebak6XFJFWnXb5hnx899vU+qdkixQmiH6zv88GHiqKc6dH3RZ2I6fnB\nIJzzNtxy+vbB31f8tn7zrt17D+5ae2D7msmjBzccuvzXcY1T7OJFfSt6RUSMsekaIyb9+8si\nis6x2Se/lR3veOjRnpX3olp4Pz92nWJ+EkJKAcMzSTxNz55Vw9L+FX1qY3aoPFxTkWJezyiZ\ncAx80K/wvKGHBu6/vaiaz5nvJohI3S9SfKSbZUd76ps9FVbdngD+EzQe7OIijo4680BR9L9u\n31nRxS7pR7GP9jq6V4m4/eOye7NaPv0aLv7xBzK9x99jFkrHUQuHHVB0tpN6BZk/srEPyGar\nDzVGjvvii7T90e1Tr9+Fx3EfLTo4qW3ZxMZHl/5MOo2dc1kRiQ7bJjIqaXv0w+1J36anmEJ9\n+irjut3Y1utAeKPyz24Ts0vLxouIY/b2Bexf+PUcF5XSIykVu3J12par01ZEEqLubF3+3Xvv\nf7rmy6aLPopol+35oGPnUkGvKNEPNiaIPLeYCztui0iuYmk8aWGW/v1lOX1DT4dD4bHHI+Na\nyPPr65yvqMjvd/cdEnn+i39LkqfEWrvsjO1f5eGaVTLhGAh8f6gMbbF9yO+yr+P0aaf0dj5f\nlPBOPpm1j3YASKTx/95dXj0gxmhyzTuoYrIEY+f65ge5nUXkyxmnExudfLo39XZ4ePGLg7f2\njTkf5ll4bBXXpzMqtkMKuSfE3hn+551nezL2LRng4+Pz6/3UHuJuSnj4y51IG0OepKlORB6d\nOZH0ra1z6RbejjEP/5h7NTxp+19f/vJMd+koxsnn/fHlsyfE3Wtc75NHCc+fSIiPOtVx4D4R\nKTt8SNL2iNvPdHj992cutEXeWRAYGFiiYv/EFr1D9rfbD5sW6GEymTan9Hh7vX1AhxyO8VHn\nhuy//WwBZ/ofvqfo7AYUSt+TuNK3v9LGw0YnIlejUxhC2SX3R562urDzwzY/u9zQf8btSvqc\neGuXnaH9qz1cs4r1jwEH7+btsjvePTz46p0N825FZC/3tWfyq62ZcLQDwFMaD3bfj/hLREp+\n2jnFT7sOKiYip2Z8kbRxRO8gkzH23Y/axxlNdaa/l/SjDj/0FJGJtWovOXDT3GJKCP95YM0Z\nxy7EuLZq7JXaz30UvYu/vT4h9ur3IQ8SGw8un1Sr6VoRSUgyrO5XM5qKyODafU4+evIc8Qtb\nJjede0ZERPl3f6WnmA82rS7uZHtr99cFK7ddsfvE0xiScGzb4vrFKhwIj3XK+c6Kp6cqzT/3\n+bPHqNtPx+J/cGJ1w47rk3Zo7/F22OWLxw9M+/TX44mN90LWjrz4UFFsOuT49+dopoR/f9U0\nYmpDEfmmbuP1J588qiE+4sLHDd66FhPv987s8i6p3X+qRno2UdqYr4PdfhCT/CO9we/HtgVM\nCVGt3uyw71qEufHByQ2N3xqbyWVnbP8qD9enC0rXDwTTIBOOgYE9CyXE3mk59H8iUuOrGi+a\nzBpHe+ZvTwD/AVl994YVxTz8Q68oiqLf8zAmxQmi7q8zb4Qfb/879kfk3WXmRht7//vJ7mFb\nNbi2+dN8JcrXfKtygLe9iBjcSq9PMnqI+Q67qvPPPDfv3k+DRUSnd6rydsNWTd4pWTCHTu/c\ndshQEdHb+XTq1SdxAK3ZHUuIiM7WpVj5asXz5xCRBmNniYiL3yBLi3mRBydWVMz+5HKhnat3\n/gL+ns5Pzk265K256ca/PcQ83GMeNM7eu0i9pi3fKl/MQafYOZco7mSb9K7YfaPfNs+evUDJ\nGrVqlitRQKcoIlJr6CbzBAlx9ww6RVFs6zRv837fLSaTyWQyTnq3uIgoij53oTLVyhVxttGJ\niFuBxicjnx+y9c3ZJ5PWb74rtsuZ0KSNz94Vm979laJUByg2bajmKyJB3XeY3yYfoLhVkLt5\nfX0Lli5ZIKeiKAb38lM7Baah7OTMd8UqeoeglBQuUtKi/lPc7KZkt2ea1B2uyfe+uf/km139\nXbEpDlCcXMYeA0nvijWLuP2juX+djceNmH/HS0k2QHHaj3ZTss2esdsTgJZoOdidmFVZRFzz\nDk5lms45nUSk5NBDSRvfz+kkIgGtNqY4y5HfZrSsXT6bh7ONrX2O/CXaffh5SNgzwfHFXxIJ\na6cOqVQ0j4Od3tkj+5v131t97L7JZPqmY7CbvY2Tl9+j+Kc50hi3ZtrgdyqXdDM4+hasNOL7\nvVGh60XEPWCKpcWkIiHm1s9fDapXpWQOLzdbva2rR7ZSVesNmbzYPBpzUg9OrOnc4M3srk+C\noLNf1cUhD1p4Oz438OmeheMbVS2Tzc1Jr7Nx8cz15tttZqw+knSCnV92y5vdTWdjVzD4l8Qq\ntv44tn7lYp4uDjb2LnkKV+z56ZzrMc8UkJ5gp2YTZWCwu7C8tojobNzm34owJQt2JpMpIebm\nrGHd3gj0dbKzccvmW7f9gCOh0X/2K5aGspMzB7sXUXQOFvWvPtipPFyf2/uZFuzUrGx6gp3J\nZGrs5SAi2cvMSdqY/MkTaT7aTSlt9gzcngC0RDGZXni7FrJE6K0bUQmmHLl8k/5WJ+zcAI/A\nSf6Nt15Y/cJrPZkgPuL+xeuR+Qv6qb3pEVr3Kh+uAPAa0vhv7P6L5lcrljt37rEXnhnibt/Y\ntSJS/qOgLCrqCRsnr0BSHZJ4lQ9XAHgNEexeOc2/ri8ik2p1WffXhci4hIgHV1dN+1/Tn88a\n3Kt982bOrK4OeAaHKwC8UrgU+woyze9X9/1pvxuT7Bon3/LfbdzYphhjIuBVw+EKAK8Qgt0r\n6k7IjuXrdl64GWbn6ln4japN6ge7pHUwesDaOFwB4BVBsAMAANAIfmMHAACgEQQ7AAAAjSDY\nAQAAaATBDgAAQCMIdgAAABpBsAMAANAIgh0AAIBGEOwAAAA0gmAHAACgEQQ7AAAAjSDYAQAA\naATBDgAAQCMIdgAAABpBsAMAANAIgh0AAIBGEOwAAAA0gmAHAACgEQQ7AAAAjSDYAQAAaATB\nDgAAQCMIdgAAABpBsAMAANAIgh0AAIBGEOwAAAA0gmAHAACgEQQ7AAAAjSDYAQAAaATBDgAA\nQCMIdgAAABpBsAMAANAIgh0AAIBGEOwAAAA0gmAHAACgEQQ7AAAAjSDYAQAAaATBDgAAQCMI\ndgAAABpBsAMAANAIgh0AAIBGEOwAAAA0gmAHAACgEQQ7AAAAjbDJ6gJed2ua9kp/Jw1XzUp/\nJwAA4L+OM3YAAAAaQbADAADQCIIdAACARhDsAAAANIJgBwAAoBEEOwAAAI0g2AEAAGgEwQ4A\nAEAjCHYAAAAaQbADAADQCIIdAACARhDsAAAANIJgBwAAoBEEOwAAAI0g2AEAAGgEwQ4AAEAj\nCHYAAAAaQbADAADQCIIdAACARhDsAAAANIJgBwAAoBEEOwAAAI0g2AEAAGgEwQ4AAEAjCHYA\nAAAaQbADAADQCIIdAACARhDsAAAANIJgBwAAoBEEOwAAAI0g2AEAAGgEwQ4AAEAjCHYAAAAa\nQbADAADQCIIdAACARhDsAAAANIJgBwAAoBEEOwAAAI0g2AEAAGgEwQ4AAEAjCHYAAAAaQbAD\nAADQCIIdAACARhDsAAAANIJgBwAAoBEEOwAAAI0g2AEAAGgEwQ4AAEAjCHYAAAAaQbADAADQ\nCIIdAACARhDsAAAANIJgBwAAoBEEOwAAAI0g2AEAAGgEwQ4AAEAjCHYAAAAaQbADAADQCIId\nAACARhDsAAAANIJgBwAAoBEEOwAAAI0g2AEAAGgEwQ4AAEAjCHYAAAAaQbADAADQCIIdAACA\nRhDsAAAANIJgBwAAoBEEOwAAAI0g2AEAAGgEwQ4AAEAjCHYAAAAaQbADAADQCIIdAACARhDs\nAAAANIJgBwAAoBEEOwAAAI0g2AEAAGgEwQ4AAEAjCHYAAAAaQbADAADQCIIdAACARhDsAAAA\nNIJgBwAAoBEEOwAAAI0g2AEAAGgEwQ4AAEAjCHYAAAAaQbADAADQCIIdAACARhDsAAAANIJg\nBwAAoBEEOwAAAI0g2AEAAGgEwQ4AAEAjCHYAAAAaQbADAADQCIIdAACARhDsAAAANIJgBwAA\noBEEOwAAAI0g2AEAAGgEwQ4AAEAjCHYAAAAaQbADAADQCIIdAACARhDsAAAANIJgBwAAoBEE\nOwAAAI0g2AEAAGgEwQ4AAEAjCHYAAAAaQbADAADQCIIdAACARhDsAAAANIJgBwAAoBEEOwAA\nAI0g2AEAAGgEwQ4AAEAjCHYAAAAaQbADAADQCIIdAACARhDsAAAANIJgBwAAoBE2mbaki3uW\nL1y/98Tp6265CzV9v9/bxT1FRMS4Y8nMNbsOXw3XBxUr3+l/nfM72qSpHQAA4HWXSWfs7v31\nfb/xi7zK1fvk80/rFI6eOar/P5FxInJhxSeTl+6r2KzbyH4dnM9vHf7RHKNIGtoBAACQSae7\nZk5an7ve6F5NiotIkUJfXro5cv/ZR8VLuExaejKg7YSWtQJEpMB4pWWH8Quvd2qfy9aydl+n\nzFkLAACAV1lmnLGLDd93KDz2nZaBiQvtN2pMt5JeMQ93XYlOqF3b19xqcK9S2tnurx23LG3P\nhFUAAAB49WXGGbvYRwdFJEfIuiFL1p6/FZUjb0CDDv+rWypnbMQxESniaJs4ZWFHm43HHsZW\nt6xd3n3y9vPPP9+6dav5tbu7+8qVK629agAAAK+OzAh2CTGPRGTSzD9a9+jVJYfh5K5ls0f2\nivnm57fiIkTEy+bfs4betvr4x9HGGMvaE99GRUU9evTI/Fqv11t3rQAAAF4xmRHsdDZ6EXlr\n5MimQR4iUqhwyZt7W62eebxmHwcReRBvdH4awu7HJejd7XR2lrUnLujtt98ODHxywdfe3j4T\nVg0AAODVkRnBzsYxUGRfcF6XxJYKPo677t2wdSousut0VLyf4UlQOxsV71bF3dL2xG6rVatW\nrVq1TFgjAACAV1Bm3Dxh71HHw0a3+czDJ+9NCTuuR7oEBNi7v5XLTr9p9x1zc1zE0QPhsWVq\n5bS0PRNWAQAA4NWXGcFO0bsMaRK47fNPV+06dO70sWXThux6bNupZ5AodgNbBJ2bP2rLX6dv\nXjj+/acTHX1qdsjtbHE7AAAARBSTyZQZyzHF//7ztBVbDtyLscsbULhBx941CrmJiJgSNv80\nZenmA/ejlYCSwT37dyvgZJOW9v+sNU17pb+Thqtmpb8TAADwX5dZwQ4vQLADAAAZJZMeKQYA\nAABrI9gBAABoBMEOAABAIwh2AAAAGkGwAwAA0AiCHQAAgEYQ7AAAADSCYAcAAKARBDsAAACN\nINgBAABoBMEOAABAIwh2AAAAGkGwAwAA0AiCHQAAgEYQ7AAAADSCYAcAAKARBDsAAACNINgB\nAABoBMEOAABAIwh2AAAAGkGwAwAA0AiCHQAAgEYQ7AAAADSCYAcAAKARBDsAAACNINgBAABo\nBMEOAABAIwh2AAAAGkGwAwAA0AiCHQAAgEYQ7AAAADSCYAcAAKARBDsAAACNINgBAABoBMEO\nAABAIwh2AAAAGkGwAwAA0AiCHQAAgEYQ7AAAADSCYAcAAKARBDsAAACNINgBAABoBMEOAABA\nIwh2AAAAGkGwAwAA0AiCHQAAgEYQ7AAAADSCYAcAAKARBDsAAACNINgBAABoBMEOAABAIwh2\nAAAAGkGwAwAA0AiCHQAAgEYQ7AAAADSCYAcAAKARBDsAAACNINgBAABoBMEOAABAIwh2AAAA\nGkGwAwAA0AiCHQAAgEYQ7AAAADSCYAcAAKARBDsAAACNINgBAABoBMEOAABAIwh2AAAAGkGw\nAwAA0AiCHQAAgEYQ7AAAADSCYAcAAKARBDsAAACNINgBAABoBMEOAABAIwh2AAAAGkGwAwAA\n0AiCHQAAgEYQ7AAAADSCYAcAAKARBDsAAACNINgBAABoBMEOAABAIwh2AAAAGkGwAwAA0AiC\nHQAAgEYQ7AAAADSCYAcAAKARBDsAAACNINgBAABoBMEOAABAIwh2AAAAGkGwAwAA0AiCHQAA\ngEYQ7AAAADSCYAcAAKARBDsAAACNINgBAABoBMEOAABAIwh2AAAAGkGwAwAA0AiCHQAAgEYQ\n7AAAADSCYAcAAKARBDsAAACNINgBAABoBMEOAABAIwh2AAAAGkGwAwAA0AWW10oAACAASURB\nVAiCHQAAgEYQ7AAAADSCYAcAAKARBDsAAACNINgBAABoBMEOAABAI2wsmvrRrSt3I+KStwcE\nBGRQPQAAAEgjtcEu6u6WlsFt1528l+KnJpMp40oCAABAWqgNdt82ar/+1IN6PQe/XTSPjWLV\nkgAAAJAWaoPd53/d9W+xYt2sxlatBgAAAGmm9uYJW53ke7ekVUsBAABAeqgNdsNKel/8+YhV\nSwEAAEB6qA12769flGNnx24Tlt2JjLdqQQAAAEib1H5j5+/vn/RtvMTtH9Rq3mC9p4+vi90z\nifDixYtWqQ4AAACqpRbsSpUq9VxLWWuWAgAAgPRILditWrUq0+oAAABAOqn9jV2lSpUmXHuc\nvP3W3g+q1mifoSUBAAAgLV4yjt2ji+duxiaIyP79+/OfPHk6wvXZz03H1+3a+8cla1UHAAAA\n1V4S7Fa8U6HLmVDz60Vvl1+U0jSu+fpkdFUAAACw2EuC3ZufTZodFi0iPXv2DB4zuW02h+cm\n0Nm6VGrewlrVAQAAQLWXBLtCrTsWEhGRJUuWNOnStUcu50yoCQAAAGmg9lmxa9euFZGIiIjn\n57c1GOzUdgIAAADrUZvJnJ1feK5OZ+Po6x9QIbhOjwHDawW5Z1BhAAAAsIza4U5mz5pWxs2g\n6OxK12jYvc8HH/bt1bR2WYNO8S7Tsm/PDhULZ9u9YEqd4v5zzz20arkAAAB4EbVn7MrdX9Y3\nJufiw4dal/RObAz9Z3m5ih2dx535pY5v7KPT7xUpO7zVwm6He1unVAAAAKRG7Rm7fl8fCHh3\nQdJUJyKexVss6Jh3Svv+ImLnWmj8jPJhp6ZmfI0AAABQQW2wC4mMc/RzSt7ulMcp+sHv5tcO\nvk4JsTcyrDQAAABYQm2we9/X+fSM0VdjEpI2GmNvfDblpHOuTua3G8b+Y+9ZL2PrAwAAgEpq\nf2M3ZNXIWWUHFQms2qtnm7JBeQ0Sc/n04V/mzNh3Xz/x4CcxD7c3q991/Z5LDWdvsGq5AAAA\neBG1wc6rVP/T2z079x329fAPExvdA6vO2bakaymviJsn/jhv1/PLlbN6BFmnTgAAALyEYjKZ\nLJrh5tkjR09djkywyelfuEKJABvF3GwSUaxQnvatador/Z00XDUr/Z0AAID/OsseGhF67cIj\no2P+goVFRCT+/JnT5vZChQpldGEAAACwjNpgF31vS/MqrdefDk3xU0tP+wEAACDDqQ123zZu\nv+FseINeQ98pkc+Gi64AAACvHrXBbuzBu/lbr1wzs5FVqwEAAECaqRrHzpQQfjcuIW/rEtau\nBgAAAGmmKtgpeufq7vYX5h+ydjUAAABIM5VPnlCWrB0Tu+G9TmN+vB0Rb92KAAAAkCZqx7Gr\nWrVqxLWjRy49VhS9Z86cDvpnbqC4evWqdcrTPsaxAwAAGUXtzRPe3t7e3rXylrJqMQAAAEg7\ntcFu1apVVq0DAAAA6WTZkydOb126eNO+K3dCq301u43t3j9vlAgult1KlQEAAMAi6oOdaWbn\nKn3m7zW/cRwxrf7jaW+VXlut6/Qtc/owZDEAAECWU3lXrJxf2KzP/L01+0z5++x1c4tH4Phx\n3SvtnNu30exTVisPAAAAaqkNdmMHbPYsPHTLNx+WKJDL3GLjGDR09p7Rxb12jhpjtfIAAACg\nltpgt/xeVECndsnbm3bIH31/TYaWBAAAgLRQG+zyGPThZx8lb38Q8lBvyJWhJQEAACAt1Aa7\nYRWyn1vQYf+96KSNkTe2dV56wbv0ECsUBgAAAMuoDXbNln6bR7kS7F+qx8DPRCRkyfdjBnUq\nEljnitFn+rJW1qwQAAAAqqh9pJiIPDq7oWePAUt3nDKaTCKiKPqib7X64puZDQq7W7NCjeOR\nYgAAIKNYMECxa2DdRdvqzrt7MeT8jXi9Q+7AorndDaaEuJiYGIPBYL0SAQAAoIbaS7GJHLL5\nl61YuWK5MrndDSJycGAZe3t7KxQGAABeX456XWDbXVldRdaYHODh6NUgbfNaHOwAAADwaiLY\nAQAAaATBDgAApMoUGxOv9lbLzO7tZYzxYQmZtrBXAMEOAACkYElhb7e8nx78tn9uN2cHO717\n9vzvDfvJKHJo/pDS+XI4GJz9i1QYtfhE0lkeX97Vr02dPNncDU6eQaVrjJ6z3piO3kTk2PIv\ngovndbIzePsGtf1w4vXYBDXL+qGQl0fA5JiwA+9VL+Js8Hyc8PIceXPPwla1y3q52Du6ZatY\n991lB+8mfnTytxlNqpfxdnOysXPwCSjRcfC00KfB1Bh3b8bQLiUCctrb2rp6+dVs/UHiiL+D\n/Vxd/QYnXcTR0W8oinIpJuGl3aaHBXfFAgCA10rknYVV+j54t9+ICn6G32Z+sfCLjqcvzAvZ\nGtm//ycdEi5O/Xz6Z+3L1qofVsXVTkQibqwuVbjVFcX33c7dCnjr/96xbFTP+qv3/nDkx05p\n6E1E7h7+tMwve2u17DigscvfO5cvmTZwy66zV/6a7aB7+bKM8aEdS71zv2r7cdM+cNApqa/m\nrd1jA6uPNHmX69BjSHZ96Mp537WpvPHR6Yvv+7teXdenWJNZroWCu/5viKdd/Ik9K3/6+sN9\nNwLOLKgvIlPqlRq49dZbrbu37Or36Mqh2XNn1PrjyoPrq21fskBJvdv0SC3Y7dy586Xzn7wW\nkc4KAADAqyk++sLArde/rpFLRDq+W9TBq8GR1ed23rpQ2d0gIo0C/i7Qbtv0a+FViniJyIS3\nu15RCuy8criSl3m4jC9XDyjddFLnz0c2HZ7fzdLeROThmZ0DVp6e0LSgiIhp/A+9S3eZPee9\ntR+vaJT3pcsKv/p52LRDm/uWeflKmmLbN/rc6P724fO/BTnZisjHQ1r45qzxSbv17+9rs33I\nLzqD399Ht+Qx6EVE5LNsuV1nb5wjUj8+6sygrTf83lm+dXEzc0/NXCo3+mHPyntRrbM5pL7M\nVLpVu29eILVgV7169XT2DgAA/rtsHYPMOUxE7D3ru+h1jsWmmHOYiGR7s6rItqg4o4jER4aM\nORFapP+Gp0lLRKTep1NlUvDSWWeGf13Oot7MnH26P0l1IqLYtJ+8qu/cQn98uiO+VtmXLksU\nw089SqlZx/Drk7c8iK4yb6o51YmIvWfw6lnf/GPyFpEWu083MBk8n8QvMRkjYkwmU0KkiCg6\nBztFwk6uPHS1dlk/FxGpNH7P3fGqNmwq3aZTasFu1KhR6V8AAAD4j9LZeCV9a6OIIZtH4ltF\nZ5v4Ojp0Q4LJ9M/E8srE5zt5+M9DS3sz8yje4pnp7QvU97Rff/uP6NC7L12WnXOp7LaqbiR4\ndHa7iFSukSNpY9X3e1UVERFHd8/Qgxt/3Lgr5Mz5y1cunTz29/WwGHt3ERG9wW/TF+0bDFtQ\nPu/ivMUqvFmxYrUadVq2eNvT5mUXYlPtNp1SC3YjR47MgCUkEx32wOjq7viyC94AAOA/Q2cn\nIsUHf594Ti6RwU3VmbPkkgcFG0UUnUHNshSdk8qlGGOMImKnpBxLVgyo2XLydt/SNRq+VbFB\n5XcGfFbyevfafe88+bTa4B/vdPp49eq1O3bt3rN5/qK5k/t/VHH18e21vVJ4doPJaFLZbXpk\n9s0T0ff3vd/1y2qzFvXIad7ixh1LZq7ZdfhquD6oWPlO/+uc39EmTe0AACDL2HvW0yv94sMK\n1anzZmJjfNSpFb/9nbOkY9r6DD2+WqR24tuEmEtr7ke7Vqpp71kiA5flWrCMyOY9B+5JXtfE\nxm1Dev1832PO5EatJ2/3qzf78truiR/98PRF3OPTh0PCvEq+0ab7wDbdB4rIyQ1jitT79MNP\njpyYVclcctIF3T4Uan4RG74/lW7TKVNTkckYNXPo1PAkdx1fWPHJ5KWX3+vTt4tH/Lo5M4Z/\nFLtwTh+d5e0AXilrmvZKfycNV81KfycAMoeNfYFRRTxH/9xx6+i/a+Z8kq4W92nccf7ZH289\nTlufj2/MHLZuwLj6+UVEJGHRwMaPE4ztx1e2sc+RgctyzftxSefJf34w8GLDZf72ehGJfbiv\nw9S5MQUnxEeeSjCZPEu9kThx5M29E6+Hi61JRCJuz6pYcWrpkQcOjypn/jRf2XIiEh8RLyKO\nel303XX34r72ttWJSPT9/b23XTdPlnq36ZSpwe7I/OFH3KrL7fVP3ptiJy09GdB2QstaASJS\nYLzSssP4hdc7tc9la1m7r9rTrQAAwEr6rZ85t+C7dQOKNW3T6I1Az+Pblv68+UzxTj+3z57G\nM3aGbPZfNipy/N0u5QJcjmz/ZdXOS351xsyolCNjl6Xo3X5d0Duw6dTiBYI7v1cnp23Yqrmz\nbyY4zVjeyTGbfS2v3tu/btDXduAbuR0vhOz/bvZvATntY68enrZwWZdWo2pl+3brmGr1LnSu\nWDS/MezS6u++19t6jRpXWkQatS84euzBkjU6DH6vRtytU/MnTb3tbSfX4kXEMVubVLp9v22L\nl5Wcmsw72/Xw3MpxG6NHjGye2BLzcNeV6ITatX3Nbw3uVUo72/2145al7YkdRkVFPXoqPDw8\ns9YMAACIc55Wx46t7fJ2nl0r540YM/XgXc+Rczcc/v69NHdYYcreuSM6XN29atzYKbsvunT5\nZO7xdcMVKywrb+PJJ9fPqpn/4U/Tx4yZ/IOpaMMfd53uWdBddParj6x5r0be1dNH9vtkwu4z\nxrmHLqxeNiKPS+ygnn0emlx++2dL35ZVQjYsHDNs6KS5v7pXabf8wOl2uZ1FpPToHd/0b+ty\ndeugXl0Hjfo6rHib338JfrK8VLsNizemVuvLKCZTZjzWwxh7c2jHvgUHznm/lL5x0471v13c\nI6dT+PVJ7/baMX3ZqrxPb/dd0rXNRq/B0z/YYVH7/K+ejFLzySefbNy40fzaw8Nj8+bNmbBq\n6cQVK2gSBzYAmBljHl27G58nt2fmLM6yS7Gnty5dvGnflTuh1b6a3cZ27583SgQXy65mxg3j\nR4SV6dP1DW9TwoPERmNMhIh42fx71tDbVh//ONrSdotWAQAAINPoDK55cmfe4tQHO9PMzlX6\nzN9rfuM4Ylr9x9PeKr22WtfpW+b0SX3Eljv7Z/xwMufs+dWfa9fZOYjIg3ijs/7JGbj7cQl6\ndztL2xM7bNOmTeKgynZ2/7YDAIDX06VVDUp32ZPKBAa34FuXVmdaPdamNtidX9isz/y9NftM\nmdSvZclAXxHxCBw/rvv9j+f0bVS65vpeQanMe/ePY7HhN7s0b5LYsq57281OJRfMrCKy63RU\nvN/TS6tno+LdqrjbOhW3qD2x22LFihUrVkz1ugMAAI3L13Ttg6ZZXUQmUhvsxg7Y7Fl46JZv\nPvx3TsegobP3xO71/mrUGOm1MJV5AzoMm9Q0zvzaZHw0YOCoysM/b5ndy97dO5fd7E2779Rq\n4CcicRFHD4THNquV0949j0XtaVtzAAAAjVF7V+zye1EBndolb2/aIX/0/TWpz2ufI2+BRAH+\nIuKeN39+/1yi2A1sEXRu/qgtf52+eeH4959OdPSp2SG3s8XtAAAAUH/GLo9BH372UfL2ByEP\n9YbnH+ihXoHWY3vHTFky+dP70UpAyeCxn3XTpakdAAAAaoc7WVgjd6d9hj+uhlT0tlcUpc+5\nB98EuEfe2Fa8QJ2oMt/e2N3Z2oVqFaNCQJM4sAEgS6g94dVs6bd5lCvB/qV6DPxMREKWfD9m\nUKcigXWuGH2mL2tlzQoBAACgitpg55Ct3pG/f2teTvfdpFEisuOTASMnLnCp2HLVkWPNfXii\nFwAAQNazYIBi18C6i7bVnXf3Ysj5G/F6h9yBRXO7G6xXGQAAACySWrD79ddfU/n09o2rfz19\n3bhx44wrCQAAZDHrPXLdxcXFSj1DUg92TZo0SeXTpDLngbMAACDT7OgwOMP7rP7T+AzvE0ml\nFux27NiR+NoYd2fEu50ORuXq8r/uNSoWc9dHnw3ZN3v89Jt+LXasn2T1MgEAAPAyqQW74ODg\nxNfbexY7GBm46/KfFTyf/K6udr2m3ft0ru5TusXw9ifnvW3dMgEAAPAyau+KHbzobMB7sxJT\nnZmNY+HJXQueXzrQCoUBAADAMmqD3bmoeJ1dShPrJCHmWkZWBAAAgDRRG+xaZXM899OQSzEJ\nSRsTYq4Mm3fWMXsbKxQGAAAAy6gNdsNnt4sJ21myWN0pP6/af+TkyaN//rpwWr3iJbY8iG47\na6hVSwQAAIAaagcoztNozrYpNq0Gz/mow+bERr1dtt5Tts5olMc6tQEAAMACFjx54q0PZ9zo\nMmjT2s3Hz9+I09n7Fiheq97beZwt6AEAAOBV42mrb3ri3rxAj6wuJANYFstsXfI1aNutgZVq\nAQAAQDqkFuxKly6t6AyH/9pvfp3KlEeOHMngugAAAGCh1G6ecHZ2dnZ2Nr92T1WmlAoAALQs\n7nHI4HZ1C/q6O7rnqNlm4D+P48ztUXf29mpaLae7s43B0b9Y1XHLTpnbL22cXb9cEU8ng7dv\n/sY9v3yUYBIRMcUoivL51X+fdZvLYPP+2Qep9KMlqZ2x++OPPxJfb9++3frFAACA15Uptlvp\nymud6839YV1OmzvT+nSpXkHuh0wQkaGV66/wbP3Db1/7OsTvXDS4f9vybRs+8I3dW6JBn6of\nz14/u2zklX0d2n5QL6jh7n5FU1lCiv342+szaw0zA7c+AACArBd6ctBPF2J3hM6v5mYnIiW2\n3mvw7qKbsUYfO12+7h/P6/S/+tkcRCQoYFi/KQ2ORMR6hW8MTzD26P1uRR9HeaP0lhU+Zx29\nUl9Eiv342ztkwtplmpcHu5jQy8fOXLNzy1m8cEDyC7fht05NH/DhsIWbrFEcAAB4TVz7ba+9\nx9vmVCciTrm6bd/ezfy6X/9e239bMf746UuXLhzdvc7c6Jz7o/fK/dAsn39w3berVK5cu26T\nhsVypr6IFPvRmFQHKDZGTepa2yWbf/lKVUoVKZAtqObGK4+NsTdHdWkY5O/r4ebqaLBx9Sk8\nfNHvmVUtAADQJmOMUdHZJ29PiLnaIDB3688WP9R7VW3w3rRlC83tOhvvnw9c+2fbD43K5T65\n7afapXLXHbo5+ewiEm00pdKPxqR2xu6fiXUHzNtp6xTQqH6VHE4xu1asbFGh/eSKR0evvpS9\nYKlSZYMUk8nJ3TugaMVMKxcAAGiSb4MS0WNWHHocV9bZVkQib/8cUGrwDyculb0yYMPl6JvR\na3LY6kQk8s6TQHZ7z6QvVsVOmTC0cOV6H4qcmP1m6UGD5csnw3SExhnNLyLvLHsQbxSRB6dS\n7kdjUgt24yYctHUMOnD1aCkPg4jETT1RMmep7qvjao3fsXlQcGZVCAAAtM+71PSGOZbVr9V9\n3he9ctndn9b7o2jn5u94GMIjypmMyyYs2dH3Lf/rIbu+HDBcRE6cvxOcPXzqxFGh7jl7139D\neXj+mxmn3QoNEBFRDBVdDUu6jWs3s7dd6InPu/fUKYqIGLxS7qexV94sXe8Mltql2A2h0dnL\nTTanOhGxdSkyuUIOEZn1v8qZURoAAHhtKHrnpf9sa+V79cN2tas37XG5aNcdh6aLiEvuQRvH\n9/5tWOugom/2n7C594qQbuX8Rlcpdsln2IaJff/+fki1cmUavNv/bqmuO3YMMnf12+/Tg+78\nUrVo/hJv1rtW7rPW2RxS6efo00FVtEExmUwv/ExRCnffe2JOpcSWPz8sVnFaSCqzwFJrmvZK\nfycNV81KfydABuLABv7rwsPDd3QYnOHdVv9pvIuLS4Z3myKTMep2qCmnt2PmLO4V8bK7Yp89\no6foFOuVAgAAkFEUnUNO76wuItOlelcsAAAA/jsIdgAAABrxkkux9w59P3r0v8PUXd9/R0RG\njx793GQjR47M8MoAAABgkZcEu7uHvht16PnGUaNGPddCsAMAAMhyqQW7HTt2ZFYZAAAASK/U\ngl1wMKMQAwAA/Gdw8wQAAIBGvGwcOwAA8Fqq/tP4rC4BFiPYAQCAFFza9W2G95mvWvcM7xNJ\ncSkWAABAIwh2AAAAGmHZpdjTW5cu3rTvyp3Qal/NbmO7988bJYKLZbdSZQAAALCI+mBnmtm5\nSp/5e81vHEdMq/942lul11brOn3LnD42ipXKAwAAgFpqL8WeX9isz/y9NftM+fvsdXOLR+D4\ncd0r7Zzbt9HsU1YrDwAAAGqpDXZjB2z2LDx0yzcfliiQy9xi4xg0dPae0cW9do4aY7XyAAAA\noJbaYLf8XlRAp3bJ25t2yB99f02GlgQAAIC0UBvs8hj04WcfJW9/EPJQb8iVoSUBAABYReTt\neYqiXIpJyOpCrEVtsBtWIfu5BR3234tO2hh5Y1vnpRe8Sw+xQmEAAACwjNpg12zpt3mUK8H+\npXoM/ExEQpZ8P2ZQpyKBda4YfaYva2XNCgEAwGslIc6YhbO/UHxkmFX6zVBqg51DtnpH/v6t\neTndd5NGiciOTwaMnLjApWLLVUeONfdxsmKBAADg9ZDLYPPJ5u9L53Qx2NjmLFDh2wN3D/04\nKMjHw+DsXaFpv3tP85ox9sYXfVqUDMxt7+xVPLjl/L23LJpdRO7s/6FWqXwOdva5ClUY9dNf\nqXfraauffuXqgJZv+fp3yMSNkUYWPHnCNbDuom0nHt8+f3Df7n0H/roSGvHP1kUNCrtbrzgA\nAPBamdR0Ys/vt5w5vqeFy4XeVYs3W2L6YdOBnUtHnVwzvc2Ki+ZphgeX+XqnMnjqz3u3ruxZ\nSd6vVuC7sw/Vzy4ijRqMC/5w0ratv35Qze6zTuWG77uderfLu9Zzqzdw576Mf3huhlNMJpOa\n6SIiIlJst7E1GOwse3wFklrTtFf6O2m4alb6OwEyEAc28F8XHh5+aVfG55h81bq7uLi86NNc\nBpv8M0J2dy0kIrf21c9VeePfj2OKO9qIyFh/98X1NobMqPj4+mRXv4HbQyOD3Q3muaYU9pqU\n+8crmxuomT3y9jynnF0bLT73a5sA8+zDinp9K59e+t34om49bfU5umw+OadGhm8Na1CbyZyd\nnV/0kc7G0dc/oEJwnR4DhtcK4gQeAABIoxyVvc0vbN3t9YY85lgmIl42OpPRJCJhpzaaTMbq\nHvZJ53KPPS3SQM3sZn3fyZ34+t3ugZM+/SXslHMq3RboVCRD19KK1Aa72bOmfTt00JFwU6nq\ndcoV9ndQ4q6cPrh+618upVq0e9Pr5pUzfyyYsnL+d7NPXupWwM2qFQMAgNdDCj8Ys3Vz0Nm4\nPwy7lvRpporOTuXsyT+w87RTdLapd+vqmWL/ryK1v7Erd3/ZsZiciw9fP7z1tznfTJ0yfebK\n3w/eOPqL66l1zg0++eXXrZdvH2+eI354q4VWLRcAALzO3PJ3MyU8nHMjzukJx5GN63RfcMGi\nTmZsuZH4evHEk24F22dIt68CtcGu39cHAt5d0Lqkd9JGz+ItFnTMO6V9fxGxcy00fkb5sFNT\nM75GAAAAERGx96w/ubbviCqN5izdcOzI/ol9q07dc71ji3wWdbKmQ+2vFqw5tH/bpD41R/3z\naNj8xhnS7atA7aXYkMi4vH4pDGvilMcp+sHv5tcOvk4JsTeSTwMAAJBR/rf2r8gPuo/r3epW\njCGo9Fs/71pd28Ogfna9nc+mSS2HjO428mp0gVJvfL3y+AeFPdLf7StC7V2xg/3dZkS8derq\nCj+DPrHRGHujVZ6Cmw3dHl6eLCLzm/j32Vs+4s5SaxWrRdw8CE3iwAb+67Lkrlikn9ozdkNW\njZxVdlCRwKq9erYpG5TXIDGXTx/+Zc6Mfff1Ew9+EvNwe7P6XdfvudRw9garlgsAAIAXURvs\nvEr1P73ds3PfYV8P/zCx0T2w6pxtS7qW8oq4eeKP83Y9v1w5q0eQdeoEAADAS1gwtnCuqp02\n/d3p5tkjR09djkywyelfuEKJAL0p8lF4pKtP70c3+1ivSgAAALyUxQ+N8Aks7RNYOvHt1c1N\n8zc6FRd9OUOrAgAAgMXUBjtTwuNv+nX7ceuh+1HxSdtvXbmsOPxnhmMGAADQMLXj2B35rPoH\n3yx55O5f0Cf+0qVLQSVKlSwRZHP/huL51sxfN1q1RAAAAKih9ozdsOkhXsXGntk73JTwOL+z\nR5Vvfhru5xJ1Z2cx/3qPc6Uwvh0AAAAymdpg98ej2MIDGoiIondun91x2+H7w/1cHLIH/9Qp\nX+MWc/uFDLZmkQAAILPlq9Y9q0uAxdReivWwUeLC48yvK+R2uv7rdfPrvM1yh52bbJXSAAAA\nYAm1Z+y6+rp8/cOXV0cv9TPo/Rr5Xpv8rUhlEbm19bY1ywMAAFmA50P8R6k9Y9fj+25Rd1cG\neOe5GJ0Q0KFr5J2fK3Ue/PVnHzWYeNyz6BCrlggAAAA11J6x8wkef2SFz+g5a3SKOPn0WNxv\n+btTJuw3mVwD6izf2MOqJQIAAEANlcHOGBMTV6TJRyubfmR+33rS5rofnbkYYV+kUB5bxXrl\nAQAAQC1Vl2JNCeHujg61fzmftNHVr2DJIFIdAADAq0JVsFP0bgMKe174/qC1qwEAAECaqb15\nYsQf60tc/V+fab/ej0mwakEAAABIG7U3TzRoNdyYI8+sfk1nfWSfwyebve0zifDixYtWqA0A\nAAAWUBvs7O3tRXLVr5/LqtUAAAAgzdQGuzVr1li1DgAAAKST2mBndnrr0sWb9l25E1rtq9lt\nbPf+eaNEcLHsVqoMAAAAFlEf7EwzO1fpM3+v+Y3jiGn1H097q/Taal2nb5nTx4ZBTwAAALKa\n2rtizy9s1mf+3pp9pvx99rq5xSNw/LjulXbO7dto9imrlQcAAAC11Aa7sQM2exYeuuWbD0sU\neHL/hI1j0NDZe0YX99o5aozVygMAAIBaaoPd8ntRAZ3aJW9v2iF/9H3uqwAAAMh6aoNdHoM+\n/Oyj5O0PQh7qDYyBAgAAkPXUBrthFbKfW9Bh/73opI2RN7Z1XnrBcYFMWAAAIABJREFUu/QQ\nKxQGAAAAy6gNds2WfptHuRLsX6rHwM9EJGTJ92MGdSoSWOeK0Wf6slbWrBAAAACqqA12Dtnq\nHfn7t+bldN9NGiUiOz4ZMHLiApeKLVcdOdbcx8mKBQIAAEAdtePYhSeYXAPrLtpWd97diyHn\nb8TrHXIHFs3tbrBqcQAAAFBPbbDL5l2geYdOnTt3rlXKv2w2f6vWBAAAgDRQeyk2uIAsnj6y\ndmm/3KVqfTp14fkHsVYtCwAAAJZSG+w2HTx//+yfM8cOKGA8NabfewWzeQU37zF/7f4oo1XL\nAwAAgFpqg52IeASU6zV8wo5j126G7J44rFPs8VWdG1by8incZdBX1qsPAAAAKlkQ7BLlLFK5\n32fTd+7/c1Kfd2Lvnv5hwtAMLwsAAACWUnvzRKKo26d/W7lixYoVa7YfiTaa3PKVbt26jTUq\nAwAAgEVUD3dy7Z9VK1asWLFiw+6QOJPJIUfhFn1Htm3btm7FgopVCwQAAIA6aoOde56SRpPJ\nzi1fo66D27Zp0+itUrYEOgAAgFeJ2mD3zrv/a9OmTbO6FZ10BDoAAIBXkdpgt+7nqS/6KOL6\nP06+xTOoHgAAAKRRWu6KNYu+d3bJzLFNqhVz8yuZgQUBAAAgbSy+Kzbu0ZV1y39ZsmTJ6q2H\nY4wmEclWqJIVCgMAAIBl1Aa7hOjbm1cuW7Jkycr1+8ITjCLilKto2zbt2rVrV/uNfFYsEHj1\nrGnaK/2dNFw1K/2dAACQ1EuCnTE+bNdvy5csWbJ89Y77cQki4pijUK18oVv+vBt27bgN91EA\nAAC8MlILdh+2b7Bs5aabkfEi4p6vVOemzZo1b/7Om0XOfVu58J93SXUAAACvlNSC3bQF60Sk\nQrvh4wa8X6OMf2aVBAAAgLRI7a7Y3M62InJg8bievXp/OvnH4zciMqsqAAAAWCy1YHflwd0d\nK+Z2/397dxoY4/X2cfyaTDJZSWIniX0PRYLyoGprqcaullRQSilVtVeESmhpSmut2otaS2n/\nStNSlJba11C7WBJCyCKZZGaeFxMRJJaYZOL4fl7lPnPP3FfOnJn8cu6tfaMbB8KCP+nxiqdr\n1dfahMxa8V90Yo7VBwAAgKf0uGCnsXVt2K73t6v/uH474pfFU7u86Xtm54YxH3ZpNXq/iIz5\neunJ6yQ8AACA3OKpLlCsdSzSMuDjZb/uvhV1avnM4Fb1Kmk1mpDB3SoVcX/1rYAZy8Oyu0oA\nAAA80bPdecI+f9nO/QPX/3X81oUDcyeNaFS14J5flwzs+kY2FQcAAICnl8VbiuXxqtZ7+Bd/\nHLx47fhfUwP7W7YmAAAAZMEz31LsIYUr1fs4uJ5FSgEAAMDzyOKMHQAAAHIbgh0AAIAiCHYA\nAACKINgBAAAogmAHAACgCIIdAACAIgh2AAAAiiDYAQAAKIJgBwAAoAiCHQAAgCIIdgAAAIog\n2AEAACiCYAcAAKAIgh0AAIAiCHYAAACKINgBAAAogmAHAACgCIIdAACAIgh2AAAAiiDYAQAA\nKIJgBwAAoAiCHQAAgCIIdgAAAIog2AEAACiCYAcAAKAIgh0AAIAiCHYAAACKINgBAAAogmAH\nAACgCIIdAACAIgh2AAAAiiDYAQAAKIJgBwAAoAiCHQAAgCIIdgAAAIog2AEAACiCYAcAAKAI\ngh0AAIAiCHYAAACKINgBAAAogmAHAACgCIIdAACAIgh2AAAAiiDYAQAAKIJgBwAAoAiCHQAA\ngCIIdgAAAIog2AEAACiCYAcAAKAIgh0AAIAiCHYAAACKINgBAAAogmAHAACgCFtrFwA82c9t\n+z3nK/itm22RSgAAyM2YsQMAAFAEwQ4AAEARBDsAAABFEOwAAAAUQbADAABQBMEOAABAEQQ7\nAAAARRDsAAAAFEGwAwAAUATBDgAAQBEEOwAAAEXk0L1iTSm31s2d8+uuQ9GJNkW9yrXq9sGb\nNYqIiIjxzxWzft6+/1KstmKV2j0G9iztZJuldgAAgJddDs3Y/TZx6LJtka16fjQpeETjMkmz\nxn3406U4ETn7Y+DUlX/Xaff+2I8DXM78MXrwHKNIFtoBAACQE9NdhqRL3+670XBiqJ+3u4iU\nq1j16p5OP8062maiz5SVJ8p0Ce3YtIyIlJ2s6RgwednlHt2K2T1bu4dzDvwWQG72c9t+z/8i\nfutmP/+LAACsKCdm7AyJ50uUKvVW6bz3GjQ1XO2TY+KSbm+/mGho1szD3GrvVr+Gi27fn9ee\ntT1tQzdv3rx8z9WrV3PgVwMAAMg9cmLGTufa4OuvG6QtJseFL7gSV6JnBX38ahGp7GSX9lAl\nJ9tNh2/rXz/8TO3in7o4ZcqUTZs2mX92d3cPCwvLvl8KAAAgt8npMw8u7N047ZsFyaVbjG7u\nmXIhXkTy296fNSxgp02JSzQmPVt7zlUPAACQi+VcsNPfOrlg+rRfD9xs2KHfhK6NHTSaWJ2j\niNxKMbpoteZ1opMNWjedzTO2p22if//+/v6p03fae+sAAAC8JHIo2MVe+GPI0Bnaqi0mzw2o\nUMDB3GjnXFVk+8m7KV72qSHsv7sprvXdnrU9bSvFihUrVqxYzvxGCuMwfAAAXlA5cfKEyZgw\nYcQs+yYfzQrqk5bqRMTBrVExnXbzX1HmxeT4g3ti9T5Nizxrew78CgAAALlfTszYJUQtO56Q\n3LOq0769e+9v2LFsdW+3oR0qDls07veiw73dkzfM/MqpaJMATxcRedZ2AAAA5ESwiz19XkQW\nTpqQvjGv16dLZ9Yp2ymkf9LXK6YGRSdqylRrGDL+ffMU4rO2AwAAICeCXZH6EzbUz+QxjbZZ\n9yHNuj93OwAAwEuPCS8AAABFEOwAAAAUQbADAABQBMEOAABAEQQ7AAAARRDsAAAAFJFz94oF\nACviXnkAXgbM2AEAACiCYAcAAKAIgh0AAIAiCHYAAACKINgBAAAogmAHAACgCIIdAACAIgh2\nAAAAiiDYAQAAKIJgBwAAoAiCHQAAgCK4VywAWMfz376We9cCeAgzdgAAAIog2AEAACiCYAcA\nAKAIgh0AAIAiCHYAAACKINgBAAAogmAHAACgCIIdAACAIgh2AAAAiiDYAQAAKIJgBwAAoAiC\nHQAAgCIIdgAAAIog2AEAACiCYAcAAKAIgh0AAIAiCHYAAACKsLV2AQAAvBh+btvv+V/Eb93s\n538RIDPM2AEAACiCYAcAAKAIdsUCAHIpdn0Cz4oZOwAAAEUQ7AAAABRBsAMAAFAEwQ4AAEAR\nBDsAAABFEOwAAAAUQbADAABQBNexAwCIcNE4QAnM2AEAACiCYAcAAKAIgh0AAIAiCHYAAACK\nINgBAAAogmAHAACgCIIdAACAIgh2AAAAinjpLlDMFTgBAICqmLEDAABQBMEOAABAEQQ7AAAA\nRRDsAAAAFEGwAwAAUATBDgAAQBEEOwAAAEUQ7AAAABRBsAMAAFAEwQ4AAEARBDsAAABFEOwA\nAAAUQbADAABQBMEOAABAEQQ7AAAARRDsAAAAFEGwAwAAUATBDgAAQBEEOwAAAEUQ7AAAABRB\nsAMAAFAEwQ4AAEARBDsAAABFEOwAAAAUQbADAABQBMEOAABAEQQ7AAAARRDsAAAAFEGwAwAA\nUATBDgAAQBEEOwAAAEXYWrsAPK+Svcse+d9Xz/kiVVsOsUgxAADAipixAwAAUATBDgAAQBHs\nigUAWAZHhgBWR7ADIMKfZABQArtiAQAAFEGwAwAAUATBDgAAQBEEOwAAAEUQ7AAAABTBWbGA\nFXAK6hPRRQCQBQQ7AHghkX0BPIpdsQAAAIpgxg7qY2IDAPCSYMYOAABAEczYAcBTYeoXQO7H\njB0AAIAimLEDACiLeVa8bJixAwAAUAQzdrA8/kUGAMAqmLEDAABQBMEOAABAEeyKfWbPv5+R\nnYwAACA7MGMHAACgCIIdAACAIgh2AAAAiiDYAQAAKIJgBwAAoAjOigUAIIdw/XZkN2bsAAAA\nFEGwAwAAUATBDgAAQBEEOwAAAEUQ7AAAABRBsAMAAFAEwQ4AAEARBDsAAABFEOwAAAAUQbAD\nAABQBMEOAABAEQQ7AAAARRDsAAAAFEGwAwAAUATBDgAAQBEEOwAAAEUQ7AAAABRBsAMAAFAE\nwQ4AAEARBDsAAABFEOwAAAAUQbADAABQBMEOAABAEQQ7AAAARRDsAAAAFEGwAwAAUATBDgAA\nQBEEOwAAAEUQ7AAAABRBsAMAAFAEwQ4AAEARBDsAAABFEOwAAAAUQbADAABQBMEOAABAEQQ7\nAAAARRDsAAAAFEGwAwAAUATBDgAAQBEEOwAAAEUQ7AAAABRBsAMAAFAEwQ4AAEARBDsAAABF\nEOwAAAAUQbADAABQBMEOAABAEQQ7AAAARRDsAAAAFEGwAwAAUATBDgAAQBEEOwAAAEXYWruA\nZ2X8c8Wsn7fvvxSrrVildo+BPUs7vXC/AgAAQLZ4wWbszv4YOHXl33XavT/24wCXM3+MHjzH\naO2SAAAAcokXKtiZ9FNWnijTZXzHpnW9fRsMmjwg/urmZZfjrV0WAABArvAiBbuk29svJhqa\nNfMwL9q71a/hotv35zXrVgUAAJBLvEgHqOnjD4tIZSe7tJZKTrabDt8W/9TFM2fOREdHm3+2\ntbX18fHJ8RoBAACs5kUKdsakeBHJb3t/lrGAnTYlLjFtceHChZs2bTL/7O7uHhYWlsMVAgAA\nWJHGZDJZu4anFRsR6t9/+8zV67zsteaWlb07b3Qbuji0pnkxMDCQYAcAAF5aL9KMnZ1zVZHt\nJ++mpAW7/+6muNZ3S1th9OjRw4cPN/+s0WisUCIAAID1vEgnTzi4NSqm027+K8q8mBx/cE+s\n3qdpkbQVHB0d896TJ08eK5UJAABgHS9SsBONbmiHiqcXjft938mrZ48uCPrKqWiTAE8Xa5cF\nAACQK7xIx9iJiJgMYd9/vTJsT3Sipky1hh988n5Z5xdpbzIAAED2edGCHQAAADLxQu2KBQAA\nQOYIdgAAAIog2AEAACiCYAcAAKAIgh0AAIAiCHYAAACKINgBAAAogmAHAACgCIIdAACAIgh2\nAAAAiiDYAQAAKIJgBwAAoAiCHQAAgCIIdgAAAIog2AEAACiCYAcAAKAIgh0AAIAiCHYAAACK\nINgBAAAogmAHAACgCIIdAACAIgh2AAAAiiDYAQAAKIJgBwAAoAiCHQAAgCIIdgAAAIog2AEA\nACjC1toFvEj0ev3BgwdFpGLFinnz5rV2OSIiV65ciYiI0Ol01atXt3YtqQ4dOpSUlOTh4eHh\n4WHtWkRE7ty5Ex4eLiLVq1fX6XTWLkdE5MyZM9HR0a6urhUqVLB2LSIiRqNx7969IlK2bNl8\n+fJZuxwRkaioqPPnz9vY2NSsWdPataQ6duxYfHx84cKFS5QoYe1aREQSEhKOHj0qIlWqVHFy\ncrJ2OSIiFy5ciIyMdHZ29vb2tnYtqfbu3Ws0GkuWLFmoUCFr1yIiEh0dfebMGRGpVauWRqOx\ndjlQlAlP7fr1676+vr6+vv/884+1a0k1b948X1/fli1bWruQ+/z8/Hx9fefMmWPtQlLt2bPH\n/K5FRkZau5ZUgYGBvr6+AwYMsHYhqZKSksxdtHnzZmvXkmrVqlW+vr4NGjSwdiH3vfvuu76+\nvqGhodYuJNXJkyfN79qpU6esXUuqyZMn+/r6duvWzdqF3FevXj1fX981a9ZYu5BUmzZtMr9r\nycnJ1q4FymJXLAAAgCIIdgAAAIog2AEAAChCYzKZrF3DC0Ov12/fvl1EfHx8cskx5ufOnTtz\n5oyDg0P9+vWtXUuqnTt33r17t3Tp0qVLl7Z2LSIiN2/e3L9/v4g0aNDA3t7e2uWIiBw9evTa\ntWv58+evUaOGtWsRETEajVu2bBGRqlWrFi5c2NrliIhERESEh4drtdpGjRpZu5ZUe/bsuXPn\nTvHixcuXL2/tWkREYmNjd+/eLSJ16tRxcXGxdjkiIidPnrx06VLevHlr165t7VpSbdmyxWg0\nVqxY0dPT09q1iIhcu3bNfMpL48aNbWyYWEG2INgBAAAogv8YAAAAFEGwAwAAUAQXKH6c7u3a\nFO4zY3Jzax6csW9Y989O3nqo0bFAu5ULemS4flJMWMeA6fN+/KmQXbak9jFdOhyK13eY/UOA\nxwOH9Rz8sk/QjmslWoVO7221I5BMhjs93wm4mWwcsHjVG+4OVqkhN/dPmtwwsDP0NIV1bdu6\n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\nAElFTkSuQmCC"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "bike_rides_clean%>%\n",
    "  group_by(member_casual, month_name)%>%\n",
    "  summarise(mean_ride_length = mean(ride_length)\n",
    "            ,ride_id = n())%>%\n",
    "  ggplot(aes(x = month_name, y = mean_ride_length, fill = member_casual))+\n",
    "  geom_col(position = 'dodge')+\n",
    "  scale_fill_manual(values = c(\"#B25068\", \"tan\"))+  \n",
    "  theme(panel.background = element_blank())+\n",
    "  ggtitle(\"Average Customer Ride Length Per Month\")+\n",
    "  xlab(\"Month\")+\n",
    "  ylab(\"Average Ride Length\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "afc1f25d",
   "metadata": {
    "papermill": {
     "duration": 0.017592,
     "end_time": "2022-08-23T18:37:25.308263",
     "exception": false,
     "start_time": "2022-08-23T18:37:25.290671",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Average Customer Trip Length by week day**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 30,
   "id": "ac5f0eb6",
   "metadata": {
    "_cell_guid": "14e42c67-f34b-426e-9e7b-9405c91f47ed",
    "_uuid": "a748b8fa-39dc-4f97-b14e-dfcb8c48ff8b",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-08-23T18:37:25.347527Z",
     "iopub.status.busy": "2022-08-23T18:37:25.346025Z",
     "iopub.status.idle": "2022-08-23T18:37:25.636443Z",
     "shell.execute_reply": "2022-08-23T18:37:25.634970Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.312501,
     "end_time": "2022-08-23T18:37:25.638367",
     "exception": false,
     "start_time": "2022-08-23T18:37:25.325866",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\nVIIdAACARhDsAAAANIJgBwAAoBEEOwAAAI0g2AEAAGgEwQ4AAEAjCHYAAAAaQbADAADQCIId\nAACARhDsAAAANIJgBwAAoBEEOwAAAI0g2AEAAGgEwQ4AAEAjCHYAAAAaQbADAADQCIIdAACA\nRhDsAAAANIJgBwAAoBEEOwAAAI0g2AEAAGgEwQ4AAEAjCHYAAAAaQbADAADQCIIdAACARhDs\nAAAANIJgBwAAoBEEOwAAAI0g2AEAAGgEwQ4AAEAjCHYAAAAaQbADAADQCIIdAACARhDsAAAA\nNIJgBwAAoBEEOwAAAI0g2AEAAGgEwQ4AAEAjCHYAAAAaQbADAADQCIIdAACARhDsAAAANIJg\nBwAAoBEEOwAAAI0g2AEAAGgEwQ4AAEAjCHYAAAAaQbADAADQCIIdAACARhDsAAAANIJgBwAA\noBEEOwAAAI0g2AEAAGgEwQ4AAEAjCHYAAAAaQbADAADQCIIdAACARhDsAAAANIJgBwAAoBEE\nOwAAAI0g2AEAAGgEwQ4AAEAjCHYAAAAaQbADAADQCIIdAACARhDsAAAANIJgBwAAoBEEOwAA\nAI0g2AEAAGgEwQ4AAEAjCHYAAAAaQbADAADQCIIdAACARhDsAAAANIJgBwAAoBEEOwAAAI0g\n2AEAAGgEwQ4AAEAjCHYAAAAaQbADAADQCIIdAACARhDsAAAANIJgBwAAoBEEOwAAAI0g2AEA\nAGgEwQ4AAEAjCHYAAAAaQbADAADQCIIdAACARhDsAAAANIJgBwAAoBEEOwAAAI0g2AEAAGgE\nwQ4AAEAjCHYAAAAaQbADAADQCIIdAACARhDsAAAANIJgBwAAoBEEOwAAAI0g2AEAAGgEwQ4A\nAEAjCHYAAAAaQbADAADQCIIdAACARhDsAAAANIJgBwAAoBEEOwAAAI0g2AEAAGgEwQ4AAEAj\nCHYAAAAaQbADAADQCIIdAACARhDsAAAANIJgBwAAoBEEOwAAAI0g2AEAAGgEwQ4AAEAjCHYA\nAAAaQbADAADQCIIdAACARhDsAAAANIJgBwAAoBEEOwAAAI0g2AEAAGgEwQ4AAEAjCHYAAAAa\nQbADAADQCIIdAACARhDsAAAANIJgBwAAoBEEOwAAAI0g2AEAAGgEwQ4AAEAjCHYAAAAaQbAD\nAADQCIIdAACARhDsAAAANIJgBwAAoBEEOwAAAI0g2AEAAGgEwQ4AAEAjCHYAAAAaQbADAADQ\n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\nYII="
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "bike_rides_clean%>% \n",
    "group_by(member_casual, week_day)%>%\n",
    "   summarise(ride_id = n()\n",
    "              ,mean_ride_length = mean(ride_length)\n",
    "              , .groups = \"drop\")%>%  \n",
    "  ggplot(aes(y=mean_ride_length, x=week_day, fill= member_casual))+\n",
    "  geom_col(position = 'dodge')+\n",
    "  scale_fill_manual(values = c(\"#B25068\", \"tan\"))+\n",
    "  theme_classic()+\n",
    "  ggtitle(\"Average Customer Trip Length by Day of the Week\")+\n",
    "  xlab(\"Day of the Week\")+\n",
    "  ylab(\"Average Customer Ride Length\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "54ae3d28",
   "metadata": {
    "papermill": {
     "duration": 0.018686,
     "end_time": "2022-08-23T18:37:25.675728",
     "exception": false,
     "start_time": "2022-08-23T18:37:25.657042",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Average Customer Trip Length by hour of the day**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 31,
   "id": "f10ccc7d",
   "metadata": {
    "_cell_guid": "6e5310c2-dd23-46cb-b3e6-1f21d7dde66c",
    "_uuid": "8757f448-4eba-47da-aa8c-95ce0e169617",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-08-23T18:37:25.715198Z",
     "iopub.status.busy": "2022-08-23T18:37:25.713927Z",
     "iopub.status.idle": "2022-08-23T18:37:26.007533Z",
     "shell.execute_reply": "2022-08-23T18:37:26.006060Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.315379,
     "end_time": "2022-08-23T18:37:26.009249",
     "exception": false,
     "start_time": "2022-08-23T18:37:25.693870",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\nwS2reSwkAAAAAElFTkSuQmCC"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "bike_rides_clean%>%  \n",
    "  group_by(member_casual, hour_of_day)%>%\n",
    "  summarise(ride_id = n()\n",
    "            ,mean_ride_length = mean(ride_length)\n",
    "            , .groups = \"drop\")%>%\n",
    "  ggplot(aes(y=mean_ride_length, x=hour_of_day, fill= member_casual))+\n",
    "  geom_col(position = 'dodge')+\n",
    "  scale_fill_manual(values = c(\"#B25068\", \"tan\"))+\n",
    "  theme_classic()+\n",
    "  ggtitle(\"Average Customer Trip Length by Hour of the Day\")+\n",
    "  xlab(\"Hour of the Day\")+\n",
    "  ylab(\"Average Customer Ride Length\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "e107924d",
   "metadata": {
    "papermill": {
     "duration": 0.019073,
     "end_time": "2022-08-23T18:37:26.048108",
     "exception": false,
     "start_time": "2022-08-23T18:37:26.029035",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**No of rides by hour_of_day**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 32,
   "id": "d17aebdb",
   "metadata": {
    "_cell_guid": "91730bef-4fc4-4649-b960-a7ac5613a8f3",
    "_uuid": "51f776a1-eee8-4f23-a4a7-c245f8bc35a3",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-08-23T18:37:26.088576Z",
     "iopub.status.busy": "2022-08-23T18:37:26.087311Z",
     "iopub.status.idle": "2022-08-23T18:37:27.223875Z",
     "shell.execute_reply": "2022-08-23T18:37:27.221704Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 1.15957,
     "end_time": "2022-08-23T18:37:27.226552",
     "exception": false,
     "start_time": "2022-08-23T18:37:26.066982",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "`geom_smooth()` using method = 'loess' and formula 'y ~ x'\n",
      "\n"
     ]
    },
    {
     "data": {
      "image/png": "iVBORw0KGgoAAAANSUhEUgAAA0gAAANICAIAAAByhViMAAAABmJLR0QA/wD/AP+gvaeTAAAg\nAElEQVR4nOzdd3xkVf038O+5dVommSSbbGF7b1RBqdI7SFdAUEBAAakLu7j0LmXpCCoiPxuo\nqMgj0gUEEZAisixbYHs2mzK93XqeP+7u7EwyyU6SKZnJ5/3HvjYnM/ee3LmZ+eRUxjknAAAA\nAKh+QqUrAAAAAADFgWAHAAAAUCMQ7AAAAABqBIIdAAAAQI1AsAMAAACoEQh2AAAAADUCwQ4A\nAACgRiDYAQAAANSI2gx2oZXnMMYYYze815H3AZ8/tjdjbP5l75WnPj8cV8cY+zxllud0g5Bs\n/8dZB+3W7FNa5/4o7wOCy093LmnjzNv6PIqdnuVVnIf9I6KVqq65hv+1HQRuxf7yyE0nH/q1\n8aOb3bJS39iyyz6HLVry6y7DrnTVhqnY+ltZL4KoNrZMOuiE8//8UdcQj58OPc8Yk9SxfT3g\nlSMmMsZ2//EnQzwRAMAQ1Wawy7jzqO+GTWytsX3X73vCL1/7UJ657+H7Te//keFVNy1N5k9R\noVU3Lk8aJajdyJLY+Nph08Ydf+H1f3z53c4ktY5rZangx2+/9OMrzpgy49B/daeLfkZuJ95+\n++13/7O+6EcuM0H0TssycVxTonvda3/+6Um7T7rxpY2Vrh0AQDnUeLBLdf398JveqXQthj2u\n3/9FRPbM/uL9V578yVn9PJAJEre1K1/akPe7H173ByKSBVaSSo4MZmr5YfOOenlNbOL+Zz//\n7sp0tGvNmvXhROyTV393/PzG2JpXj9zjAq3Yf6qYqRX77LPPoSf+rMjHLTu1fv+VWVava4t1\nr7rlmzNtK3HbiccmbPyNBwC1r5aDnWfUt3yi8P7tRzzXkap0XYY1bqcMzmXPXM/2Mln95IUi\nY+8t/lO+o5iLnl+v+vc8qEEtSS1HhidPOOTtcHqHw2/8/NXHj9hj2pZSwT3/wG/94f2Pv16v\nRr584rw32ipax2qiNEy5+tdvjVclPf7hT9oSla4OAEDJ1XKwczd9428LdrHN6DlH3lr0g3Mr\nmdKtoh92MLjWUa6hV0rd1xZMqAstv3ZlrzFt0XV3/yemT/jGbSINtcVuZF5bIkoHn/vBixtE\nZcxzf7za1etXU1TH33vJHCJ64YqXy1alwpXjVRvUyyFIzc4fG93m8Liphq68tyUAVJdaDnZE\ntM8tLxzU6Or84NZznl3bz8Pe+cEcxtiJy7qzC7kVYYx5R52cKVn55H6MsXOWd/x84QktvnqP\nKvkCLfse//33utJE1vMPLthz9gSfKvubJx7x3R/1jj6c2y88tGjfOZPqXEqgZYeDTjrv/33S\nTb2sfeu33z1u/3EtAdXTMH3+7hfc+Oiq3DFtzsyPi74Ix9c+/6195/gUz686kn3/cPYbv779\n2P12HNXgU7z1k+ftdcH1P2vTtn3CvXLEREFqIKJk1x8ZY3XjftjPhSKisxbvaFvJBa/3bDT6\n361PEtGp1++S91nb/aGq69o+f9xkxthXbv9vj/KNr57CGGuceaPzZfDTv1186uHTxjSpslLf\ntMO+R5/11Lvtea/Plovw+M0G5+MOenhnr5z3AfOuevwvf/nL47fMdr4s8L7tvyZPzW5WfLsS\nUXTdzYyxpplPbH3Sdu4cGvKrVuxbPT9uBl+LaExQT2r2ENGaPx/JGJt07N96PGzZI3szxmad\n/fpAj9+37V/AAl/BolwHABgpeC0KrjibiJpm/Y5z3v7W1USk+Hb5MmVmHrDs0b2IaN6l7zpf\n/uv7s4nohM+6sg9im2Ei8jSflClZ8ct9iWjWcTOJaPJOe3/jyAPHuyUi8o75xoNn78wEed5X\nDzrm4L19okBErXvennniRWN9RHTrubsQkexr3XmXmV5JICJB8t/80obsk75z75kiY4yx1klz\n9v7qTs1eiYi84w58dXOyR+W/9+GLO/sVd+uMg4885tnuVF+X4v4zdiIixljrlPn77fmVgCwS\nUf20Y5cmDOcBK39xx6KrLiUi2TNz0aJF19/2bN7jdH9+GhG17PxcOvwPgbHmHR/s8YCDGlyy\nd75m86Ma3UT0Wjg9oB+quq5t8PNFROQdfU6P8kd2GUVEJz6/jnPe+cGSBkkgosYpc/f5+j5z\nJtUTkSD6Hvgs2NeL9cCMRiI68pX1fT2ghwLv2/5r8vGSm6664iwiUv17L1q06KZ7/uM8a7t3\nDh/Cq8aLfatH191CRO7Go3qU67G1d5w+m4hmn/lbp8RILHULTPbMTlk5jzxvrI+IHt4Yy3v8\nVPBvRCQqY/J+l3P+8uETiOgrd/w3U1LIBSzwFRzQrzwAjHC1H+w45w8cvAMRzTz7z5kHDCXY\nMSYv/PX7Tkmq451JLomIRHnUT15b6xR2fvCIzBhj4ur0lijphA/GxHMfekm3Oefc0jofvnBP\nIpI9s9dtfVjky0dUgSm++T99ZZVTYhldP7noa0RUP+28zMeQU/mWyb4Dr/5t0rL7uQ6rn/k2\nEan1uz/7yZYfTY+tuHz/MUQ08egn+/lJe8sEO875xePqBMm/Jr0tKMfbHiGiycf9nfOewa7A\nH6rKrq2t7epTiOjvwW2fr2bqizpRENVxm3WLc75gop+IzvjZv7Z+33pu8VeJqGXXn/d11FNG\neYjo5rXRPs+bq8D7drs10eMfEpF/wrWZpxR45wz6VSv6re4EO0H0zcoyfcp4t8CI6JDLHoqZ\n255+5+xGIlq0fFvCTnb+kYg8o07p6/hOsGNMmtWHCV45O9gVeAEHFOwKuQ4AACMi2GmRt8eq\nImPyoyvCTslQgt3Y/Z7Mftgfdm0horkXv5VdeGarN/tT3wkfE4/9dW41rYum1BPREc986Xz9\nxD5jiOiC19tyHmUbZ7R6iejRTfHsyntGfTO3xSGP7431EdFlb7dnFxrJZWNVkQmuj+N6Xz9p\nb9nB7tP7v0ZEJ72yrT3s/St3JKLLlnbzXsGuwB+q6q7ta2fOIKI9H1yaKVn7/44loknHbmny\nnO6WiWhlalvzjB7/6IYbbrjt7r/0dcyv1ClE9PP2xPZOvkWB9+12a9I72BV45wz6VSv6y+EE\nu764mufe/NQnmQev/tPhRDT1lJczJR9cuzMR7XHXJ/mOzfnWYLddmWBX4AUcULAr5DoAANT4\nGDuH4t/rxbsO4ty46tBL9SGveDDhpK9kf9k0wUtE88+flV040y0RUY/hzafcfVRugbDgvj2I\n6L/3fUZERPZN/+kU5eYl+43JeRSTLjx5EhH97o2c4VkTvnFx/y+elV79xKaE5J56556t2eWS\ne9bd85u5nb5nVaTfA/Rp6hnXEtGbC5/PlNzxxCrJPeXmWYFejx3gD1Ul15aIdrvpbCL69M7H\nMyV/WPg2EZ1379edL48f6yWiQ0649Pl3PnPuOtm78/XXX3/1Fd/o65g7qCIRtRd7CsJAazLQ\nO2fgr1rxXw5H767Y6OY1Lz15Y3308+tO3eXq1zc5D9vhsHtcAlv//MLMGpc3PLKcMemuc2f2\nf/ztdsU6SvSrV/h1AICRbKS8Ucy78NkzJtZF1/zyuJ8sHeKhBCXPRfPI27+Sx7V6epQ07nwA\nESU3fk5EVnr16rRpGV0uoecC+l97aCkRRT+LZj83sFvvFJVDj/3b4twVOELqNUt1+oGtRLR2\naXi7dc7LFTjynNHerv8ubNNtIkp1PvVMV3LMvnd7e62WMtAfqlquLRH5J165f4MrvuH+t6M6\nEZnJz65dFnQ3Hb1oSr3zgGtf/b+Dpjes+fvDR+011+dv/eqBx15x473//DzYzzH3qFOJ6J0V\n0X4e88iDD9x///3/62ON6LwGWpOB3jkDfdVK8XL0pa5l4iFnXvfGIwdwbj185l1OoeSZc+OM\ngB7/8I41USKKb3zoue5Uw7Rr96tXBn2ibCX61RvKdQCAkUOqdAXKRXA98OLtv5v9w5cvP/zd\nM76oL+QpvMgLCrBe7/JMUIiICW4i4twgIsk1acGl38r79NFfHZX9peTe7mvXZ+MkExkR2frg\nf8CLL539+KL/LPj35t/uN2bFz+8moiNu3ydPDQb4Qw1a2a8tEQm3nzF1zweXLv7z2te/M33d\n85enbL77lbdmKuKbeMwryze//9Izf33+5Tff+tf7b/6/9/7x3L03XnXMoj8+e1v+prLDTpv0\no1s//uSud+igk/I+IB16/sKLL2GMrTj/oj7r1eu+HXhNSnjnUKlejv5MPOEK+t4riU2PEy1x\nSk6+dY+FJ77w65s/vuYX+31848NEtO893xniWbIM7QL28c4z9OsAACPBCHqnaJh54VNnPHDS\n/604+ZSfv3Tc9h9vpFYWtwJ/7UjtWZfTJBBa+g8iqp87i4gk19RRshi0k7fdfntRtm5Q6r4q\nMpYOvWARibnf+vL1zUQ0dl7DoA8+/ZxFtOikfyx8id75zoMPfC4qY27fsbn3w4r+Q/WlzNfW\nMf/qi+nB8/9782/oOzf85kfvMUFe8oOc/kdiyu6Hnbr7YacSkZXqePWPP//2Odc9d8fxv70s\ncdood+8DzrzwInbbuW2v/eC92LF71OVpPVrzhzuJyNNyxjSX2Pu7jvz37UBqUtI7h8p4V2QI\noo8oJzCNP/wel/Dimj9dYz/+6hVPfSnKTQ8dukOxTjfEC1j0dx4AGFFGSles47jH/jbfK69/\n4cJr3tnc+7uJzTm7cG58qe/d7gfl6ateyC2w7/vh20S0/5VziIiYvHBmg6V3LH63o8fDLtpp\n6pgxY54d4Cahomvqma0eM7Vq4b9zflgzteLyD7uYoFwxc/A9O+7mE09r8XR+eNX6jr8/3p5o\n2f2uxt7dTlT8H6ovZb62Du+Y845vdkdW3/5++zs3fxFunH3LPv4taSzZ8evp06fv+LXLMw8W\n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\ndIj/H3DoIazqp38rAAAAAElFTkSuQmCC"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "ggplot(data = hourly_riders) + geom_point(mapping = aes(x = hour_of_day,\n",
    "        y = ride_id, color = member_casual)) +geom_smooth(mapping =aes(x=hour_of_day,\n",
    "                        y = ride_id, color = member_casual)) +\n",
    "   ggtitle(\"Number of Member vs Customer By Hour\")+\n",
    "  xlab(\"Hour\")+\n",
    "  ylab(\"Number of Customers\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "b7bfe181",
   "metadata": {
    "papermill": {
     "duration": 0.020838,
     "end_time": "2022-08-23T18:37:27.268139",
     "exception": false,
     "start_time": "2022-08-23T18:37:27.247301",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Summary of analysis**\n",
    "\n",
    "Casual riders prefer weekends and rides longer than annual members and with an increase on weekends.\n",
    "\n",
    "Annual members and casual riders both prefer summer season. Highest no. of rides are from June – August and lowest rides occurs from Nov – March.\n",
    "\n",
    "Annual riders trip duration is approximately even throughout the year, whereas casual riders riding bikes for longer duration from Feb – May.\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "0537b849",
   "metadata": {
    "papermill": {
     "duration": 0.02049,
     "end_time": "2022-08-23T18:37:27.308949",
     "exception": false,
     "start_time": "2022-08-23T18:37:27.288459",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Recommendations**\n",
    "\n",
    "Marketing team should launch a campaign to create flexible packages for members based on season or day of the week. For example, weekday vs. weekend membership to help attract casual riders.\n",
    "\n",
    "\n",
    "For casual riders, create a limited time deal for a membership discount. This could be sign up for a membership and get your first month free or a discount program on annual membership during peek months from June – August.\n",
    "\n",
    "\n",
    "Host fun biking competitions with prizes at intervals for members on the weekends. Since there are lot of casual riders on weekends this will also attract them to get a membership.\n",
    "\n",
    "\n",
    "Design an application for annual members providing details of stations, routes and nearby places etc. to grab the attention from casual riders. \n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "99ff22f2",
   "metadata": {
    "_cell_guid": "8c6471ad-1ef7-4f5b-a6a8-46eee69a4cc0",
    "_uuid": "61b2d948-059a-489f-b7e6-f06bf5a531e8",
    "papermill": {
     "duration": 0.020408,
     "end_time": "2022-08-23T18:37:27.349676",
     "exception": false,
     "start_time": "2022-08-23T18:37:27.329268",
     "status": "completed"
    },
    "tags": []
   },
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "04692ea3",
   "metadata": {
    "_cell_guid": "66088d7c-2511-4184-b815-18099431197f",
    "_uuid": "46825e8f-6bce-4e85-83a0-e46186914762",
    "papermill": {
     "duration": 0.019817,
     "end_time": "2022-08-23T18:37:27.389232",
     "exception": false,
     "start_time": "2022-08-23T18:37:27.369415",
     "status": "completed"
    },
    "tags": []
   },
   "source": []
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 242.401798,
   "end_time": "2022-08-23T18:37:27.728701",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2022-08-23T18:33:25.326903",
   "version": "2.3.4"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
