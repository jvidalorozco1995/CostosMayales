<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="WebActualizar.aspx.cs" Inherits="ArchivoCostosWeb.WebActualizar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">

        //llama una nueva ventana para exportar el excel
        function llamarNuevaVentana() {

            var win = window.open("WebPrueba2.aspx", '1366002941508'/*, 'width=500,height=200,left=375,top=330'*/);

            setTimeout(function () { win.close(); }, 10000);
        }
       
        //mensaje de confirmacion para guardar los datos
       function Confirm() {
           var confirm_value = document.createElement("INPUT");
           confirm_value.type = "hidden";
           confirm_value.name = "confirm_value";
           if (confirm("Deseas Guardar los datos?")) {
               confirm_value.value = "Si";
           } else {
               confirm_value.value = "No";
           }
           document.forms[0].appendChild(confirm_value);
       }
   
     /* $('form').live("submit", function () {
           ShowProgress();
       });*/
    </script>
    <style>
        /**csss que muestra el progress*/
      #Progress
    {
        position: fixed;
        top: 39%; 
        left: 42%; 
        height:19%; 
        width:18%; 
        z-index: 100001;  
        background-color: #FFFFFF; 
        border:1px solid Gray; 
        background-image:url('images/loader.gif');
        background-repeat: no-repeat; 
        background-position:center;
    }
      /**css para ocultar*/
    #Background
    {
        position: fixed; 
        top: 0px; 
        bottom: 0px; 
        left: 0px; 
        right: 0px; 
        overflow: hidden; 
        padding: 0; 
        margin: 0; 
        background-color: #F0F0F0; 
        filter: alpha(opacity=80); 
        opacity: 0.8; 
    } 
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

      <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
         
       <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
          <Triggers>
             <asp:PostBackTrigger ControlID="GridView1" />
         </Triggers>
                        <ContentTemplate> 


    <asp:Label ID="Label3" runat="server" Font-Names="Calibri" Font-Size="18pt" ForeColor="#B70000" Text="Actualizar y Generar Costos"></asp:Label>
    <br />
 <asp:DropDownList ID="CmbProyectos" runat="server" DataSourceID="SqlCargarComboxProyecto" DataTextField="Proyecto" DataValueField="Codigo" Height="21px" Width="246px" AutoPostBack="True" OnSelectedIndexChanged="CmbProyectos_SelectedIndexChanged">
        </asp:DropDownList>
        <br />
        <asp:LinkButton ID="BtnEjecutar" runat="server" Font-Names="Calibri" Font-Size="12pt" ForeColor="#B70000" OnClick="BtnEjecutar_Click">Actualizar y Generar</asp:LinkButton>
    <br />
    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/filter.gif" OnClick="ImageButton1_Click" Width="16px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label2" runat="server" ForeColor="#B70000" Text="Mensaje" Visible="False"></asp:Label>
   
      <div style="background-color:#b70000; padding-top:0px; width: 518px;">
          
           <asp:Label ID="Label1" runat="server" Font-Names="CALIBRI" Font-Size="12pt" ForeColor="White" Text="Fechas De Todos Los Proyectos"></asp:Label>
     </div>
                            <asp:Label ID="lblerror" runat="server" Text="Label" Visible="false" ForeColor="Red" Font-Bold="true"></asp:Label>
   <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlCargarGridview" Height="16px" style="text-align: justify" Width="518px" EmptyDataText="No hay fechas guardadas de este proyecto" AllowPaging="True">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" Visible="False" />
            <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" />
            <asp:BoundField DataField="Proyecto" HeaderText="Proyecto" SortExpression="Proyecto" />
            <asp:BoundField DataField="Tipo" HeaderText="Tipo" SortExpression="Tipo" Visible="False" />
             <asp:TemplateField>
                    <ItemTemplate>
                        <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/Excel.png" OnCommand="BtnExportExcel_Command" CommandArgument='<%# Eval("Id") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
        </Columns>
        <HeaderStyle Font-Names="Calibri" Font-Size="12pt" ForeColor="#B70000" />
        <RowStyle Font-Names="CaLIBRI" Font-Size="12pt" />
    </asp:GridView>
    <asp:RadioButtonList ID="RadioButtonList1" runat="server" Visible="False">
        <asp:ListItem Value="0"></asp:ListItem>
        <asp:ListItem>1</asp:ListItem>
    </asp:RadioButtonList>
                       </ContentTemplate>
                     </asp:UpdatePanel>     


       <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate>
       <div id="Background">



            </div>
        <div id="Progress">
                <h7> <p style="text-align:center"> <b>Procesando Datos, Espere Por Favor... </b> </p> </h7>
            </div>
            
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:SqlDataSource ID="SqlCargarGridview" runat="server" ConnectionString="<%$ ConnectionStrings:ArchivoCostosConnectionString %>" SelectCommand="IF(@OPCION=1)
   BEGIN
     select * from fechas where Proyecto=@Proyecto order by Fecha desc
	END
    ELSE
	  select * from fechas order by Fecha desc">
        <SelectParameters>
            <asp:ControlParameter ControlID="RadioButtonList1" DefaultValue="0" Name="OPCION" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="CmbProyectos" DefaultValue="ARG" Name="Proyecto" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlCargarComboxProyecto" runat="server" ConnectionString="<%$ ConnectionStrings:ArchivoCostosConnectionString %>" SelectCommand="SELECT * FROM [Proyectos]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlCargar" runat="server" ConnectionString="<%$ ConnectionStrings:ArchivoCostosConnectionString %>" SelectCommand="SELECT [referencia1]
      ,[referencia2]
      ,[referencia3]
      ,[presupuesto]
      ,[codcapi]
      ,[capitulo]
      ,[codunit]
      ,[unitario]
      ,[undunita]
      ,[cantxppto]
      ,[codinsu]
      ,[insutipo]
      ,[insumo]
      ,[unidinsu]
      ,[ctrlinven]
      ,[validación]
      ,[precioppto]
      ,[consumounitario]
      ,[consumototal]
      ,[adic]
      ,[precioaut]
      ,[preciocompra]
      ,[precioentrado]
      ,[ped]
      ,[aprob]
      ,[comp]
      ,[ent]
      ,[sali]
      ,[traslado]
      ,[xcomp]
      ,[xent]
      ,[saldoxunit]
      ,[saldoxppto]
      ,[vlrent]
      ,[vlrenttraslado]
      ,[vlrcompradoxent]
      ,[vlrxcomp]
      ,[vlrtraslado]
      ,[vlrproy]
      ,[vlrproyejec]
      ,[vlrini]
      ,[vlrejec] FROM [CostosPptoProg] WHERE ([IdFecha] = @IdFecha)">
            <SelectParameters>
                <asp:SessionParameter Name="IdFecha" SessionField="FechaProyec" />
            </SelectParameters>
    </asp:SqlDataSource>
<br />
<br />
        <br />
     


</asp:Content>
