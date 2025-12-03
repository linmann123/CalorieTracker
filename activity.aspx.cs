using System;
using System.Web.UI;
using System.Collections.Generic;

namespace DDOOCP_fitness_assignment
{
    public partial class activity : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Data.getUserId() == -1)
            {
                Response.Write("<script>location.assign('login.aspx');</script>");
            }
            if (!IsPostBack)
            {
                int selectedActivityId = 1;
                List<ActivityMetric> metrics = DBmanager.getMetrics(selectedActivityId);
                Data.setActivityMetrics(metrics);
            }
        }

        protected void btnActivity_Click(object sender, EventArgs e)
        {
            int metricV1, metricV2, metricV3;
            metricV1 = Convert.ToInt16(m1.Value);
            metricV2 = Convert.ToInt16(m2.Value);
            metricV3 = Convert.ToInt16(m3.Value);

            DBmanager.addUserActivityMetric(Data.getUserId(), Data.getActivityMetrics()[0].getActmetid(), metricV1);
            DBmanager.addUserActivityMetric(Data.getUserId(), Data.getActivityMetrics()[1].getActmetid(), metricV2);
            DBmanager.addUserActivityMetric(Data.getUserId(), Data.getActivityMetrics()[2].getActmetid(), metricV3);
        }

        protected void btnActivity_Click1(object sender, EventArgs e)
        {
            int metricV1, metricV2, metricV3;
            metricV1 = Convert.ToInt16(m1.Value);
            metricV2 = Convert.ToInt16(m2.Value);
            metricV3 = Convert.ToInt16(m3.Value);

            DBmanager.addUserActivityMetric(Data.getUserId(), Data.getActivityMetrics()[0].getActmetid(), metricV1);
            DBmanager.addUserActivityMetric(Data.getUserId(), Data.getActivityMetrics()[1].getActmetid(), metricV2);
            DBmanager.addUserActivityMetric(Data.getUserId(), Data.getActivityMetrics()[2].getActmetid(), metricV3);
        }
    }
}