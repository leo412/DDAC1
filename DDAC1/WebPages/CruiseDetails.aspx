       <%@ Page Title="Cruise Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CruiseDetails.aspx.cs" Inherits="DDAC1.WebPages.CruiseDetails" Async="true" %>


<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

<html>
    
<body>


 <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
       <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>   
    <div id="CruiseMenu" style="text-align: center">

    <title></title>
</head>
<body>
    
    <%--<asp:QueryStringParameter DefaultValue="0" Name="JourneyID" 
                QueryStringField="ID" />--%>



    <div>
        <asp:ListView ID="JourneyList" runat="server"
 DataKeyNames="JourneyID" 
 ItemType="DDAC1.Models.Journey"
SelectMethod="GetJourneyDetails">

<ItemTemplate>
 <td runat="server">
     

 <table>
     
<thead>

        <tr>
            <th style="border: thin solid #C0C0C0" scope="col">Journey Number</th>
            <th style="border: thin solid #C0C0C0" scope="col">From:</th>
            <th style="border: thin solid #C0C0C0" scope="col">To:</th>
            <th style="border: thin solid #C0C0C0"scope="col">Start at:</th>
            <th style="border: thin solid #C0C0C0"scope="col">End at:</th>

        </tr>
    </thead>
    <tbody>
        <tr>
            <th id="JourneyID" style="border: thin solid #C0C0C0" scope="row"><%#:Item.JourneyID%></th>
            <td id="FromWhere"style="border: thin solid #C0C0C0"><%#:Item.FromWhere%></td>
            <td id="ToWhere"style="border: thin solid #C0C0C0"><%#:Item.ToWhere%></td>
            <td id="FromDate"style="border: thin solid #C0C0C0"><%#:Item.FromDate%></td>
            <td id="ToDate"style="border: thin solid #C0C0C0"><%#:Item.ToDate%></td>


 <span class="ProductListItem">
 </span>
 </a></td>
        </tr>
    </tbody>
   </table>
     <span><br /></span>
 <tr>
 <td>



 </td>
 </tr>


</p>
 </td>
   
  

     
 </ItemTemplate>
 </asp:ListView>   
        <asp:ListView ID="CruiseDetail" runat="server"
 DataKeyNames="CruiseID" 
 ItemType="DDAC1.Models.Cruise"
SelectMethod="GetCruiseDetails">

<ItemTemplate>
 <td runat="server">
     

 <table>
     
<thead>

        <tr>
            <th style="border: thin solid #C0C0C0" scope="col">CruiseId</th>
            <th  style="border: thin solid #C0C0C0" scope="col">CruiseName</th>
            <th style="border: thin solid #C0C0C0" scope="col">Inside Cabin Price (RM)</th>
            <th style="border: thin solid #C0C0C0"scope="col">Ocean View Cabin Price(RM)</th>
            <th style="border: thin solid #C0C0C0"scope="col">Balcony Cabin Price(RM)</th>

        </tr>
    </thead>
    <tbody>
        <tr>
            <th style="border: thin solid #C0C0C0" scope="row"><%#:Item.CruiseID%></th>
                        <td id="CruiseName" style="border: thin solid #C0C0C0"><%#:Item.CruiseName%></td>

            <td id="InsidePrice" style="border: thin solid #C0C0C0"><%#:Item.InsideCabinPrice%></td>
            <td id="OceanPrice"style="border: thin solid #C0C0C0"><%#:Item.OceanViewCabinPrice%></td>
            <td id="BalconyPrice"style="border: thin solid #C0C0C0"><%#:Item.BalconyCabinPrice%></td>
            
                
 
 </a></td>
        </tr>
    </tbody>
     <tbody>
        <tr>
            <th style="border: thin solid #C0C0C0" scope="row">Function</th>
             <td style="border: thin solid #C0C0C0"><a href="PurchaseConfirmation.aspx?JourneyID=1"target='_blank'>View Cruise</td>

            <td style="border: thin solid #C0C0C0"><asp:Button runat="server" ID="Button1" Text="Buy" OnClientClick = " return Purchase1()" /></td>
            <td style="border: thin solid #C0C0C0"><asp:Button runat="server" ID="Button2" Text="Buy" OnClientClick = " return Purchase2()" /></td>
            <td style="border: thin solid #C0C0C0"><asp:Button runat="server" ID="Button3" Text="Buy" OnClientClick = " return Purchase3()" /></td>

     
               
 
 </a></td>
        </tr>
    </tbody>








   </table>
     <span><br /></span>
 <tr>
 <td>



 </td>  
 </tr>


</p>
 </td>
   
  

     
 </ItemTemplate>
 </asp:ListView> 
    </div>

        <script>
            
            function Purchase1() {
                if (confirm("You are going to buy a ticket for Inside Cabin for the cruise " + $("#CruiseName").html() + "\n Price: RM" + $("#InsidePrice").html() + "\nDeparture Location: " + $("#FromWhere").html() + "\nDestination: " + $("#ToWhere").html() + "\nStart At: " + $("#FromDate").html() + "\nEnd At: " + $("#ToDate").html()+"\n Confirming Purchase?")) {
                   
                    var Purchasement = {
                        journeyID: $("#JourneyID").html(),
                       username: $("#email").html(),
                        cabintype:'InsideViewCabin'

                    };
          
                    $.ajax({  
                        type: "POST",  
                        url: "CruiseDetails.aspx/BuyTicket",  
                        data: JSON.stringify(Purchasement),
                        contentType: "application/json; charset=utf-8",  
                        dataType: "json",  
                        success: function (response) {  
                            alert("Ticket is purchased successfully.");  
                            window.location.reload();  
                        }  
                    });  
                 
                
                   
                  
                }


            }

            function Purchase2() {
                if (confirm("You are going to buy a ticket for Outside View Cabin for the cruise " + $("#CruiseName").html() + "\n Price: RM" + $("#OceanPrice").html() + "\nDeparture Location: " + $("#FromWhere").html() + "\nDestination: " + $("#ToWhere").html() + "\nStart At: " + $("#FromDate").html() + "\nEnd At: " + $("#ToDate").html() + "\n Confirming Purchase?")) {

                    var Purchasement = {
                        journeyID: $("#JourneyID").html(),
                        username: $("#email").html(),
                        cabintype: 'OceanViewCabin'

                    };

                    $.ajax({
                        type: "POST",
                        url: "CruiseDetails.aspx/BuyTicket",
                        data: JSON.stringify(Purchasement),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            alert("Ticket is purchased successfully.");
                            window.location.reload();
                        }
                    });




                }


            }
            function Purchase3() {
                if (confirm("You are going to buy a ticket for Balcony Cabin for the cruise " + $("#CruiseName").html() + "\n Price: RM" + $("#BalconyPrice").html() + "\nDeparture Location: " + $("#FromWhere").html() + "\nDestination: " + $("#ToWhere").html() + "\nStart At: " + $("#FromDate").html() + "\nEnd At: " + $("#ToDate").html() + "\n Confirming Purchase?")) {

                    var Purchasement = {
                        journeyID: $("#JourneyID").html(),
                        username: $("#email").html(),
                        cabintype: 'BalconyCabin'

                    };

                    $.ajax({
                        type: "POST",
                        url: "CruiseDetails.aspx/BuyTicket",
                        data: JSON.stringify(Purchasement),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            alert("Ticket is purchased successfully.");
                            window.location.reload();
                        }
                    });




                }


            }
            var id = Request.QueryString["JourneyId"];
            alert(id);
            $(document).ready(function () {


                alert("ASD");

            });

            myLink.HRef = "CruiseDetails.aspx?JourneyId=" + id + "&amp;model=1020";

        </script>



</body>
</html>
        </asp:Content>
