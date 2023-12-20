<%@ Page Language="C#" Inherits="TicketGenerator.Views.Ticket2" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Image and Input Details</title>
</head>
<body style="font-family: Arial, sans-serif; text-align: center;">

    <h1>Image and Input Details</h1>

    <!-- Image Container -->
    <div id="imageContainer" style="margin-top: 20px; position: relative;">
        <div id="detailsContainer" style="position: absolute; top: 11%; left: 15%; transform: translate(-50%, -50%); background-color: rgba(255, 255, 255, 0.8); padding: 10px; display: inline-block;"></div>
        <img src="https://via.placeholder.com/300" alt="Sample Image" width="300" height="200">
    </div>

    <!-- Input Box and Button -->
    <div>
        <label for="inputString">Enter String:</label>
        <input type="text" id="inputString" placeholder="Type something...">
        <button onclick="showDetails()">Show Details</button>
    </div>

    <!-- Print Button -->
    <button onclick="printTicket()">Print Ticket</button>

    <script>
        function showDetails() {
            // Get the value from the input box
            var inputString = document.getElementById('inputString').value;

            // Display details at the center of the image
            var detailsContainer = document.getElementById('detailsContainer');
            detailsContainer.innerHTML = '<p>Entered String: ' + inputString + '</p>';
        }

        function printTicket() {
            // Clone the image container and its contents
            var printContainer = document.getElementById('imageContainer').cloneNode(true);

            // Set the styles for the print container
            printContainer.style.position = 'static';
            printContainer.style.marginTop = '0';

            // Open a new window or iframe
            var printWindow = window.open('', '_blank');

            // Write the content of the cloned container to the new window or iframe
            printWindow.document.write('<html><head><title>Ticket</title></head><body>');
            printWindow.document.write(printContainer.outerHTML);
            printWindow.document.write('</body></html>');
            printWindow.document.close();

            // Trigger the print functionality in the new window or iframe
            printWindow.print();
        }
    </script>

</body>
</html>
