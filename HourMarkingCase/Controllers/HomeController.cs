using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;
using HourMarkingCase.Models;
using System.Data.SqlClient;

namespace HourMarkingCase.Controllers
{
    public class HomeController : Controller
    {
        
        public ActionResult Index()
        {
            return View();
        }

        [Authorize]
        public ActionResult About()
        {
            String userName = User.Identity.GetUserName();
            HourMarkingDatabaseEntities db = new HourMarkingDatabaseEntities();

            string query = @"SELECT DISTINCT [User].id, [User].firstName, [User].lastName, 
                           [User].email, [User].phoneNumber, [User].isAdmin FROM [User]
                           WHERE [User].email = @userNamePlaceHolder";

            IEnumerable<User> data = db.Database.SqlQuery<User>(query, new SqlParameter("@userNamePlaceHolder", userName));

            string query1 = @"SELECT DISTINCT [WorkTarget].name, [WorkTarget].id, [WorkTarget].description FROM [WorkTarget] 
                           JOIN [UserWorkTarget] ON([WorkTarget].id = [UserWorkTarget].workTargetId)
                           JOIN [User] ON([UserWorkTarget].userId = [User].id) 
                           WHERE [User].email = @userNamePlaceHolder";

            IEnumerable<WorkTarget> data1 = db.Database.SqlQuery<WorkTarget>(query1, new SqlParameter("@userNamePlaceHolder", userName));

            List<User> listOfUsers = data.ToList();
            List<WorkTarget> listOfWorkTargets = data1.ToList();

            User user = null;
            WorkTarget workTarget = null;

            if(listOfUsers.Count > 0)
            {
                user = listOfUsers[0];
                workTarget = listOfWorkTargets[0];
            }

            if(user != null)
            {
                ViewBag.user = listOfUsers;
                ViewBag.workTarget = listOfWorkTargets;
                return View();
            }
            else
            {
                return View("Index");
            }
           
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

    }
}