<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreditCard.aspx.cs" Inherits="DbAssignment.CreditCard" %>
<%@ Register TagPrefix="uc" TagName="Header" Src="Header.ascx" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Credit Cards</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f5f5f5; margin: 0; padding: 20px; }
        .container { background-color: #fff; padding: 20px; border-radius: 10px; box-shadow: 0 0 10px rgba(0,0,0,0.1); max-width: 800px; margin: auto; }
        .header { text-align: center; color: #007bff; font-size: 24px; margin-bottom: 20px; }
        .card-details { background-color: #eef; padding: 15px; margin-bottom: 10px; border-radius: 5px; display: flex; justify-content: space-between; }
        .customer-id { font-weight: bold; color: #333; }
        .actions { text-align: right; }
        .btn { padding: 5px 10px; border: none; border-radius: 5px; cursor: pointer; margin-left: 5px; }
        .btn-edit { background-color: #ffc107; color: white; }
        .btn-delete { background-color: #dc3545; color: white; }
        .btn-add { background-color: #28a745; color: white; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- ✅ Header User Control -->
        <uc:Header runat="server" />

        <div class="container">
            <div class="header">Manage Credit Cards</div>

            <!-- ✅ Add Credit Card Form -->
            <div>
                <asp:TextBox ID="txtCardType" runat="server" Placeholder="Card Type" />
                <asp:TextBox ID="txtCardNumber" runat="server" Placeholder="Card Number" />
                <asp:TextBox ID="txtExpMonth" runat="server" Placeholder="Exp Month" />
                <asp:TextBox ID="txtExpYear" runat="server" Placeholder="Exp Year" />
                <asp:Button ID="btnAddCard" runat="server" Text="Add Card" CssClass="btn btn-add" OnClick="btnAddCard_Click" />
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red" />
            </div>

            <!-- ✅ Repeater to List Credit Cards -->
            <asp:Repeater ID="rptCreditCards" runat="server" OnItemCommand="rptCreditCards_ItemCommand">
                <ItemTemplate>
                    <div class="card-details">
                        <div>
                            <asp:Label ID="lblCustID" runat="server" CssClass="customer-id" Text='<%# "Customer ID: " + Eval("CustID") %>' />
                            <asp:Label ID="lblCardType" runat="server" CssClass="card-type" Text='<%# "Card Type: " + Eval("CardType") %>' />
                            <asp:Label ID="lblCardNumber" runat="server" CssClass="card-number" Text='<%# "Card Number: " + Eval("CardNumber") %>' />
                            <asp:Label ID="lblExpDate" runat="server" CssClass="card-expiry" Text='<%# "Expiry: " + Eval("ExpMonth") + "/" + Eval("ExpYear") %>' />
                        </div>
                        <div class="actions">
                            <asp:Button CommandName="Edit" CommandArgument='<%# Eval("CardID") %>' CssClass="btn btn-edit" runat="server" Text="Edit" />
                            <asp:Button CommandName="Delete" CommandArgument='<%# Eval("CardID") %>' CssClass="btn btn-delete" runat="server" Text="Delete" />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </form>
</body>
</html>