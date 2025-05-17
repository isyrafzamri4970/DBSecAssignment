<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="DbAssignment.Header" %>

<div class="navbar">
    <asp:Button ID="btnHome" runat="server" Text="Home" OnClick="btnHome_Click" />
    <asp:Button ID="btnEmployee" runat="server" Text="Employee" OnClick="btnEmployee_Click" />
    <asp:Button ID="btnAdmin" runat="server" Text="Admin" OnClick="btnAdmin_Click" />
    <asp:Button ID="btnCreditCard" runat="server" Text="Credit Card" OnClick="btnCreditCard_Click" />
    <asp:Button ID="btnCustomer" runat="server" Text="Customer" OnClick="btnCustomer_Click" />
    <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" />
    <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
   <!-- <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" /> -->
</div>

<style>
    .navbar {
        background-color: #333;
        padding: 10px;
        border-radius: 8px;
        text-align: center;
    }
    .navbar button {
        background-color: #555;
        color: white;
        margin: 5px;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
    }
    .navbar button:hover {
        background-color: #777;
    }
</style>

