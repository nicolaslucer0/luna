using System;
using Twilio;
using Twilio.Rest.Api.V2010.Account;

namespace Yana.Utils.Utils.NotificacionesManager
{
    public static class TwilioManager
    {
        public static void SendTwilioNotification()
        {
            const string accountSid = "AC1be1a20ae3aa2b9b9e5eaace1c477b66";
            const string authToken = "059d6805912407a22513d2a4f157f725";
        
            //     TwilioClient.Init(accountSid, authToken);
            //     var message = MessageResource.Create(
            //     body: "¿Como estás?. Respondé ingresando a http://www.yana.com.ar/",
            //     from: new Twilio.Types.PhoneNumber("whatsapp:+14155238886"),
            //     to: new Twilio.Types.PhoneNumber("whatsapp:+5491141658965")
            //     );
        
           // Console.WriteLine(message.Sid);
        }
    }
}
