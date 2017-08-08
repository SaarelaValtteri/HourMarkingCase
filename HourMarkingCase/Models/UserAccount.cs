using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace HourMarkingCase.Models
{
    public class UserAccount
    {
        public string userName { get; set; }
        public string password { get; set; }
        public int isAdmin { get; set; }
        
    }


}