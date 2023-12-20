<%@ Page Language="C#" Inherits="TicketGenerator.Views.QRgenerat" %>
<!DOCTYPE html>
<html>
<head>
    <title>QR Code Generator</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            text-align: center;
            margin: 0;
            padding: 0;
            background-image: url('App_Data/images/9252909.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat; /* Fixing this property */
        }

        form {
            background-color: #ffffff;
            padding: 20px;
            margin: 20px auto;
            max-width: 400px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 10px;
            font-size: 16px;
            font-weight: bold;
            color: #333333;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            box-sizing: border-box;
            border: 1px solid #cccccc;
            border-radius: 5px;
            font-size: 16px;
        }

        button {
            background-color: #4caf50;
            color: white;
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }

        #qrCodeContainer {
            margin-top: 20px;
        }

        header {
            background-color: #000000;
            padding: 10px;
            color: white;
            text-align: left;
        }
    </style>
</head>
<body>
    <header>
        <a style="color: white;" class="nav-link" href="Dashboard">
            <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
            Dashboard
        </a>
    </header>
    <form id="form1" runat="server">
        <label for="qrData">Enter data to encode:</label>
        <asp:TextBox ID="qrDataTextBox" runat="server" placeholder="Your string here"></asp:TextBox>
        <br />
        <button type="button" onclick="generateButton_Click()">Generate QR Code</button>
    </form>
    <br />
    <div id="qrCodeContainer" runat="server"></div>

    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script type="text/javascript">
        function generateButton_Click() {
            console.log("generateButton_Click"); // Corrected from Console.log to console.log
            var dataToEncode = document.getElementById('<%= qrDataTextBox.ClientID %>').value;
            $.ajax({
                url: '/byte_array_base', // Assuming this is the correct endpoint
                type: 'POST',
                data: JSON.stringify({ Data: dataToEncode }),
                contentType: 'application/json',
                success: function (response) {
                    console.log(response); // Corrected from Console.log to console.log
                    $("#qrCodeContainer").html("<img style=\"height: 200px;\" src=\"data:image/png;base64," + response + "\" alt=\"QR Code\" />");
                },
                error: function (xhr, status, error) {
                    // Handle error
                    console.error("Error generating QR code: " + error);
                }
            });
        }
    </script>
</body>
</html>
