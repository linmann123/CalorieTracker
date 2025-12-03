using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace DDOOCP_fitness_assignment
{
    public class DBmanager
    {
        private static SqlConnection con;

        public static bool openConnection()
        {
            try
            {
                con = new SqlConnection("Data Source=(LocalDB)\\v11.0;AttachDbFilename=|DataDirectory|\\fitnessapp.mdf;Integrated Security=True");
                con.Open();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public static bool closeConnection()
        {
            try
            {
                if (con != null && con.State != System.Data.ConnectionState.Closed)
                    con.Close();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public static bool register(string name, string email, string password)
        {
            try
            {
                openConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "INSERT INTO Usersdata (Username, Email, Password) VALUES (@n, @e, @pwd)";
                cmd.Parameters.AddWithValue("@n", name);
                cmd.Parameters.AddWithValue("@e", email);
                cmd.Parameters.AddWithValue("@pwd", password);
                int line = cmd.ExecuteNonQuery();
                closeConnection();
                return line > 0;
            }
            catch
            {
                return false;
            }
        }

        public static int login(string name, string password)
        {
            int id = -1;
            try
            {
                openConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "SELECT [User_ID] FROM [Usersdata] WHERE [Username]=@n AND [Password]=@p";
                cmd.Parameters.AddWithValue("@n", name);
                cmd.Parameters.AddWithValue("@p", password);

                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    id = Convert.ToInt32(reader["User_ID"]);
                }
                reader.Close();
                closeConnection();
            }
            catch
            {
               
            }
            return id;
        }

        public static bool setGoal(int cal, int uid)
        {
            try
            {
                openConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "INSERT INTO [Goals] ([calories], [date], [User_ID]) VALUES (@cal, CONVERT(date, GETDATE()), @uid)";
                cmd.Parameters.AddWithValue("@cal", cal);
                cmd.Parameters.AddWithValue("@uid", uid);
                int line = cmd.ExecuteNonQuery();
                closeConnection();
                return line > 0;
            }
            catch
            {
                return false;
            }
        }

 
        public static bool checkGoalForToday(int uid)
        {
            try
            {
                openConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "SELECT COUNT(*) FROM [Goals] WHERE [User_ID] = @uid AND [date] = CONVERT(date, GETDATE())";
                cmd.Parameters.AddWithValue("@uid", uid);
                int count = Convert.ToInt32(cmd.ExecuteScalar());
                closeConnection();
                return count > 0;
            }
            catch
            {
                return false;
            }
        }

  
        public static bool updateGoal(int cal, int uid)
        {
            try
            {
                openConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "UPDATE [Goals] SET [calories] = @cal WHERE [User_ID] = @uid AND [date] = CONVERT(date, GETDATE())";
                cmd.Parameters.AddWithValue("@cal", cal);
                cmd.Parameters.AddWithValue("@uid", uid);
                int line = cmd.ExecuteNonQuery();
                closeConnection();
                return line > 0;
            }
            catch
            {
                return false;
            }
        }

        public static List<Goal> getGoals(int uid)
        {
            List<Goal> ans = new List<Goal>();
            try
            {
                openConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "SELECT [Id], [calories], [date] FROM [Goals] WHERE [User_ID]=@uid ORDER BY [date] DESC";
                cmd.Parameters.AddWithValue("@uid", uid);

                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    int i = Convert.ToInt32(reader["Id"]);
                    int c = Convert.ToInt32(reader["calories"]);
                    DateTime d = Convert.ToDateTime(reader["date"]);
                    Goal g = new Goal(i, c, d, uid);
                    ans.Add(g);
                }
                reader.Close();
                closeConnection();
            }
            catch
            {
               
            }
            return ans;
        }

        public static List<ActivityData> getActivities()
        {
            List<ActivityData> arr = new List<ActivityData>();
            try
            {
                openConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "SELECT [Id], [aname] FROM [Activities]";
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    int i = Convert.ToInt16(reader["Id"].ToString());
                    string n = reader["aname"].ToString();
                    ActivityData ad = new ActivityData(i, n);
                    arr.Add(ad);
                }
                reader.Close();
                closeConnection();
            }
            catch
            {
                
            }
            return arr;
        }

        public static List<ActivityMetric> getMetrics(int actid)
        {
            List<ActivityMetric> arr = new List<ActivityMetric>();
            try
            {
                openConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText =
                    "SELECT am.[Id], am.[met_id], am.[met_value], m.[mname] " +
                    "FROM [ActivityMetric] am " +
                    "JOIN [Metrics] m ON am.[met_id] = m.[Id] " +
                    "WHERE am.[act_id] = @aid";

                cmd.Parameters.AddWithValue("@aid", actid);

                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    int actmetid = Convert.ToInt16(reader["Id"].ToString());
                    int metid = Convert.ToInt16(reader["met_id"].ToString());
                    double metValue = Convert.ToDouble(reader["met_value"].ToString());
                    string mname = reader["mname"].ToString();

                    ActivityMetric am = new ActivityMetric(actmetid, metValue, metid, mname);
                    arr.Add(am);
                }
                reader.Close();
                closeConnection();
            }
            catch
            {
                closeConnection();
            }

            return arr;
        }
        public static bool addUserActivityMetric(int uid, int amid, int amt)
        {
            try
            {
                openConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "insert into UserActivityMetric(user_id,act_met_id,amount,actDate) values(@uid,@amid,@amt,GETDATE())";
                cmd.Parameters.AddWithValue("@uid", uid);
                cmd.Parameters.AddWithValue("@amid", amid);
                cmd.Parameters.AddWithValue("@amt", amt);
                int line = cmd.ExecuteNonQuery();
                closeConnection();
                return line > 0;
            }
            catch
            {
                return false;
            }

        }
        public static List<Progress> getProgress(int uid)
        {
            List<Progress> prog = new List<Progress>();
            try
            {
                openConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText =
                    "SELECT uam.actDate, SUM(uam.amount * am.met_value) as burnedCalories, g.calories as goal " +
                    "FROM UserActivityMetric uam " +
                    "JOIN ActivityMetric am ON am.Id = uam.act_met_id " +
                    "LEFT JOIN Goals g ON CONVERT(date, uam.actDate) = CONVERT(date, g.date) AND g.User_ID = uam.user_id " +
                    "WHERE uam.user_id = @uid " +
                    "GROUP BY uam.actDate, g.calories " +
                    "ORDER BY uam.actDate DESC";

                cmd.Parameters.AddWithValue("@uid", uid);

                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    DateTime d = Convert.ToDateTime(reader["actDate"].ToString());
                    double burned = Convert.ToDouble(reader["burnedCalories"].ToString());

                 
                    double goal = 0;
                    if (reader["goal"] != DBNull.Value)
                    {
                        goal = Convert.ToDouble(reader["goal"]);
                    }

                   
                    Progress p = new Progress(d, burned, goal);
                    prog.Add(p);
                }
                closeConnection();
            }
            catch (Exception ex)
            {
               
                closeConnection();
            }
            return prog;
        }
    }
}