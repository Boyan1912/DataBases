using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ProcessingJSONin.NET
{
    public class EntryContext
    {
        [JsonProperty("media:description")]
        public string Description { get; set; }


    }
}
