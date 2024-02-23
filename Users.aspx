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
        <a href="Home.aspx">Home</a>
        <a href="About.aspx">About</a>
        <a href="shop.aspx">Shop</a>
    </div>

    <form id="form1" runat="server">
        <div class="container">
            <div>
                <h2 class="white-text">Registered Users</h2>
            </div>
            <div>
                <asp:DropDownList ID="ddlUsersPerPage" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlUsersPerPage_SelectedIndexChanged" CssClass="styled-dropdown">
                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                    <asp:ListItem Text="10" Value="10"></asp:ListItem>
                    <asp:ListItem Text="15" Value="15"></asp:ListItem>
                    <asp:ListItem Text="20" Value="20"></asp:ListItem>
                </asp:DropDownList>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="True" CssClass="my-gridview" AllowPaging="True" PageSize="5" OnPageIndexChanging="GridView1_PageIndexChanging">
                    <PagerTemplate>
                        <div class="gridview-pager">
                            <asp:LinkButton ID="lnkPrev" runat="server" CommandArgument="Prev" OnClick="PagerButtonClick">Prev</asp:LinkButton>
                            <asp:Label ID="lblPageNumber" runat="server"></asp:Label>
                            <asp:LinkButton ID="lnkNext" runat="server" CommandArgument="Next" OnClick="PagerButtonClick">Next</asp:LinkButton>
                        </div>
                    </PagerTemplate>
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