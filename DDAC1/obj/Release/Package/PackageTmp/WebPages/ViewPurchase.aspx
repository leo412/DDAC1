<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewPurchase.aspx.cs" Inherits="DDAC1.WebPages.ViewPurchase" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    
 <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
       <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>   

        <asp:ListView ID="TicketList" runat="server"
 DataKeyNames="email" GroupItemCount="10"
 ItemType="DDAC1.Models.Ticket"
SelectMethod="GetTicketDetails">
            <EmptyDataTemplate>
 <table runat="server">
 <tr>
 <td>No Purchased Ticket</td>
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
            <th style="border: thin solid #C0C0C0" scope="col">Ticket ID:</th>
            <th style="border: thin solid #C0C0C0" scope="col">Cabin:</th>
          

        </tr>
    </thead>
    <tbody>
        <tr>
            <th style="border: thin solid #C0C0C0" scope="row"><%#:Item.JourneyID%></th>
            <td style="border: thin solid #C0C0C0"><%#:Item.TicketID%></td>
            <td style="border: thin solid #C0C0C0"><%#:Item.CabinType%></td>
         
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



</asp:Content>
