using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(HourMarkingCase.Startup))]
namespace HourMarkingCase
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);

        }
    }

}
