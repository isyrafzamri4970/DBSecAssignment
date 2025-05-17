<%@ Register TagPrefix="uc" TagName="Header" Src="Header.ascx" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 0;
        }

        .registration-container {
            width: 400px;
            margin: 80px auto;
            padding: 30px;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 10px;
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .form-group input[type="text"],
        .form-group input[type="email"],
        .form-group input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .form-group input:focus {
            border-color: #007bff;
            outline: none;
        }

        .btn-submit {
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            border: none;
            color: white;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn-submit:hover {
            background-color: #0056b3;
        }

        .message {
            margin-top: 15px;
            text-align: center;
            color: red;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Include the Header with Home button -->
        <uc:Header runat="server" />

        <div class="registration-container">
            <h2>User Registration</h2>

            <div class="form-group">
                <asp:Label ID="lblUsername" runat="server" Text="Username:" AssociatedControlID="txtUsername" />
                <asp:TextBox ID="txtUsername" runat="server" />
            </div>

            <div class="form-group">
                <asp:Label ID="lblEmail" runat="server" Text="Email:" AssociatedControlID="txtEmail" />
                <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" />
            </div>

            <div class="form-group">
                <asp:Label ID="lblPassword" runat="server" Text="Password:" AssociatedControlID="txtPassword" />
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
            </div>

            <div class="form-group">
                <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password:" AssociatedControlID="txtConfirmPassword" />
                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" />
            </div>

            <asp:Button ID="btnRegister" runat="server" CssClass="btn-submit" Text="Register" OnClick="btnRegister_Click" />

            <asp:Label ID="lblMessage" runat="server" CssClass="message" />
        </div>
    </form>
</body>
</html>