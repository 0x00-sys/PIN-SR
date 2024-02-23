<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Web_Application.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>
    <link rel="stylesheet" type="text/css" href="Home.css" />
</head>
<body>
    <!-- Navbar -->
    <div class="navbar">
        <div class="navbar-header">Store Prototype</div>
        <a href="Home.aspx">Home</a>
        <a href="About.aspx">About</a>
        <a href="Shop.aspx">Shop</a>
        <a href="Users.aspx">Users</a>
    </div>
    <form id="form1" runat="server">
        <div class="welcome-banner">
            <h1>Welcome to Our Shop</h1>
            <p>Discover our exclusive range of products.</p>
        </div>
        <div class="container">
            <div class="image-grid">
                <img src="https://picsum.photos/200/300" alt="Product 1">
                <img src="https://picsum.photos/200/300?random=1" alt="Product 2">
                <img src="https://picsum.photos/200/300?random=2" alt="Product 3">
            </div>
        </div>
    </form>
        <!-- Footer -->
        <footer>
            &copy; 2024 - PIN SEMINARSKI RAD
        </footer>
</body>
</html>