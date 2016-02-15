<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Error404.aspx.cs" Inherits="ArchivoCostosWeb.Error404" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
         
#caja {
 width: 60%;
 margin: 0 auto;
 border:1px solid #B70000;
}         

#caja2 {
 width: 60%;
 margin: 0 auto;
 border:1px solid #808080;
}    
    </style>
    <script src="js/jquery-1.2.6.min.js"></script>
    <script type="text/ecmascript">
        $(document).ready(function () {
            setTimeout(function () {
                javascript: history.back(1);//will redirect to your blog page (an ex: blog.html)
            }, 6000);
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
         <div id="caja" style="background:#B70000">
            <asp:Label ID="Label1" runat="server" Font-Bold="true" Text="Pagina no encontrada Error 404"  Font-Names="Calibri" Font-Size="13pt" ForeColor="#FFFFFFF" ></asp:Label>
        </div>
         <div id="caja2" style="background-color: #EFF5A3">
             <p style="font-family:Calibri">
                <strong>¡Lo sentimos!</strong> la pagina que buscas no se ha encontrado en este servidor. puede deberse a que la direccion se ha escrito mal o que la pagina ha sido cancelada. revisa e intenta nuevamente que la direccion <strong>URL</strong> este escrita correctamente
             </p>
        </div>
    </form>
</body>
</html>

