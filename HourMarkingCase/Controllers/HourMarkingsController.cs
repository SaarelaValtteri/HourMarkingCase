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
    
    public class HourMarkingsController : Controller
    {
        private HourMarkingDatabaseEntities db = new HourMarkingDatabaseEntities();

        // GET: HourMarkings
        public ActionResult Index()
        {
            var hourMarkings = db.HourMarkings.Include(h => h.Tag).Include(h => h.User).Include(h => h.WorkTarget);
            return View(hourMarkings.ToList());
        }

        // GET: HourMarkings/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HourMarking hourMarking = db.HourMarkings.Find(id);
            if (hourMarking == null)
            {
                return HttpNotFound();
            }
            return View(hourMarking);
        }

        // GET: HourMarkings/Create
        [Authorize(Users = "a@b.c")]
        public ActionResult Create()
        {
            ViewBag.tagId = new SelectList(db.Tags, "id", "name");
            ViewBag.userId = new SelectList(db.Users, "id", "firstName");
            ViewBag.workTargetId = new SelectList(db.WorkTargets, "id", "name");
            return View();
        }

        // POST: HourMarkings/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,hours,date,userId,workTargetId,tagId")] HourMarking hourMarking)
        {
            if (ModelState.IsValid)
            {
                db.HourMarkings.Add(hourMarking);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.tagId = new SelectList(db.Tags, "id", "name", hourMarking.tagId);
            ViewBag.userId = new SelectList(db.Users, "id", "firstName", hourMarking.userId);
            ViewBag.workTargetId = new SelectList(db.WorkTargets, "id", "name", hourMarking.workTargetId);
            return View(hourMarking);
        }

        // GET: HourMarkings/Edit/5
        [Authorize(Users = "a@b.c")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HourMarking hourMarking = db.HourMarkings.Find(id);
            if (hourMarking == null)
            {
                return HttpNotFound();
            }
            ViewBag.tagId = new SelectList(db.Tags, "id", "name", hourMarking.tagId);
            ViewBag.userId = new SelectList(db.Users, "id", "firstName", hourMarking.userId);
            ViewBag.workTargetId = new SelectList(db.WorkTargets, "id", "name", hourMarking.workTargetId);
            return View(hourMarking);
        }

        // POST: HourMarkings/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,hours,date,userId,workTargetId,tagId")] HourMarking hourMarking)
        {
            if (ModelState.IsValid)
            {
                db.Entry(hourMarking).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.tagId = new SelectList(db.Tags, "id", "name", hourMarking.tagId);
            ViewBag.userId = new SelectList(db.Users, "id", "firstName", hourMarking.userId);
            ViewBag.workTargetId = new SelectList(db.WorkTargets, "id", "name", hourMarking.workTargetId);
            return View(hourMarking);
        }

        // GET: HourMarkings/Delete/5
        [Authorize(Users = "a@b.c")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HourMarking hourMarking = db.HourMarkings.Find(id);
            if (hourMarking == null)
            {
                return HttpNotFound();
            }
            return View(hourMarking);
        }

        // POST: HourMarkings/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            HourMarking hourMarking = db.HourMarkings.Find(id);
            db.HourMarkings.Remove(hourMarking);
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
