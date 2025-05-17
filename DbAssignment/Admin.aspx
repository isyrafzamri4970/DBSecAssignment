<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="DbAssignment.Admin" %>
<%@ Register TagPrefix="uc" TagName="Header" Src="Header.ascx" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Panel</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body { background-color: #f8f9fa; }
        .container { margin-top: 50px; }
        .card { padding: 20px; border-radius: 10px; }
        .btn-custom { background-color: #0d6efd; color: #fff; border-radius: 8px; }
        .btn-custom:hover { background-color: #0b5ed7; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <uc:Header runat="server" />

        <div class="container">
            <h2 class="text-center mb-4">Admin Panel</h2>
            
            <div class="row">
                <asp:Label ID="lblMessage" runat="server" CssClass="alert alert-danger mt-2" Visible="false"></asp:Label>
                <asp:Label ID="lblCustomerMessage" runat="server" CssClass="alert alert-danger mt-2" Visible="false"></asp:Label>
                <!-- Employees Section -->
                <div class="col-md-6">
                    <div class="card">
                        <h4>Employees</h4>
                        <asp:GridView ID="gvEmployees" runat="server" CssClass="table table-bordered" AutoGenerateColumns="true"></asp:GridView>

                        <asp:TextBox ID="txtEmployeeName" runat="server" Placeholder="Name" CssClass="form-control mb-2"></asp:TextBox>
                        <asp:TextBox ID="txtEmployeeEmail" runat="server" Placeholder="Email" CssClass="form-control mb-2"></asp:TextBox>
                        <asp:TextBox ID="txtEmployeeDepartment" runat="server" Placeholder="Department" CssClass="form-control mb-2"></asp:TextBox>
                        <asp:Button ID="btnAddEmployee" runat="server" Text="Add Employee" CssClass="btn btn-custom mb-2" OnClick="btnAddEmployee_Click" />
                        
                        <asp:TextBox ID="txtEmployeeID" runat="server" Placeholder="Employee ID (Delete/Edit)" CssClass="form-control mb-2"></asp:TextBox>
                        <asp:Button ID="btnDeleteEmployee" runat="server" Text="Delete Employee" CssClass="btn btn-danger mb-2" OnClick="btnDeleteEmployee_Click" />
                        <asp:Button ID="btnEditEmployee" runat="server" Text="Edit Employee" CssClass="btn btn-warning mb-2" OnClick="btnEditEmployee_Click" />
                        <asp:Button ID="btnExportEmployees" runat="server" Text="Export Employees" CssClass="btn btn-info mb-2" OnClick="btnExportEmployees_Click" />
                    </div>
                </div>

                <!-- Customers Section -->
                <div class="col-md-6">
                    <div class="card">
                        <h4>Customers</h4>
                        <asp:GridView ID="gvCustomers" runat="server" CssClass="table table-bordered" AutoGenerateColumns="true"></asp:GridView>

                        <asp:TextBox ID="txtCustomerName" runat="server" Placeholder="Name" CssClass="form-control mb-2"></asp:TextBox>
                        <asp:TextBox ID="txtCustomerEmail" runat="server" Placeholder="Email" CssClass="form-control mb-2"></asp:TextBox>
                        <asp:TextBox ID="txtCustomerPhone" runat="server" Placeholder="Phone" CssClass="form-control mb-2"></asp:TextBox>
                        <asp:Button ID="btnAddCustomer" runat="server" Text="Add Customer" CssClass="btn btn-custom mb-2" OnClick="btnAddCustomer_Click" />

                        <asp:TextBox ID="txtCustomerID" runat="server" Placeholder="Customer ID (Delete/Edit)" CssClass="form-control mb-2"></asp:TextBox>
                        <asp:Button ID="btnDeleteCustomer" runat="server" Text="Delete Customer" CssClass="btn btn-danger mb-2" OnClick="btnDeleteCustomer_Click" />
                        <asp:Button ID="btnEditCustomer" runat="server" Text="Edit Customer" CssClass="btn btn-warning mb-2" OnClick="btnEditCustomer_Click" />
                        <asp:Button ID="btnExportCustomers" runat="server" Text="Export Customers" CssClass="btn btn-info mb-2" OnClick="btnExportCustomers_Click" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>