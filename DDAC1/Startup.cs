using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(DDAC1.Startup))]
namespace DDAC1
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
