using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DDOOCP_fitness_assignment
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string name, email, pass, cpass;

          
            name = username.Value.Trim();
            email = useremail.Value.Trim();
            pass = password.Value;
            cpass = confirmPassword.Value;

            if (pass != cpass)
            {
                message.Text = "Passsword unmatch!";
            }
            else
            {
                bool ans = DBmanager.register(name, email, pass); 
                if (ans)
                {
                    message.Text = "Successfully registered!";
                }
                else
                {
                    message.Text = "Try again!";
                }
            }
        }
    }
}
