<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebPopop.aspx.cs" Inherits="ArchivoCostosWeb.WebPopop" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>


    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>


    <script type="text/javascript">
       

            function ShowUnitarios() {
                $('#Capitulos').hide('slow');
              
                $('#Unitarios').show('slow');
              
            }

            function ShowInsumos() {
                $('#Capitulos').hide('slow');
                $('#Unitarios').hide('slow');

                $('#Insumos').show('slow');

            }

            function ShowAtrasCapitulos() {
                $('#Capitulos').show('slow');

                $('#Unitarios').hide('slow');

            }

            function ShowAtrasUnitarios() {

                $('#Capitulos').hide('slow');
                $('#Unitarios').show('slow');

                $('#Insumos').hide('slow');

            }
           
        </script>


    <style type="text/css">
body, html {margin:0; padding:0}
#contenedor {

  margin:auto;
  border-left:1px solid black;
  border-right:1px solid black;
  }
 p {
	margin-top: 0;
    font-family:'Segoe UI';
    font:15px;
   

  
}
      .AlgRgh
{
  text-align:right;

}
        </style>


    
    <script type="text/javascript">
        function SelectAll(id) {
            //get reference of GridView control
            var grid = document.getElementById("<%= GridCapitulos.ClientID %>");
            //variable to contain the cell of the grid
            var cell;

            if (grid.rows.length > 0) {
                //loop starts from 1. rows[0] points to the header.
                for (i = 1; i < grid.rows.length; i++) {
                    //get the reference of first column
                    cell = grid.rows[i].cells[0];

                    //loop according to the number of childNodes in the cell
                    for (j = 0; j < cell.childNodes.length; j++) {
                        //if childNode type is CheckBox                 
                        if (cell.childNodes[j].type == "checkbox") {
                            //assign the status of the Select All checkbox to the cell checkbox within the grid
                            cell.childNodes[j].checked = document.getElementById(id).checked;


                        }
                    }
                }
            }
        }
    </script>
    
    <script type="text/javascript">
        function SelectAllUnitarios(id)
            {
                //get reference of GridView control
                var grid = document.getElementById("<%= GridUnitarios.ClientID %>");
            //variable to contain the cell of the grid
             var cell;
            
            if (grid.rows.length > 0)
            {
                //loop starts from 1. rows[0] points to the header.
                for (i=1; i<grid.rows.length; i++)
                {
                    //get the reference of first column
                    cell = grid.rows[i].cells[0];
                    
                    //loop according to the number of childNodes in the cell
                    for (j=0; j<cell.childNodes.length; j++)
                    {           
                        //if childNode type is CheckBox                 
                        if (cell.childNodes[j].type =="checkbox")
                        {
                            //assign the status of the Select All checkbox to the cell checkbox within the grid
                            cell.childNodes[j].checked = document.getElementById(id).checked;
                            
                           
                        }
                    }
                }
            }
        }
    </script>		

    <script type="text/javascript">
        function SelectAllInsumos(id) {
            //get reference of GridView control
            var grid = document.getElementById("<%= GridInsumos.ClientID %>");
            //variable to contain the cell of the grid
            var cell;

            if (grid.rows.length > 0) {
                //loop starts from 1. rows[0] points to the header.
                for (i = 1; i < grid.rows.length; i++) {
                    //get the reference of first column
                    cell = grid.rows[i].cells[0];

                    //loop according to the number of childNodes in the cell
                    for (j = 0; j < cell.childNodes.length; j++) {
                        //if childNode type is CheckBox                 
                        if (cell.childNodes[j].type == "checkbox") {
                            //assign the status of the Select All checkbox to the cell checkbox within the grid
                            cell.childNodes[j].checked = document.getElementById(id).checked;


                        }
                    }
                }
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                        </asp:ToolkitScriptManager>
       <div style="background-color:#b70000; padding-top:0px;">
          
           <asp:Label ID="TxtPresupuesto" runat="server" Text="Label" ForeColor="White" Font-Names="Calibri" Font-Size="12pt"></asp:Label>
           
         
        </div>

        <div id="Capitulos" >
         <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" >
                <ContentTemplate>
           
       
             
                        
                        <asp:GridView ID="GridCapitulos" runat="server" AutoGenerateColumns="False" DataSourceID="SqlLista" OnRowDataBound="GridCapitulos_RowDataBound" Width="819px" style="text-align: justify">
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckCapitulos" runat="server" AutoPostBack="true" OnCheckedChanged="CheckCapitulos_CheckedChanged" />
                                    </ItemTemplate>

                                     <HeaderTemplate>
                                          <asp:CheckBox ID="cbSelectAllCapitulos" runat="server" AutoPostBack="true" Text="Todos" />
                                     </HeaderTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="codcapi" HeaderText="Codigo del Capitulo" SortExpression="codcapi" />
                                <asp:TemplateField HeaderText="Capitulo" SortExpression="capitulo">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("capitulo") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkCapitulo" runat="server" Font-Names="CALIBRI" Font-Size="12pt" ForeColor="#B70000" Text='<%# Bind("capitulo") %>' OnClick="LinkCapitulo_Click">LinkButton</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="refe" HeaderText="Referencia" ReadOnly="True" SortExpression="refe" />
                                <asp:BoundField DataField="vlrproy" DataFormatString="{0:C0}" HeaderText="Vlr Proyectado" SortExpression="vlrproy" >
                                <ItemStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                            </Columns>
                            <HeaderStyle Font-Names="Calibri" Font-Size="12pt" ForeColor="#B70000" />
                            <RowStyle Font-Names="Calibri" />
                        </asp:GridView>

     
        
                    </ContentTemplate>
             <Triggers>
                 <asp:AsyncPostBackTrigger ControlID="GridCapitulos" EventName="RowDataBound" />
             </Triggers>
                   
            </asp:UpdatePanel>
             </div>
            
        <div id="Unitarios" style="display:none">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional" >
                <ContentTemplate>
                <asp:ImageButton ID="BtnAtrasCapitulos" runat="server" OnClick="BtnAtrasCapitulos_Click" style="height: 16px" ImageUrl="~/images/BACK.GIF" />
                   
                                        <asp:GridView ID="GridUnitarios" runat="server" AutoGenerateColumns="False" DataSourceID="SqlUnitarios"  OnRowDataBound="GridUnitarios_RowDataBound" Width="819px">
                                            <Columns>
                                                <asp:TemplateField ShowHeader="False">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="CheckUnitarios" runat="server" AutoPostBack="true" OnCheckedChanged="CheckUnitarios_CheckedChanged" />
                                                    </ItemTemplate>
                                                    <HeaderTemplate>
                                                        <asp:CheckBox ID="cbSelectAllunitarios" runat="server" AutoPostBack="true" Text="Todos" />
                                                    </HeaderTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="codunit" HeaderText="Codigo del Unitario" SortExpression="codunit" />
                                                <asp:TemplateField HeaderText="Unitario" SortExpression="unitario">
                                                    
                                                   
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="LinkUnitario" runat="server" Font-Names="Calibri" ForeColor="#B70000" OnClick="LinkUnitario_Click" Text='<%# Bind("unitario") %>'></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="refe" HeaderText="Referencia" ReadOnly="True" SortExpression="refe" />
                                                <asp:BoundField DataField="capitulo" HeaderText="Capitulo" SortExpression="capitulo" />
                                                <asp:BoundField DataField="vlrproy" DataFormatString="{0:C0}" HeaderText="Vlr Proyectado" SortExpression="vlrproy" >
                                                <ItemStyle HorizontalAlign="Right" />
                                                </asp:BoundField>
                                            </Columns>
                                            <HeaderStyle Font-Names="Calibri" Font-Size="12pt" ForeColor="#B70000" />
                                            <RowStyle Font-Names="Calibri" Font-Size="12pt" />
                                        </asp:GridView>
                           
                      
               

                    
                </ContentTemplate>
                <Triggers>
                   <asp:AsyncPostBackTrigger ControlID="GridUnitarios" EventName="RowDataBound" />
              
                </Triggers>
            </asp:UpdatePanel>
           </div>

        <div id="Insumos" style="display:none">
                <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional" >
                <ContentTemplate>
              
                    <asp:ImageButton ID="BtnAtrasUnitarios" runat="server" ImageUrl="~/images/BACK.GIF" OnClick="BtnAtrasUnitarios_Click" style="height: 16px" />

                    <asp:Label ID="Label1" runat="server" Text="Ppto" Visible="false"></asp:Label>
                <asp:GridView ID="GridInsumos" runat="server" DataSourceID="SqlCargarInsumos" AutoGenerateColumns="False" Width="822px" Font-Names="Calibri" Font-Size="12pt" OnRowCreated="GridInsumos_RowCreated" OnRowDataBound="GridInsumos_RowDataBound">
                    <Columns>

                        <asp:TemplateField ShowHeader="False">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="CheckInsumos" runat="server" AutoPostBack="true" OnCheckedChanged="CheckInsumos_CheckedChanged" />
                                                    </ItemTemplate>
                                                    <HeaderTemplate>
                                                        <asp:CheckBox ID="cbSelectAllInsumos" runat="server" AutoPostBack="true" Text="Todos" />
                                                    </HeaderTemplate>
                                                </asp:TemplateField>
                        <asp:BoundField DataField="codinsu" HeaderText="Codigo del Insumo" SortExpression="codinsu" />
                        <asp:BoundField DataField="insumo" HeaderText="Insumo" SortExpression="insumo" />
                        <asp:BoundField DataField="refe" HeaderText="Referencia" ReadOnly="True" SortExpression="refe" />
                        <asp:BoundField DataField="capitulo" HeaderText="Capitulo" SortExpression="capitulo" />
                        <asp:BoundField DataField="vlrproy" DataFormatString="{0:C0}" HeaderText="Vlr Proyectado" SortExpression="vlrproy" ItemStyle-CssClass="text-align:right;" >
                        <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="insutipo" HeaderText="Tipo de Insumo" SortExpression="insutipo" />
                    </Columns>
                    <FooterStyle Font-Names="Calibri" Font-Size="12pt" />
                    <HeaderStyle ForeColor="#B70000" />
                </asp:GridView>
            
                          </ContentTemplate>
                <Triggers>
                      <asp:AsyncPostBackTrigger ControlID="GridInsumos" EventName="RowDataBound" />
                </Triggers>
                </asp:UpdatePanel>
        </div>
           
          <asp:SqlDataSource ID="SqlCargarInsumos" runat="server" ConnectionString="<%$ ConnectionStrings:ArchivoCostosConnectionString %>" SelectCommand="select distinct(codinsu),insumo,SUBSTRING(referencia1,0,7) as refe,capitulo ,SUM(vlrproy) as vlrproy,insutipo 
from [ArchivoCostos].[dbo].[CostosPptoProg] where SUBSTRING(referencia1,0,7)=@Presupuesto and IdFecha=(select max(IdFecha) 
from CostosPptoProg where SUBSTRING(referencia1,0,4)=@Proyecto) and codcapi=@CodCapi  and codunit=@Unitario
group by codcapi,capitulo,SUBSTRING(referencia1,0,7),codinsu,insumo,insutipo">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Label1" DefaultValue="" Name="Presupuesto" PropertyName="Text" />
                        <asp:SessionParameter Name="Proyecto" SessionField="Proyecto" DefaultValue="" />
                        <asp:SessionParameter Name="CodCapi" SessionField="Capitulo" />
                        <asp:SessionParameter DefaultValue="" Name="Unitario" SessionField="Unitario" />
                    </SelectParameters>
                </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlUnitarios" runat="server" ConnectionString="<%$ ConnectionStrings:ArchivoCostosConnectionString %>" SelectCommand="select distinct(codunit),unitario,SUBSTRING(referencia1,0,7) as refe,capitulo,sum(vlrproy) as vlrproy   from [ArchivoCostos].[dbo].[CostosPptoProg] where SUBSTRING(referencia1,0,7)=@Presupuesto and IdFecha=(select max(IdFecha) from CostosPptoProg where SUBSTRING(referencia1,0,4)=@Proyecto) and codcapi=@capitulo
  
group by codcapi,capitulo,SUBSTRING(referencia1,0,7),codunit,unitario
">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="" Name="Presupuesto" SessionField="Referencia" />
                <asp:SessionParameter DefaultValue="" Name="Proyecto" SessionField="Proyecto" />
                <asp:SessionParameter DefaultValue="" Name="capitulo" SessionField="Capitulo" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlLista" runat="server" ConnectionString="<%$ ConnectionStrings:ArchivoCostosConnectionString %>" SelectCommand="select distinct(codcapi),SUM(vlrproy) as vlrproy,capitulo,SUBSTRING(referencia1,0,7) as refe   from [ArchivoCostos].[dbo].[CostosPptoProg] where SUBSTRING(referencia1,0,7)=@Presupuesto and IdFecha=(select max(IdFecha) from CostosPptoProg where SUBSTRING(referencia1,0,4)=@proyecto)
group by codcapi,capitulo,SUBSTRING(referencia1,0,7)">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="" Name="Presupuesto" SessionField="Referencia" />
                <asp:SessionParameter DefaultValue="" Name="proyecto" SessionField="Proyecto" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
