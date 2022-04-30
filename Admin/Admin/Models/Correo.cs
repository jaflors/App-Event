using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;

namespace Admin.Models
{
    public class Correo
    {
        Boolean estado = true;
        string merror;
        public Correo(string destinatario,string asunto,string mensaje)
        {
            MailMessage email = new MailMessage();
            SmtpClient protocolo = new SmtpClient();
            email.To.Add(destinatario);
            email.From = new MailAddress("appevent20@gmail.com", "jaime Andres Florez",System.Text.Encoding.UTF8);
            email.Subject = asunto;
            email.SubjectEncoding = System.Text.Encoding.UTF8;
            email.Body = mensaje;
            email.BodyEncoding = System.Text.Encoding.UTF8;
            email.IsBodyHtml = false;
            protocolo.Credentials = new System.Net.NetworkCredential("appevent20@gmail.com", "appevent12345");
            protocolo.Port = 587;
            protocolo.Host = "smtp.gmail.com";
            protocolo.EnableSsl = true;
            try
            {
                protocolo.Send(email);
            }
            catch(SmtpException error)
            {
                estado = false;
                merror = error.Message.ToString();
            }



        }

        public Boolean Estado
        {
            get { return estado; }
        }
        public String mensaje_error
        {
            get { return merror; }
        } 




    }
}