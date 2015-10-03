using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcessingJSONin.NET
{
    public interface IEntry
    {
        string ID { get; }
        string Title { get; }
    }
}
