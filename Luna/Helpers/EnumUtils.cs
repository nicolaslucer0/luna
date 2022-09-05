using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Reflection;

namespace Yana.Helpers
{
    public class EnumUtils
    {
        public static string GetEnumValueDescription(object value)
        {
            Type pobjType = value.GetType();

            FieldInfo pobjFieldInfo = pobjType.GetField(Enum.GetName(pobjType, value));

            DescriptionAttribute pobjAttribute = (DescriptionAttribute)
                (pobjFieldInfo.GetCustomAttributes(typeof(DescriptionAttribute), false)[0]);

            return pobjAttribute.Description;
        }

        public static IList ToList(Type type)
        {
            if (type == null)
            {
                throw new ArgumentNullException("type");
            }

            ArrayList list = new ArrayList();
            Array enumValues = Enum.GetValues(type);

            foreach (Enum value in enumValues)
            {
                list.Add(new KeyValuePair<Enum, string>(value, GetEnumValueDescription(value)));
            }

            return list;
        }

        public static object EnumValueOf(string value, Type enumType)
        {
            string[] names = Enum.GetNames(enumType);
            foreach (string name in names)
            {
                if (GetEnumValueDescription((Enum)Enum.Parse(enumType, name)).Equals(value))
                {
                    return Enum.Parse(enumType, name);
                }
            }

            throw new ArgumentException("The string is not a description or value of the specified enum.");
        }
    }
}
