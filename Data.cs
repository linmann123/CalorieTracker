using System;
using System.Collections.Generic;

namespace DDOOCP_fitness_assignment
{
    public class Data
       {
        private static int userid = -1;
        private static List<ActivityMetric> arr;
        private static int failcount = 0;

        public static void setFailCount(int c)
        {
            failcount = c;
        }
        public static int getFailCount()
        {
            return failcount;

        }
        public static void setActivityMetrics(List<ActivityMetric> a)
        {
            arr = a;
        }
        public static List<ActivityMetric> getActivityMetrics()
        {
            return arr;
        }

        public static void setUserId(int id) { userid = id; }
        public static int getUserId() { return userid; }
    }
}
