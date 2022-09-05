
using System;

namespace Yana.Utils.Exceptions
{
    public class GeneralValidationException : Exception
    {
        /// <summary>
        /// default constructor.
        /// </summary>
        public GeneralValidationException()
        {
        }

        /// <summary>
        /// constructor that takes the excepcion message as a parameter.
        /// </summary>
        /// <param name="message"> exception message. </param>
        public GeneralValidationException(string message) : base(message)
        {
        }
    }
}