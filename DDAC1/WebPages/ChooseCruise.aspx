       <%@ Page Title="Choose Cruise" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChooseCruise.aspx.cs" Inherits="DDAC1.WebPages.ChooseCruise" Async="true" %>


<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

<html>
    
<body>


 <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
       <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>   
    <div id="CruiseMenu" style="text-align: center">

<%--            <asp:Calendar ID="FromDate" runat="server"  SelectionMode="DayWeekMonth" >
                            </asp:Calendar>
           <asp:Calendar ID="ToDate" runat="server"  SelectionMode="DayWeekMonth" >
                            </asp:Calendar>--%>
        



  <div>
      Start From:
    <asp:TextBox id="txtStartDate" runat="server" />
    <label  id="Warning1"></label>

  </div>
  <div>
      To:
    <asp:TextBox id="txtEndDate" runat="server" />
    <label  id="Warning2"></label>

  </div>
                 From:
<asp:DropDownList ID="DropDownListFromWhere"  runat="server"
 ItemType="DDAC1.Models.Journey"
SelectMethod="GetDistinctCountries" DataTextField="FromWhere"
 DataValueField="FromWhere" 
     AppendDataBoundItems ="true"
    >
    

     <asp:ListItem Text="Any Country" Value="0" />

 </asp:DropDownList>

        Destination:
        <asp:DropDownList ID="DropDownListToWhere"  runat="server"
 ItemType="DDAC1.Models.Journey"
SelectMethod="GetDistinctCountries2" DataTextField="ToWhere"
 DataValueField="ToWhere" 
            AppendDataBoundItems ="true">
     <asp:ListItem Text="Any Country" Value="0" />
 </asp:DropDownList>

        <div id="Table"> 

            <p>
    
     <asp:Button ID="btnSearch" runat="server" Text="Search" />
 </p>

        <asp:ListView ID="JourneyList" runat="server"
 DataKeyNames="JourneyID" GroupItemCount="10"
 ItemType="DDAC1.Models.Journey"
SelectMethod="SearchCruise">
            <EmptyDataTemplate>
 <table runat="server">
 <tr>
 <td>No Available Cruise.</td>
 </tr>
 </table>
 </EmptyDataTemplate>
 <EmptyItemTemplate>
 <td runat="server" />
 </EmptyItemTemplate>
 <GroupTemplate>
 <tr id="itemPlaceholderContainer" runat="server">
 <td id="itemPlaceholder" runat="server"></td>
 </tr>
 </GroupTemplate>
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
            <th style="border: thin solid #C0C0C0" scope="row"><%#:Item.JourneyID%></th>
            <td style="border: thin solid #C0C0C0"><%#:Item.FromWhere%></td>
            <td style="border: thin solid #C0C0C0"><%#:Item.ToWhere%></td>
            <td style="border: thin solid #C0C0C0"><%#:Item.FromDate%></td>
            <td style="border: thin solid #C0C0C0"><%#:Item.ToDate%></td>
            <td style="border: thin solid #C0C0C0"> 
                <a href="CruiseDetails.aspx?JourneyID=<%#:Item.JourneyID %>">
 <span class="ProductListItem">
 <b>View Details<b>
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
<tr>
 <td>&nbsp;</td>
 </tr>

</p>
 </td>
     
  

     
 </ItemTemplate>
<LayoutTemplate>
 <table runat="server" style="width:100%;">
 <tbody>
 <tr runat="server">
 <td runat="server">
 <table id="groupPlaceholderContainer"
runat="server" style="width:100%">
 <tr id="groupPlaceholder"
runat="server"></tr>
 </table>
 </td>
 </tr>
<tr runat="server">
 <td runat="server"></td>
 </tr>
<tr></tr>
 </tbody>
 </table>
 </LayoutTemplate>
   

             </asp:ListView>
        </div>
          <table border="0" style="margin-left:2%; margin-top:2%; ">
           

 </table>
        <div id="Testing">
            Testing if no change dead

        </div>



    




    </div>

    <script>

        



        var selectedDate="Default";
       


        $("#MainContent_txtStartDate").datepicker(
            {

                minDate: new Date(),

               
                onSelect: function (text, instance) {
                    selectedDate = "Start";
                    
                    customRange(selectedDate);
                  
                }
            }
            );
        $("#MainContent_txtEndDate").datepicker({
            minDate: new Date(),

            onSelect: function (text, instance) {
                selectedDate = "End";

                customRange(selectedDate);
               

            }
        });
        //$("#MainContent_txtStartDate").datepicker("setDate", new Date());
        //$("#MainContent_txtEndDate").datepicker("setDate", new Date());

        //$("#SearchButton").click(function () {

        //    PageMethods.Testing("Name", function (result) {
        //        alert(result);
        //    });
        //});



        $("#SearchButton").click(function () {

            //var a="{FromWhere:'SADASD',ToWhere:'HI',ToDate:$('#MainContent_txtStartDate').datepicker('getDate'),FromDate:$('#MainContent_txtEndDate').datepicker('getDate')}";

            $.ajax({
                //url: "ChooseCruise.aspx/Testing",
                
                type: "POST",
                url: "ChooseCruise.aspx/SearchCruise",
                //data: json.stringify('{ gg: "ASD" }'),
                contentType: 'application/json; charset=UTF-8', 

                data: JSON.stringify({ FromWhere: 'SADASD', ToWhere: 'HI', ToDate: $('#MainContent_txtStartDate').datepicker('getDate'), FromDate: $('#MainContent_txtEndDate').datepicker('getDate') }),
                
                dataType: "json",
                async: false,
                success: function (data) {
                 
                    alert(data);
                    $("#JourneyList").load(location.href + " #JourneyList");

                    // Do something with the return value from.Net method
                },
                error: function (err) {
                    alert(err.responseText);
                }
            });
           // $("#Table").load(location.href + " #mydiv");

          
        });

       
        
       
        
        

        function customRange(selectedDate) {
            var min = new Date(), //Set this to your absolute minimum date
                           

                dateMin = min,
                dateMax = null, 
                dayRange =30; // Set this to the range of days you want to restrict to

            if (selectedDate === "Start") {
                


                if ($("#MainContent_txtEndDate").datepicker("getDate") != null) {
                    initialDate = $("#MainContent_txtStartDate").datepicker("getDate");
                    dateMax = $("#MainContent_txtEndDate").datepicker("getDate");
                    dateMin = $("#MainContent_txtEndDate").datepicker("getDate");
                    
                    dateMin.setDate(dateMin.getDate() - dayRange);

                    if ($("#MainContent_txtEndDate").datepicker("getDate") < $("#MainContent_txtStartDate").datepicker("getDate")) {
                        dateMin = min;
                        ($("#MainContent_txtStartDate").datepicker("setDate", null));
                        alert("To Date cannot be earlier than From Date");
                        //$("#Warning1").text("To Date cannot be earlier than From Date");
                    }
                }
                else {
                    dateMax = new Date; //Set this to your absolute maximum date
                }
            }
            else if (selectedDate === "End") {
                dateMax = new Date; //Set this to your absolute maximum date
                initialDate = $("#MainContent_txtEndDate").datepicker("getDate");

                if ($("#MainContent_txtStartDate").datepicker("getDate") != null) {
                    dateMin = $("#MainContent_txtStartDate").datepicker("getDate");
                    var rangeMax = new Date(dateMin.getFullYear(), dateMin.getMonth(), dateMin.getDate() + dayRange);

                    if ($("#MainContent_txtEndDate").datepicker("getDate") < $("#MainContent_txtStartDate").datepicker("getDate")) {
                        // dateMax = rangeMax;
                        ($("#MainContent_txtEndDate").datepicker("setDate", null));
                        alert("To Date cannot be earlier than From Date");
                        
                        //$("#Warning2").text("To Date cannot be earlier than From Date");

                    }
                }
            }
            return {
                minDate: dateMin,
                maxDate: dateMax
            };
            
        }

       
  

</script>




</body>
</html>
    </asp:Content>
