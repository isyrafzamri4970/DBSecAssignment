<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DbAssignment.Login" %>
<%@ Register TagPrefix="uc" TagName="Header" Src="Header.ascx" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Business Web App - Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f8f9fa;
        }
        .login-container {
            margin-top: 100px;
            max-width: 400px;
            padding: 40px;
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }
        .btn-custom {
            background-color: #0d6efd;
            color: #fff;
            border-radius: 8px;
            padding: 10px 20px;
            transition: background-color 0.3s;
            width: 100%;
        }
        .btn-custom:hover {
            background-color: #0b5ed7;
        }
        .form-control {
            margin-bottom: 20px;
            border-radius: 8px;
        }
        .text-muted {
            font-size: 0.9em;
        }
        .alert {
            border-radius: 8px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Include the Header with Home button -->
        <uc:Header runat="server" />

        <div class="container">
            <div class="login-container mx-auto">
                <h3 class="text-center mb-4">Login</h3>

                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" Placeholder="Username"></asp:TextBox>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" Placeholder="Password"></asp:TextBox>

                <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-custom" OnClick="btnLogin_Click" />

                <asp:Label ID="lblMessage" runat="server" CssClass="alert alert-danger mt-3" Visible="false"></asp:Label>

                <div class="text-center mt-3">
                    <!-- <a href="Register.aspx" class="text-muted">Don't have an account? Register</a> -->
                </div>
            </div>
        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>