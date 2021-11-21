using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Headers;
using System.Web.Http;


namespace Lab9MVC2
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
             config.MapHttpAttributeRoutes();

            config.Routes.MapHttpRoute(
                name: "WApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );
            config.Formatters.JsonFormatter.SupportedMediaTypes.Add(new MediaTypeHeaderValue("text/html"));
        }
    }
}
