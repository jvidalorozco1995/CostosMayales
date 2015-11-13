<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebDetalleInforme.aspx.cs" Inherits="ArchivoCostosWeb.WebDetalleInforme" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>

    <style type="text/css">


        #Content {
        
         width: 100%;
    height: 700px;
    overflow: scroll;

        }

        #col_der {
            float: left;
            width: 34%;
            margin-right: 0px;
           
        }
#col_izq {float: left; width: 34%;  }
#col_izq2 {float: left; width: 32%;  }
</style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="Content">
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <asp:Label ID="Label5" runat="server" Font-Names="Calibri" Font-Size="XX-Large" ForeColor="#B70000" style="align-content:center;" Text="Analisis de Incidencia"></asp:Label>
            <br />
            <br />
            <br />
         <asp:Label ID="Label1" runat="server" Font-Names="Calibri" Font-Size="Medium" ForeColor="#B70000" style="text-align: center; align-content:center;" Text="Seleccione un Presupuesto"></asp:Label>
         <br />
         <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlCargarPresupuestos" DataTextField="presupuesto" DataValueField="referencia" Height="18px" Width="252px">
        </asp:DropDownList>
         <asp:Button ID="BrnExportar" runat="server" OnClick="BrnExportar_Click" Text="Exportar a Excel" Width="145px" />
            <br />
            <br />
         <br />
    <div>

            
        <div id="col_der">
            <asp:Label ID="Label2" runat="server" Text="Capitulos" Font-Names="calibri" Font-Size="15pt" ForeColor="#b70000"></asp:Label>
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Height="16px" OnRowDataBound="GridView1_RowDataBound" ShowFooter="True">
            <Columns>
                   <asp:TemplateField HeaderText="Capitulo" SortExpression="Capitulo">
                     <EditItemTemplate>
                         <asp:Label ID="Label1" runat="server" Text='<%# Eval("Capitulo") %>'></asp:Label>
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="Label1" runat="server" Text='<%# Bind("Capitulo") %>'></asp:Label>
                     </ItemTemplate>
                     <HeaderStyle Font-Names="Calibri" Font-Size="12pt" ForeColor="#B70000" />
               
                    <FooterTemplate>
				        <div style="text-align: left;">
				        <asp:Label text="Total" ID="TotalCapitulo" runat="server" />
				        </div>
			         </FooterTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Vlr inicial" SortExpression="vlrinicial" ItemStyle-HorizontalAlign="Right">
                     <EditItemTemplate>
                         <asp:Label ID="vlrinicialcapitulo" runat="server" Text='<%# Eval("vlrinicial") %>'></asp:Label>
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="vlrinicialcapitulo" runat="server" Text='<%# Bind("vlrinicial","{0:C0}") %>'></asp:Label>
                     </ItemTemplate>

                     <FooterTemplate>
				        <div style="text-align: right;">
				        <asp:Label ID="lbltotalinicialcapitulo"  runat="server" />
				        </div>
			         </FooterTemplate>
                     <HeaderStyle Font-Names="Calibri" Font-Size="12pt" ForeColor="#B70000" />
                 </asp:TemplateField>
                   <asp:TemplateField HeaderText="Vlr Proy" HeaderStyle-Font-Names="calibri" HeaderStyle-Font-Size="12pt" ItemStyle-HorizontalAlign="Right" SortExpression="vlrproy">
			         
                   <EditItemTemplate>
                         <asp:Label ID="vlrproy" runat="server" Text='<%# Bind("vlrproy") %>'></asp:Label>
                     </EditItemTemplate>
                   <ItemTemplate >
				        <asp:Label ID="vlrproy" runat="server" Text='<%# Bind("vlrproy","{0:C0}") %>'></asp:Label>
			         </ItemTemplate>
                     <FooterTemplate>
				        <div style="text-align: right;">
				        <asp:Label ID="lbltotalvlrproyectado" runat="server" />
				        </div>
			         </FooterTemplate>
                     <HeaderStyle ForeColor="#B70000" Font-Names="Calibri" Font-Size="12pt" />
                    
		      </asp:TemplateField>
                 
           
                 <asp:TemplateField HeaderText="Incidencia" SortExpression="SumaIncidencia" ItemStyle-HorizontalAlign="Right">
                     <EditItemTemplate>
                         <asp:TextBox ID="lblsumaincidencia" runat="server" Text='<%# Bind("SumaIncidencia") %>'></asp:TextBox>
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="lblsumaincidencia" runat="server" Text='<%# Bind("SumaIncidencia","{0:P1}") %>'></asp:Label>
                     </ItemTemplate>

                     <FooterTemplate>
				        <div style="text-align: right;">
				        <asp:Label ID="lbltotalSumaIncidencia" runat="server" />
				        </div>
			         </FooterTemplate>
                     <HeaderStyle ForeColor="#B70000" Font-Names="Calibri" Font-Size="12pt" />
                 </asp:TemplateField>
                 
           
            </Columns>
            <FooterStyle BackColor="#B70000" Font-Names="Calibri" ForeColor="White" />
            <RowStyle HorizontalAlign="Left" />
        </asp:GridView>


        </div>
        <div id="col_izq">
             <asp:Label ID="Label3" runat="server" Text="Unitarios" Font-Names="calibri" Font-Size="15pt" ForeColor="#B70000"></asp:Label>
              <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlCargarUnitarios" Height="16px" Width="405px" ShowFooter="True" OnRowDataBound="GridView2_RowDataBound">
            <Columns>
               
                 <asp:TemplateField HeaderText="Unitario" SortExpression="unitario">
                     <EditItemTemplate>
                         <asp:Label ID="Label1" runat="server" Text='<%# Eval("unitario") %>'></asp:Label>
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="Label1" runat="server" Text='<%# Bind("unitario") %>'></asp:Label>
                     </ItemTemplate>
                     <HeaderStyle Font-Names="Calibri" Font-Size="12pt" ForeColor="#B70000" />
                      <FooterTemplate>
				        <div style="text-align: left;">
				          <asp:Label ID="Label4" Text="Total" runat="server" />
				        </div>
			         </FooterTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Vlr Inicial" SortExpression="vlrinicial" ItemStyle-HorizontalAlign="Right">
                     <EditItemTemplate>
                         <asp:Label ID="vlrinicialunitarios" runat="server" Text='<%# Eval("vlrinicial") %>'></asp:Label>
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="vlrinicialunitarios" runat="server" Text='<%# Bind("vlrinicial","{0:C0}") %>'></asp:Label>
                     </ItemTemplate>
                      <FooterTemplate>
				        <div style="text-align: right;">
				        <asp:Label ID="lbltotalinicialunitarios" runat="server" />
				        </div>
			         </FooterTemplate>
                     <HeaderStyle Font-Names="Calibri" Font-Size="12pt" ForeColor="#B70000" />
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Vlr Proy" SortExpression="vlrproy" ItemStyle-HorizontalAlign="Right">
                     <EditItemTemplate>
                         <asp:Label ID="vlrproyunitarios" runat="server" Text='<%# Eval("vlrproy") %>'></asp:Label>
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="vlrproyunitarios" runat="server" Text='<%# Bind("vlrproy","{0:C0}") %>'></asp:Label>
                     </ItemTemplate>
                      <FooterTemplate>
				        <div style="text-align: right;">
				        <asp:Label ID="lbltotalvlrproyectadounitarios" runat="server" />
				        </div>
			         </FooterTemplate>
                     <HeaderStyle Font-Names="Calibri" Font-Size="12pt" ForeColor="#B70000" />
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Incidencia" SortExpression="SumaIncidencia"  ItemStyle-HorizontalAlign="Right">
                     <EditItemTemplate>
                         <asp:Label ID="lblsumaincidenciaunitarios" runat="server" Text='<%# Bind("SumaIncidencia") %>'></asp:Label>
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="lblsumaincidenciaunitarios" runat="server" Text='<%# Bind("SumaIncidencia","{0:P1}") %>'></asp:Label>
                     </ItemTemplate>
                     <FooterTemplate>
				        <div style="text-align: right;">
				           <asp:Label ID="lbltotalSumaIncidenciaunitarios" runat="server" />
				        </div>
			         </FooterTemplate>
                     <HeaderStyle ForeColor="#B70000" Font-Names="Calibri" Font-Size="12pt" />
                 </asp:TemplateField>
              
            </Columns>
                 <FooterStyle BackColor="#B70000" Font-Names="Calibri" ForeColor="White" />
        </asp:GridView>
        </div>
        <div id="col_izq2">
             <asp:Label ID="Label4" runat="server" Text="Insumos" Font-Names="calibri" Font-Size="15pt" ForeColor="#B70000"></asp:Label>
            &nbsp;<asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlInsumos" Height="16px" Width="290px" ShowFooter="True" OnRowDataBound="GridView3_RowDataBound">
            <Columns>
                
                 <asp:TemplateField HeaderText="Insumo" SortExpression="insumo">
                     <EditItemTemplate>
                         <asp:Label ID="Label1" runat="server" Text='<%# Eval("insumo") %>'></asp:Label>
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="Label1" runat="server" Text='<%# Bind("insumo") %>'></asp:Label>
                     </ItemTemplate>
                     <FooterTemplate>
				        <div style="text-align: left;">
				        <asp:Label text="Total" ID="Totalinsumo" runat="server" />
				        </div>
			         </FooterTemplate>
                     <HeaderStyle Font-Names="Calibri" Font-Size="12pt" ForeColor="#B70000" />
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Vlr Inicial" SortExpression="vlrinicial" ItemStyle-HorizontalAlign="Right">
                     <EditItemTemplate>
                         <asp:Label ID="vlrinicialinsumos" runat="server" Text='<%# Eval("vlrinicial") %>'></asp:Label>
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="vlrinicialinsumos" runat="server" Text='<%# Bind("vlrinicial","{0:C0}") %>'></asp:Label>
                     </ItemTemplate>
                      <FooterTemplate>
				        <div style="text-align: right;">
				        <asp:Label ID="lbltotalinicialinsumos" runat="server" />
				        </div>
			         </FooterTemplate>
                     <HeaderStyle Font-Names="Calibri" Font-Size="12pt" ForeColor="#B70000" />
                     <ItemStyle HorizontalAlign="Right" />
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Vlr Proy" SortExpression="vlrproy" ItemStyle-HorizontalAlign="Right">
                     <EditItemTemplate>
                         <asp:Label ID="vlrproyinsumos" runat="server" Text='<%# Eval("vlrproy") %>'></asp:Label>
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="vlrproyinsumos" runat="server" Text='<%# Bind("vlrproy","{0:C0}") %>'></asp:Label>
                     </ItemTemplate>
                     <FooterTemplate>
				        <div style="text-align: right;">
				        <asp:Label ID="lbltotalvlrproyectadoinsumos" runat="server" />
				        </div>
			         </FooterTemplate>
                     <HeaderStyle Font-Names="Calibri" Font-Size="12pt" ForeColor="#B70000" />

<ItemStyle HorizontalAlign="Right"></ItemStyle>
                 </asp:TemplateField>
                <asp:TemplateField HeaderText="Incidencia" SortExpression="SumaIncidencia" >
                     <EditItemTemplate>
                         <asp:Label ID="lblsumaincidenciainsumos" runat="server" Text='<%# Bind("SumaIncidencia") %>'></asp:Label>
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="lblsumaincidenciainsumos" runat="server" Text='<%# Bind("SumaIncidencia","{0:P1}") %>'></asp:Label>
                     </ItemTemplate>
                      <FooterTemplate>
				        <div style="text-align: right;">
				        <asp:Label ID="lbltotalSumaIncidenciainsumos" runat="server" />
				        </div>
			         </FooterTemplate>
                     <HeaderStyle Font-Names="Calibri" Font-Size="12pt" ForeColor="#B70000" />
                 </asp:TemplateField>
            </Columns>
                 <FooterStyle BackColor="#B70000" Font-Names="Calibri" ForeColor="White" />
        </asp:GridView>


        </div>

        <br />
        <asp:SqlDataSource ID="SqlCargarUnitarios" runat="server" ConnectionString="<%$ ConnectionStrings:ArchivoCostosConnectionString %>" SelectCommand="AgrupacionTodoslosUnitarios" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="Presupuesto" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ArchivoCostosConnectionString %>" SelectCommand="AgrupacionTodoslosCapitulos" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" DefaultValue="" Name="Presupuesto" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
        <asp:SqlDataSource ID="SqlCargarPresupuestos" runat="server" ConnectionString="<%$ ConnectionStrings:ArchivoCostosConnectionString %>" SelectCommand="SELECT SUBSTRING(referencia1,0,7) AS referencia,presupuesto FROM CostosPptoProgSemanaActual
group by SUBSTRING(referencia1,0,7),presupuesto"></asp:SqlDataSource>





    
      
      
       
        <asp:SqlDataSource ID="SqlInsumos" runat="server" ConnectionString="<%$ ConnectionStrings:ArchivoCostosConnectionString %>" SelectCommand="AgrupacionTodoslosInsumos" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="Presupuesto" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
            </div>
    </form>
</body>
</html>
