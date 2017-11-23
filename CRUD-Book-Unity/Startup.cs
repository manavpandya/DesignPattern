using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(CRUD_Book_Unity.Startup))]
namespace CRUD_Book_Unity
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
