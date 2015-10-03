using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcessingJSONin.NET
{
    public class Entry : IEntry
    {
        private string id;
        private IDataBase library;
        private string link;

        public Entry(string id, IDataBase library)
        {
            this.ID = id;
            this.Library = library;
            this.Store();
        }
        public Entry()
        {
        }

        [JsonProperty("yt:videoId")]
        public string ID
        {
            get 
            {
                return this.id;
            }
            set
            {
                this.id = value;
            }
        }
        public string Title { get; set; }

        public Author author { get; set; }

        [JsonProperty("@href")]
        public string Link 
        { 
            get
            {
                return ("http://www.youtube.com/embed/" + this.ID);
            }
            
        }
        [JsonProperty("media:group")]
        public EntryContext ExtraInfo { get; set; }

        public IDataBase Library
        {
            get
            {
                return this.library;
            }
            set
            {
                this.library = value;
            }

        }

        public void Store()
        {
            this.Library.AddToArchive(this);
        }
    }
}
