using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DDOOCP_fitness_assignment
{
    public partial class Display_progress : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Data.getUserId() == -1)
            {
                Response.Write("<script>location.assign('login.aspx');</script>");
            }

        }
    }
}