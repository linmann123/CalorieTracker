using System;

namespace DDOOCP_fitness_assignment
{
    public class ActivityMetric
    {
        private int actmetid;
        private double metvalue;
        private int metid;
        private string metname;     

        public ActivityMetric(int amid, double mvalue, int mid, string mname)
        {
            actmetid = amid;
            metvalue = mvalue;
            metid = mid;
            metname = mname;
        }

        public void setActmetid(int id) { actmetid = id; }
        public int getActmetid() { return actmetid; }

        public void setMetvalue(double d) { metvalue = d; }
        public double getMetValue() { return metvalue; }

        public void setMetid(int id) { metid = id; }
        public int getMetid() { return metid; }

        public void setMetName(string n) { metname = n; }
        public string getMetName() { return metname; }
    }
}
