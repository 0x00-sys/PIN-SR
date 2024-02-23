<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Web_Application.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration</title>
    <link rel="stylesheet" type="text/css" href="Default.css" />
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: #333;
        }

        /* Styles for the navbar */
        .navbar {
            background-color: #222; /* Darker gray */
            overflow: hidden;
            position: fixed;
            top: 0;
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: start;
            padding: 0 16px;
        }

        .navbar a {
            display: block;
            color: #ddd; /* Lighter gray */
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        .navbar a:hover {
            background-color: #444; /* Medium gray */
            color: white;
        }

        .navbar .navbar-header {
            display: block;
            color: #ddd; /* Lighter gray */
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
            font-size: 1.5em;
        }

        h2 {
            color: #fff;
            font-size: 2em;
            font-weight: bold;
            margin-bottom: 1em;
        }

        label {
            color: #fff;
            display: block;
            margin-bottom: .5em;
        }

        .container {
            text-align: left;
            padding: 2em;
            background-color: rgba(100, 100, 100, 0.8);
            box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);
            border-radius: 8px;
            width: 400px;
            max-width: 90%;
        }

        /* Styles for the input fields */
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 1em;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
            border-radius: 4px;
        }

        /* Styles for the buttons */
        input[type="submit"], button {
            background-color: #333; /* Dark gray */
            border: none;
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            transition-duration: 0.4s;
            border-radius: 12px; /* Rounded corners */
            width: 100%;
        }

        input[type="submit"]:hover, button:hover {
            background-color: #555; /* Lighter gray */
        }

        /* Styles for the footer */
        footer {
            position: fixed;
            left: 0;
            bottom: 0;
            width: 100%;
            background-color: transparent;
            color: #fff;
            text-align: center;
            padding: 10px 0;
        }
    </style>
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
            <h2>Registration</h2>
            <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red" CssClass="error-message"></asp:Label>
        </div>
        <div>
            <label for="txtUsername">Username:</label>
            <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
            <label for="txtFullName">Full Name:</label>
            <asp:TextBox ID="txtFullName" runat="server"></asp:TextBox>
            <label for="txtPassword">Password:</label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
            <label for="txtRepeatPassword">Repeat Password:</label>
            <asp:TextBox ID="txtRepeatPassword" runat="server" TextMode="Password"></asp:TextBox>
            <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" />
            <asp:Button ID="btnToLoginPage" runat="server" Text="Already have an account? Log in here." PostBackUrl="~/Login.aspx" />
        </div>
    </form>

    <!-- Footer -->
    <footer>
        &copy; 2024 - PIN SEMINARSKI RAD
    </footer>
</body>
</html>