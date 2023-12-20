//using System;
//namespace TicketGenerator.Controllers
//{
//    public class EmptyClass
//    {
//        public EmptyClass()
//        {
//        }
//    }
//}
using System;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Web;
using ZXing;

namespace TicketGenerator.Controllers
{
    public class EmptyClass : IHttpHandler
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

                    // Generate QR code with ZXing.Net
                    BarcodeWriter writer = new BarcodeWriter();
                    writer.Format = ZXing.BarcodeFormat.QR_CODE;

                    writer.Options = new ZXing.QrCode.QrCodeEncodingOptions
                    {
                        ErrorCorrection = ZXing.QrCode.Internal.ErrorCorrectionLevel.H,
                        // You can add more options if needed
                    };

                    Bitmap qrCodeImage = writer.Write(requestData);

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

