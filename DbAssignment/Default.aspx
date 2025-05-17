<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DbAssignment.Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Business Web App - Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 80px;
        }
        .card {
            border-radius: 16px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }
        .btn-custom {
            background-color: #0d6efd;
            color: #fff;
            border-radius: 8px;
            padding: 10px 20px;
            transition: background-color 0.3s;
        }
        .btn-custom:hover {
            background-color: #0b5ed7;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card text-center p-5">
                        <h2 class="mb-4">Welcome to the Enterprise Web Application</h2>
                        <p class="mb-4 text-muted">Manage your business efficiently and securely with our platform.</p>
                        <div>
                            <asp:HyperLink ID="hlLogin" runat="server" NavigateUrl="Login.aspx" CssClass="btn btn-custom">Login</asp:HyperLink>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
