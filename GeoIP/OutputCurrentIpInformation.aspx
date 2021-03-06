﻿<%@ Page Language="C#" AutoEventWireup="true" %>
<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="Sitecore.Analytics" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
<form id="form1" runat="server">
    <div>
        <script runat="server">
            protected void Page_Load()
            {
                Response.Write("<p><b>======== Request Information ========</b></p>");
                var ipAddress = HttpContext.Current.Request.UserHostAddress;
                Response.Write("<p>IpAddress: " + ipAddress + "</p>");
                foreach (var key in HttpContext.Current.Request.Headers.AllKeys)
                {
                    Response.Write("<p>" + key + ": " + HttpContext.Current.Request.Headers[key] + "</p>");
                }
                Response.Write("<p><b>======== Analytics Information ========</b></p>");
                if (Tracker.Current == null || Tracker.Current.Interaction == null || Tracker.Current.Interaction.Ip == null)
                {
                    Response.Write("<p>Interaction Ip is null</p>");
                }
                else
                {
                    Response.Write("<p>Interaction Ip is " + new IPAddress(Tracker.Current.Interaction.Ip) + "</p>");
                    Response.Write("<p>Interaction.HasGeoIpData is " + Tracker.Current.Interaction.HasGeoIpData + "</p>");
                    Response.Write("<p>Interaction.GeoData.Country Ip is " + Tracker.Current.Interaction.GeoData.Country + "</p>");
                    Response.Write("<p>Interaction.GeoData.City Ip is " + Tracker.Current.Interaction.GeoData.City + "</p>");
                }
            }
        </script>
    </div>
</form>
</body>
</html>