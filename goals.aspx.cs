using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

namespace DDOOCP_fitness_assignment
{
    public partial class goals : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Data.getUserId() == -1)
            {
                Response.Write("<script>location.assign('login.aspx');</script>");
            }
        }

        protected void btnCalories_Click(object sender, EventArgs e)
        {
            int userId = Data.getUserId();
            int newCalorieGoal;

            if (!int.TryParse(calorieGoal.Value, NumberStyles.Integer, CultureInfo.InvariantCulture, out newCalorieGoal))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "InvalidInput", "alert('Please enter a valid calorie goal (a whole number).');", true);
                return;
            }

            if (newCalorieGoal <= 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "NegativeGoal", "alert('The calorie goal must be a positive number.');", true);
                return;
            }

         
            bool goalExists = DBmanager.checkGoalForToday(userId);

            if (goalExists)
            {

                string script = "if (confirm('A goal has already been set for today. Do you want to update it?')) {" +
                                "document.getElementById('HiddenFieldGoalAction').value = 'update';" +
                                "document.getElementById('" + btnUpdateGoal.ClientID + "').click();" +
                                "}" +
                                "else {" +
                                "alert('Goal was not updated.');" +
                                "}";

                ScriptManager.RegisterStartupScript(this, this.GetType(), "confirmUpdate", script, true);
            }
            else
            {

                DBmanager.setGoal(newCalorieGoal, userId);
                Response.Redirect("goals.aspx");
            }
        }

        protected void btnUpdateGoal_Click(object sender, EventArgs e)
        {
            int userId = Data.getUserId();
            int newCalorieGoal;

            if (!int.TryParse(calorieGoal.Value, NumberStyles.Integer, CultureInfo.InvariantCulture, out newCalorieGoal))
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "InvalidInputUpdate", "alert('Please enter a valid calorie goal (a whole number) for the update.');", true);
                return;
            }

        
            if (newCalorieGoal <= 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "NegativeGoalUpdate", "alert('The calorie goal must be a positive number for the update.');", true);
                return;
            }

            DBmanager.updateGoal(newCalorieGoal, userId);

            Response.Redirect("goals.aspx");
        }
    }
}