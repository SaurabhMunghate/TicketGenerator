using System.Web.Mvc;
using System.Web.Routing;
using Microsoft.AspNet.FriendlyUrls;

namespace TicketGenerator
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            var settings = new FriendlyUrlSettings();
            settings.AutoRedirectMode = RedirectMode.Permanent;
            routes.EnableFriendlyUrls(settings);
            routes.MapPageRoute("Login", "Login", "~/Views/Login.aspx");
            routes.MapPageRoute("Dashboard", "Dashboard", "~/Views/Dashboard.aspx"); 
            routes.MapPageRoute("QRgenerat", "QRgenerat", "~/Views/QRgenerat.aspx");
            routes.MapPageRoute("Ticket", "Ticket", "~/Views/Ticket.aspx");
            routes.MapPageRoute("Ticket1", "Ticket1", "~/Views/Ticket1.aspx");
            routes.MapPageRoute("Ticket2", "Ticket2", "~/Views/Ticket2.aspx");
            routes.MapPageRoute("TicketBox", "TicketBox", "~/Views/TicketBox.aspx");
        }
    }
}
