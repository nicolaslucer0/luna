using System;

namespace Yana.Utils.Exceptions
{
    public class FileUploadException : Exception
    {
        /// <summary>
        /// default constructor.
        /// </summary>
        public FileUploadException()
        {
        }

        /// <summary>
        /// constructor that takes the excepcion message as a parameter.
        /// </summary>
        /// <param name="message"> exception message. </param>
        public FileUploadException(string message) : base(message)
        {
        }
    }
}