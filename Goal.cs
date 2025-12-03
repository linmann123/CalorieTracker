using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DDOOCP_fitness_assignment
{
    public class Goal
    {
        private int id;
        private int calorie;
        private DateTime date;
        private int user_id;

        public Goal(int i, int c, DateTime d, int uid)
        {
            id = i;
            calorie = c;
            date = d;
            user_id = uid;
        }
        public int getId()
        {
            return id;
        }

        public int getCalories()
        {
            return calorie;
        }
        public DateTime getDate()
        {
            return date;
        }
        public int getUserId()
        {
            return user_id; 
        }
    }
}