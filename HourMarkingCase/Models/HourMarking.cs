//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace HourMarkingCase.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class HourMarking
    {
        public int id { get; set; }
        public decimal hours { get; set; }
        public System.DateTime date { get; set; }
        public int userId { get; set; }
        public int workTargetId { get; set; }
        public int tagId { get; set; }
    
        public virtual Tag Tag { get; set; }
        public virtual User User { get; set; }
        public virtual WorkTarget WorkTarget { get; set; }
    }
}