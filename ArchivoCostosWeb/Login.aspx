<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebCostosPresupuestos.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style3 {
            text-align: center;
        }
        .auto-style5 {
            text-align: center;
            width: 492px;
        }
    </style>
    <script>
        function texboxchange() {
            //guarda el usuario
        var txtBox = document.getElementById('<%= TxtUsuario.ClientID %>');
        var count = txtBox.value.length;
        if (count == 2) 
        {
            //guarda la contraseña
           document.getElementById('<%= txtpass.ClientID %>').focus();
           return true; // this will call textbox changed event.
        }
    }
        </script>
    <style type="text/css">
        .ToUpper
        {
            /*para transformar la letra*/
         text-transform: uppercase;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <br />
        <br />
        <br />
        <br />
        <br />
        <table border="0" class="auto-style1">
            <tr>
                <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                <td class="auto-style5" colspan="0">
                    <asp:Panel ID="Panel1" runat="server" BorderStyle="Outset" Height="280px" Width="478px">
                        <div style="background-color: #b70000; text-align: left;">
                            <asp:Label ID="Label4" runat="server" Font-Names="Calibri" Font-Size="14pt" ForeColor="White" style="text-align: left" Text="Inicio de Sección"></asp:Label>
                        </div>
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;<asp:Image ID="Image1" runat="server" Height="58px" ImageUrl="~/Images/logo.jpg" Width="115px" />
                        <br />
                        &nbsp;&nbsp;
                        <asp:Label ID="Label2" runat="server" Font-Names="cALIBRI" ForeColor="#B70000" Text="Usuario"></asp:Label>
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="TxtUsuario"  CssClass="ToUpper" runat="server" Height="22px" Width="175px" MaxLength="7" ></asp:TextBox>
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label3" runat="server" Font-Names="Calibri" ForeColor="#B70000" Text="Contraseña"></asp:Label>
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtpass" runat="server" Height="22px" TextMode="Password" Width="175px" MaxLength="5"></asp:TextBox>
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnlogin" runat="server" Height="35px" Text="Ingresar" Width="125px" OnClick="btnlogin_Click" />
                        <br />
                        <asp:Label ID="Label1" runat="server" style="color: #FF0000; font-weight: 700"></asp:Label>
                        <br />
                    </asp:Panel>
                    <br />
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
            </tr>
        </table>
     </div>
    </form>
</body>
</html>
