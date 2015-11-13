<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebPrueba.aspx.cs" Inherits="ArchivoCostosWeb.WebPrueba" %>

<!DOCTYPE html>

<html>
<head>
    <title>Export to Excel in Asp.Net</title>
</head>

<body>
    <form id="form1" runat="server">
        <div>
        
           
            <div id="parametros">
           <asp:Label ID="Label6" runat="server" Font-Names="CALIBRI" Font-Size="14pt" ForeColor="#B70000" Text="Informe"></asp:Label>
           <br />
           <br />
           <asp:Label ID="Label5" runat="server" Font-Names="CALIBRI" Font-Size="12pt" ForeColor="#B70000" Text="Proyecto"></asp:Label>
           <br />

           <asp:DropDownList ID="Cmbproyectos" runat="server" AutoPostBack="True" DataSourceID="SqlProyectos" DataTextField="Proyecto" DataValueField="Codigo" Height="19px" Width="230px"></asp:DropDownList>  
           <br />
           <asp:Label ID="Label2" runat="server" Font-Names="CALIBRI" Font-Size="12pt" ForeColor="#B70000" Text="Semana Actual"></asp:Label>
           <br />
           <asp:DropDownList ID="CmbSemanaActual" runat="server" AutoPostBack="True" DataSourceID="SqlFechasCombox" DataTextField="Fecha" DataValueField="Id" Height="19px" Width="230px">
           </asp:DropDownList>
           <br />
           <asp:Label ID="Label3" runat="server" Font-Names="CALIBRI" Font-Size="12pt" ForeColor="#B70000" Text="Semana Pasada"></asp:Label>
           <br />
           <asp:DropDownList ID="CmbSemanaPasada" runat="server" DataSourceID="SqlFechasCombox" DataTextField="Fecha" DataValueField="Id" Height="19px" Width="230px" AutoPostBack="True">
           </asp:DropDownList>
           <br />
           <asp:Label ID="Label4" runat="server" Font-Names="CALIBRI" Font-Size="12pt" ForeColor="#B70000" Text="Linea Base"></asp:Label>
           <br />
           <asp:DropDownList ID="CmbLineaBase" runat="server" Height="19px" Width="230px" AutoPostBack="True" DataSourceID="SqlLineaBase" DataTextField="Fecha" DataValueField="Id" Enabled="False">
           </asp:DropDownList>
                <asp:Button ID="Button2" runat="server" Text="Button" OnClick="ExportToExcel" />
      </div>

            <p>
                 <asp:SqlDataSource ID="SqlProyectos" runat="server" ConnectionString="<%$ ConnectionStrings:ArchivoCostosConnectionString %>" SelectCommand="SELECT * FROM [Proyectos]"></asp:SqlDataSource>
       <asp:SqlDataSource ID="SqlLineaBase" runat="server" ConnectionString="<%$ ConnectionStrings:ArchivoCostosConnectionString %>" SelectCommand="SELECT * FROM [Fechas] WHERE (([Tipo] = @Tipo) AND ([Proyecto] = @Proyecto))">
           <SelectParameters>
               <asp:Parameter DefaultValue="True" Name="Tipo" Type="String" />
               <asp:ControlParameter ControlID="Cmbproyectos" Name="Proyecto" PropertyName="SelectedValue" Type="String" />
           </SelectParameters>
       </asp:SqlDataSource>
       <asp:SqlDataSource ID="SqlFechasCombox" runat="server" ConnectionString="<%$ ConnectionStrings:ArchivoCostosConnectionString %>" SelectCommand="SELECT * FROM [Fechas] WHERE (([Proyecto] = @Proyecto) AND ([Tipo]=@Tipo))">
           <SelectParameters>
               <asp:ControlParameter ControlID="Cmbproyectos" Name="Proyecto" PropertyName="SelectedValue" Type="String" />
               <asp:Parameter DefaultValue="False" Name="Tipo" Type="String" />
           </SelectParameters>
       </asp:SqlDataSource>
            </p>
            
        </div>
    </form>
</body>
</html>