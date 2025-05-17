﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="DbAssignment.Employee" %>
<%@ Register TagPrefix="uc" TagName="Header" Src="Header.ascx" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Dashboard</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f5f5f5; margin: 0; padding: 20px; }
        .container { background-color: #fff; padding: 20px; border-radius: 10px; box-shadow: 0 0 10px rgba(0,0,0,0.1); max-width: 800px; margin: auto; }
        .header { text-align: center; color: #007bff; font-size: 24px; margin-bottom: 20px; }
        .btn-container { text-align: center; margin-top: 20px; }
        .btn { padding: 10px; border: none; border-radius: 5px; cursor: pointer; margin: 5px; }
        .btn-home { background-color: #28a745; color: white; }
        .btn-logout { background-color: #dc3545; color: white; }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <!-- Header User Control -->
        <uc:Header runat="server" />

        <div class="container">
            <div class="header">Employee Dashboard</div>

            <!-- Employee Info -->
            <div>
                <asp:Label ID="lblEmployeeName" runat="server" Font-Size="20px" />
                <p>Your assigned tasks:</p>
                <asp:GridView ID="gvTasks" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="TaskID" HeaderText="Task ID" />
                        <asp:BoundField DataField="TaskName" HeaderText="Task" />
                        <asp:BoundField DataField="Deadline" HeaderText="Deadline" />
                    </Columns>
                </asp:GridView>
            </div>

            <!-- Navigation Buttons -->
            <div class="btn-container">
                <asp:Button ID="btnHome" runat="server" Text="Home" CssClass="btn btn-home" OnClick="btnHome_Click" />
                <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn btn-logout" OnClick="btnLogout_Click" />
            </div>

        </div>
    </form>
</body>
</html>