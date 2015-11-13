<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/PaginaMaestra.Master"  CodeBehind="WebParametrizacionGrupos.aspx.cs" Inherits="ArchivoCostosWeb.WebParametrizacionGrupos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">

       
    </script>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

      
      <asp:Label ID="Label4" runat="server" Font-Names="Calibri" Font-Size="12pt" Text="Proyecto"></asp:Label>
          <br />
          <asp:DropDownList ID="Cmbproyectos" runat="server" AutoPostBack="True" DataSourceID="SqlProyectos" DataTextField="Proyecto" DataValueField="Codigo" Height="21px" Width="230px" OnSelectedIndexChanged="Cmbproyectos_SelectedIndexChanged"></asp:DropDownList>  
       
    <div>
    <div style="background-color:#b70000; padding-top:0px; width: 638px;">
          
           <asp:Label ID="Label3" runat="server" Font-Names="CALIBRI" Font-Size="12pt" ForeColor="#FFFFFF" Text="Items a Exluir o Incluir"></asp:Label>
    
         
        </div>
       <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Font-Names="Calibri" Font-Size="12pt" Width="638px" Height="16px" style="text-align: justify; margin-right: 2px;" EmptyDataText="No hay información guardada de este proyecto hasta el momento" OnRowCreated="GridView1_RowCreated">
          
            <Columns>
                <asp:TemplateField HeaderText="Seleccion" ShowHeader="False" HeaderStyle-ForeColor="#B70000" HeaderStyle-Font-Names="Calibri">
                   <ItemTemplate>
                       <asp:CheckBox ID="CheckSeleccionar" runat="server"  AutoPostBack="true" OnCheckedChanged="CheckSeleccionar_CheckedChanged" />
                   </ItemTemplate>

<HeaderStyle Font-Names="Calibri" ForeColor="#B70000"></HeaderStyle>
               </asp:TemplateField>
               <asp:BoundField DataField="insutipo" HeaderText="insutipo" SortExpression="insutipo" />
           </Columns>
       </asp:GridView>
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ArchivoCostosConnectionString %>" SelectCommand="SELECT DISTINCT(insutipo) from CostosPptoProg where SUBSTRING(referencia1,0,4)=@Proyecto">
            <SelectParameters>
                <asp:ControlParameter ControlID="Cmbproyectos" Name="Proyecto" PropertyName="SelectedValue" />
            </SelectParameters>
          </asp:SqlDataSource>
           <asp:SqlDataSource ID="SqlProyectos" runat="server" ConnectionString="<%$ ConnectionStrings:ArchivoCostosConnectionString %>" SelectCommand="SELECT * FROM [Proyectos]"></asp:SqlDataSource>

</asp:Content>
