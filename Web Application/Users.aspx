<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="Web_Application.Users" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Users</title>
    <link rel="stylesheet" type="text/css" href="Users.css" />
</head>
<body>
    <!-- Navbar -->
    <div class="navbar">
        <div class="navbar-header">Store Prototype</div>
        <a href="#home">Home</a>
        <a href="#about">About</a>
        <a href="shop.aspx" class="navbar-button">Shop</a>
    </div>

    <form id="form1" runat="server">
        <div class="container">
            <div>
                <h2 class="white-text">Registered Users</h2>
            </div>
            <div>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="True" CssClass="my-gridview">
                </asp:GridView>
            </div>
        </div>
    </form>

    <!-- Footer -->
    <footer>
        &copy; 2024 - PIN SEMINARSKI RAD
    </footer>
</body>
</html>