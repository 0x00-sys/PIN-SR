<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Web_Application.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="Login.css" />
</head>
<body>
    <!-- Navbar -->
    <div class="navbar">
        <div class="navbar-header">Store Prototype</div>
        <a href="#home">Home</a>
        <a href="#about">About</a>
    </div>

    <form runat="server" class="container">
        <div>
            <h2>Login</h2>
            <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red" CssClass="error-message"></asp:Label>
        </div>
        <div>
            <label for="txtUsername">Username:</label>
            <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
            <label for="txtPassword">Password:</label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
            <asp:Button ID="btnToRegisterPage" runat="server" Text="Don't have an account? Register here." PostBackUrl="~/Default.aspx" />
        </div>
    </form>

    <!-- Footer -->
    <footer>
        &copy; 2024 - PIN SEMINARSKI RAD
    </footer>
</body>
</html>