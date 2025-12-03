using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DDOOCP_fitness_assignment
{
    public class Progress
    {
        private DateTime date;
        private double burnedCalories;
        private double calorieGoal;
        private bool goalAchieved;

        public Progress(DateTime d, double c)
        {
            date = d;
            burnedCalories = c;
        }

       
        public Progress(DateTime d, double burned, double goal)
        {
            this.date = d;
            this.burnedCalories = burned;
            this.calorieGoal = goal;
            this.goalAchieved = (burned >= goal && goal > 0);
        }

        public void setDate(DateTime d)
        {
            date = d;
        }

        public DateTime getDate()
        {
            return date;
        }

        public void setCalories(double c)
        {
            burnedCalories = c;
        }

        public double getCalories()
        {
            return burnedCalories;
        }

        public double getCalorieGoal()
        {
            return calorieGoal;
        }

        public bool isGoalAchieved()
        {
            return goalAchieved;
        }
    }
}