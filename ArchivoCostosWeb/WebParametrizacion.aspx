<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="WebParametrizacion.aspx.cs" Inherits="ArchivoCostosWeb.WebParametrizacion" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="js/jquery-1.2.6.min.js"></script>
    <style type="text/css">
        .Background
        {
            background-color: Black;
            filter: alpha(opacity=75);
            opacity: 0.20;
        }
        .Popup
        {
           background-color: #FFFFFF;
            border-width: 3px;
            border-style: none;
            border-color: black;
            padding-top: 10px;
            padding-left: 10px;
            width: 910px;
            height: 500px;
        }
        .lbl
        {
            font-size:16px;
            font-style:italic;
            font-weight:bold;
        }
    </style>

    <script>
     function Confirm() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("Estas seguro, perderas esta información?")) {
                confirm_value.value = "Yes";
            } else {
                confirm_value.value = "No";
            }
            document.forms[0].appendChild(confirm_value);
     }

     function CloseA() {
       
         $('#irm1').remove();
      

     }

   
        </script>

   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div style="width:1239px; height:103%">
        <asp:Label ID="Label2" runat="server" Font-Names="Calibri" Font-Size="18pt" ForeColor="#B70000" Text="Parametros del informe" style="font-size: 16pt"></asp:Label>
        <br />
       <asp:Label ID="Label1" runat="server" Font-Names="CALIBRI" Font-Size="12pt" ForeColor="#B70000" Text="Proyectos"></asp:Label>
       <br />

       <asp:DropDownList ID="Cmbproyectos" runat="server" AutoPostBack="True" DataSourceID="SqlProyectos" DataTextField="Proyecto" DataValueField="Codigo" Height="21px" Width="230px" OnSelectedIndexChanged="Cmbproyectos_SelectedIndexChanged"></asp:DropDownList>  
       <br />
        <br />
         <div style="background-color:#b70000; padding-top:0px; width: 1106px;">
          
           <asp:Label ID="Label3" runat="server" Font-Names="CALIBRI" Font-Size="12pt" ForeColor="#FFFFFF" Text="Items a Exluir o Incluir"></asp:Label>
    
         
        </div>
       <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Presupuesto" DataSourceID="SqlDataSource2" Font-Names="Calibri" Font-Size="12pt" Width="1106px" Height="16px" style="text-align: justify" OnDataBinding="GridView1_DataBinding" OnRowCreated="GridView1_RowCreated" OnRowDataBound="GridView1_RowDataBound" EmptyDataText="No hay información guardada de este proyecto hasta el momento">
           <Columns>
               <asp:TemplateField HeaderText="Seleccion" ShowHeader="False" HeaderStyle-ForeColor="#B70000" HeaderStyle-Font-Names="Calibri">
                   <ItemTemplate>
                       <asp:CheckBox ID="CheckSeleccionar" runat="server"  AutoPostBack="true" OnClientClick = "Confirm();" OnCheckedChanged="CheckSeleccionar_CheckedChanged" />
                   </ItemTemplate>

<HeaderStyle Font-Names="Calibri" ForeColor="#B70000"></HeaderStyle>
               </asp:TemplateField>
               <asp:BoundField DataField="Proyecto" HeaderText="Proyecto" SortExpression="Proyecto" HeaderStyle-ForeColor="#B70000" HeaderStyle-Font-Names="Calibri" >
<HeaderStyle Font-Names="Calibri" ForeColor="#B70000"></HeaderStyle>
               </asp:BoundField>
               <asp:TemplateField HeaderText="Presupuesto" SortExpression="presupuesto" HeaderStyle-ForeColor="#B70000" HeaderStyle-Font-Names="Calibri">
                   <EditItemTemplate>
                       <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("presupuesto") %>'></asp:TextBox>
                   </EditItemTemplate>
                   <ItemTemplate >
                       <asp:LinkButton ID="LinkButton5" runat="server" ForeColor="#B70000" Text='<%# Bind("presupuesto") %>' OnClick="LinkButton5_Click">LinkPresupuesto</asp:LinkButton>
                   </ItemTemplate>

<HeaderStyle Font-Names="Calibri" ForeColor="#B70000"></HeaderStyle>
               </asp:TemplateField>
               <asp:BoundField DataField="referencia" HeaderText="Referencia" SortExpression="referencia" HeaderStyle-ForeColor="#B70000" HeaderStyle-Font-Names="Calibri" >
<HeaderStyle Font-Names="Calibri" ForeColor="#B70000"></HeaderStyle>
               </asp:BoundField>
               <asp:BoundField DataField="Nviviendas" HeaderText="Nviviendas" SortExpression="Nviviendas" HeaderStyle-ForeColor="#B70000" HeaderStyle-Font-Names="Calibri" >
<HeaderStyle Font-Names="Calibri" ForeColor="#B70000"></HeaderStyle>
               </asp:BoundField>
               <asp:BoundField DataField="vlrproy" HeaderText="Vlr Proyectado" SortExpression="vlrproy" HeaderStyle-ForeColor="#B70000" HeaderStyle-Font-Names="Calibri" DataFormatString="{0:C0}" >
<HeaderStyle Font-Names="Calibri" ForeColor="#B70000"></HeaderStyle>
               <ItemStyle HorizontalAlign="Right" />
               </asp:BoundField>
               <asp:BoundField DataField="Area" HeaderText="Area" SortExpression="Area"  HeaderStyle-ForeColor="#B70000" HeaderStyle-Font-Names="Calibri">
<HeaderStyle Font-Names="Calibri" ForeColor="#B70000"></HeaderStyle>
               </asp:BoundField>
               <asp:TemplateField HeaderText="Clasificación" HeaderStyle-ForeColor="#B70000" HeaderStyle-Font-Names="Calibri">
                   <ItemTemplate>
                       <asp:DropDownList ID="CmbClasificacion" runat="server" DataSourceID="SqlClasificacion" DataTextField="Tipo" DataValueField="Id" Height="22px" Width="244px" AutoPostBack="True" OnSelectedIndexChanged="CmbClasificacion_SelectedIndexChanged">
                        
                       </asp:DropDownList>
                       <asp:SqlDataSource ID="SqlClasificacion" runat="server" ConnectionString="<%$ ConnectionStrings:ArchivoCostosConnectionString %>" SelectCommand="SELECT * FROM [Tipos]"></asp:SqlDataSource>
                   </ItemTemplate>

<HeaderStyle Font-Names="Calibri" ForeColor="#B70000"></HeaderStyle>
               </asp:TemplateField>
           </Columns>
       </asp:GridView>
        <asp:LinkButton ID="LinkLineasBase" Font-Names="calibri" Font-Size="12pt" ForeColor="#b70000" runat="server" OnClick="LinkLineasBase_Click">Configuración de Lineas Base</asp:LinkButton>
        &nbsp;
        <asp:LinkButton ID="LinkGrupos" Font-Names="calibri" Font-Size="12pt" ForeColor="#b70000" runat="server" OnClick="LinkGrupos_Click">Parametrización por Grupos</asp:LinkButton>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        <cc1:modalpopupextender id="mp1" runat="server" backgroundcssclass="Background"  popupcontrolid="Panl1" targetcontrolid="Button3" BehaviorID="mp1"  >
            
        </cc1:modalpopupextender>
        
        <asp:Panel ID="Panl1" runat="server" align="center" CssClass="Popup" style="display:none">
                <div style="float:right;">
                   <asp:LinkButton ID="LinkButton1" style="padding:0px; text-align:right;margin-left:0px;" ForeColor="#B70000"  runat="server" OnClick="Button2_Click">Cerrar</asp:LinkButton>
                </div>
            <br/>
            <iframe id="irm1" runat="server" src="WebPopop.aspx" style=" margin-top: 0; width: 850px; height: 450px;"></iframe>
   
            
        </asp:Panel>
        <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </cc1:ToolkitScriptManager>
       <br />
        <div style="display:none">
        <asp:Button ID="Button3" runat="server" Text="Button" />

</div>
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
       <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ArchivoCostosConnectionString %>" DeleteCommand="DELETE FROM Areas WHERE Apartamentos=@presupuesto" SelectCommand="Parametri" SelectCommandType="StoredProcedure">
           <DeleteParameters>
               <asp:Parameter Name="presupuesto" />
           </DeleteParameters>
           <SelectParameters>
               <asp:ControlParameter ControlID="Cmbproyectos" DefaultValue="ARG" Name="proyecto" PropertyName="SelectedValue" />
           </SelectParameters>
       </asp:SqlDataSource>
       <asp:SqlDataSource ID="SqlProyectos" runat="server" ConnectionString="<%$ ConnectionStrings:ArchivoCostosConnectionString %>" SelectCommand="SELECT * FROM [Proyectos] ORDER BY [Proyecto]"></asp:SqlDataSource>
   </div>
</asp:Content>
