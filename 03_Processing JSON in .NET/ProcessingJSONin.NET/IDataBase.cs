using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcessingJSONin.NET
{
    public interface IDataBase
    {
        IList<IEntry> Archive { get; set; }
        void AddToArchive(IEntry entry);
    }
}
