using System;
using System.Web.UI;
using System.Threading;

namespace DDOOCP_fitness_assignment
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e) { }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string name = username.Value;
            string password = upassword.Value;

            int userid = DBmanager.login(name, password);
            if (userid == -1)
            {
                msg.Text = "Login is not successful!";
                int fCount = Data.getFailCount();
                fCount++;
                Data.setFailCount(fCount);

                if (fCount >= 3)
                {
                    msg.Text = "Too many failed login attempts. Please wait...";
                    Thread.Sleep(5000); 
                    Data.setFailCount(0); 
                }
            }
            else
            {
                Data.setFailCount(0);
                Data.setUserId(userid);
                Response.Write("<script>window.location.assign('goals.aspx');</script>");
            }
        }
    }
}