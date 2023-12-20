<%@ Page Language="C#" Inherits="TicketGenerator.Views.Ticket1" %>
<!DOCTYPE html>
<html>
<head runat="server">
	<title>Ticket1</title>
</head>
<body>
	<div class="desktop">
<div class="div">
<div class="overlap-group"><div class="rectangle"></div></div>
<div class="box0"><div class="rectangle-2"></div></div>
<div class="box1"><div class="rectangle1"></div></div>
<div class="box2"><div class="rectangle2"></div></div>
</div>
</div>
        
        <Style>

            
            
.desktop {
    background-color: #ffffff;
    display: flex;
    flex-direction: row;
    justify-content: center;
    width: 100%;
}

.desktop .div {
    background-color: #ffffff;
    width: 1440px;
    height: 1024px;
    position: relative;
}

.desktop .overlap-group {
    position: absolute;
    width: 922px;
    height: 235px;
    top: 82px;
    left: 93px;
    background-color: #d9d9d9;
}

.desktop .rectangle {
    position: relative;
    width: 100px;
    height: 100px;
    top: 67px;
    left: 783px;
    background-color: #fdbdbd;
}

.desktop .rectangle-2 {
    position: absolute;
    width: 485px;
    height: 543px;
    top: 420px;
    left: 110px;
    background-color: #d9d9d9;
}

.box {
width: 485px;
height: 543px;
}
.box .rectangle {
position: fixed;
width: 485px;
height: 543px;
top: 0;
left: 0;
background-color: #d9d9d9;
}
            </Style>
        
</body>
</html>
