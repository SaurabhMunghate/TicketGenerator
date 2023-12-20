//using System;
//namespace TicketGenerator.Controllers
//{
//    public class ByteArrayBase64
//    {
//        public ByteArrayBase64()
//        {
//        }
//    }
//}
using System;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Text.Json;
using System.Web;
using ZXing;

namespace TicketGenerator.Controllers
{
    public class ByteArrayBase64 : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            if (context.Request.HttpMethod == "POST")
            {
                try
                {
                    // Read the POST data from the request
                    Stream inputStream = context.Request.InputStream;
                    StreamReader reader = new StreamReader(inputStream);
                    string requestData = reader.ReadToEnd();

                    // Manually deserialize JSON to get the value of "dataToEncode"
                    var jsonDocument = JsonDocument.Parse(requestData);
                    var root = jsonDocument.RootElement;
                    string originalData = root.GetProperty("Data").GetString();

                    // Generate a random number within a specific range (e.g., between 1 and 100)
                    Random random = new Random();
                    int minRange = 1;
                    int maxRange = 10000;
                    int randomInRange = random.Next(minRange, maxRange + 1);


                    Console.WriteLine("originalData :"+originalData);
                    // Add current date and time to the dataToEncode
                    string dataToEncode = originalData + " - " + randomInRange + " - " + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");

                    Console.WriteLine("dataToEncode :" + dataToEncode);
                    // Generate QR code with ZXing.Net
                    BarcodeWriter writer = new BarcodeWriter();
                    writer.Format = ZXing.BarcodeFormat.QR_CODE;

                    writer.Options = new ZXing.QrCode.QrCodeEncodingOptions
                    {
                        ErrorCorrection = ZXing.QrCode.Internal.ErrorCorrectionLevel.H,
                        // You can add more options if needed
                    };

                    Bitmap qrCodeImage = writer.Write(dataToEncode);

                    // Convert image to byte array for base64 encoding
                    using (MemoryStream ms = new MemoryStream())
                    {
                        qrCodeImage.Save(ms, ImageFormat.Png);
                        byte[] imageBytes = ms.ToArray();

                        // Convert the byte array to a base64 string
                        string base64String = Convert.ToBase64String(imageBytes);

                        // Send the base64 string as the response
                        context.Response.ContentType = "text/plain";
                        context.Response.Write(base64String);
                    }
                }
                catch (Exception ex)
                {
                    // Handle QR code generation error
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Error generating QR code: " + ex.Message);
                }
            }
            else
            {
                context.Response.ContentType = "text/plain";
                context.Response.Write("Invalid request method. Only POST requests are allowed.");
            }
        }

        public bool IsReusable
        {
            get { return false; }
        }
    }
}
