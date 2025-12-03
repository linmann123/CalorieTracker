using System;

namespace DDOOCP_fitness_assignment
{
    public class ActivityData
    {
        private int id;
        private string name;

        public ActivityData(int i, string n)
        {
            id = i;
            name = n;
        }

        public void setId(int i) { id = i; }
        public int getId() { return id; }

        public void setName(string n) { name = n; }
        public string getName() { return name; }
    }
}
