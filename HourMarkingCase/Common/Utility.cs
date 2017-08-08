using HourMarkingCase.Models;
using System.Linq;

public class Utility
    {
        public static int GetUserIdFromEmail(string email)
        {
            HourMarkingDatabaseEntities db = new HourMarkingDatabaseEntities();
            User user = db.Users.Where(u => u.email == email).SingleOrDefault();

            return user.id;
        }


       public static string GetUserInfoFromEmail(string email)   
       {
           HourMarkingDatabaseEntities db = new HourMarkingDatabaseEntities();
           User user = db.Users.Where(u => u.email == email).SingleOrDefault();

        string info = "First name: " + user.firstName + ", last name: " + user.lastName;

            return info;
       }
    
}
