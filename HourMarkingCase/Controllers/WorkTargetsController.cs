using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using HourMarkingCase.Models;

namespace HourMarkingCase.Controllers
{
    [Authorize]
    public class WorkTargetsController : Controller
    {
        private HourMarkingDatabaseEntities db = new HourMarkingDatabaseEntities();

        // GET: WorkTargets
        public ActionResult Index()
        {
            return View(db.WorkTargets.ToList());
        }

        // GET: WorkTargets/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            WorkTarget workTarget = db.WorkTargets.Find(id);
            if (workTarget == null)
            {
                return HttpNotFound();
            }
            return View(workTarget);
        }

        // GET: WorkTargets/Create
        [Authorize(Users = "a@b.c")]
        public ActionResult Create()
        {
            return View();
        }

        // POST: WorkTargets/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,name,description")] WorkTarget workTarget)
        {
            if (ModelState.IsValid)
            {
                db.WorkTargets.Add(workTarget);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(workTarget);
        }

        // GET: WorkTargets/Edit/5
        [Authorize(Users = "a@b.c")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            WorkTarget workTarget = db.WorkTargets.Find(id);
            if (workTarget == null)
            {
                return HttpNotFound();
            }
            return View(workTarget);
        }

        // POST: WorkTargets/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,name,description")] WorkTarget workTarget)
        {
            if (ModelState.IsValid)
            {
                db.Entry(workTarget).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(workTarget);
        }

        // GET: WorkTargets/Delete/5
        [Authorize(Users = "a@b.c")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            WorkTarget workTarget = db.WorkTargets.Find(id);
            if (workTarget == null)
            {
                return HttpNotFound();
            }
            return View(workTarget);
        }

        // POST: WorkTargets/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            WorkTarget workTarget = db.WorkTargets.Find(id);
            db.WorkTargets.Remove(workTarget);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
