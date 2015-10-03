using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcessingJSONin.NET
{
    
    public class VideoChannelDataBase : IDataBase
    {
        private string id;

        public VideoChannelDataBase(string id)
        {
            this.ID = id;
            this.Archive = new List<IEntry>();
        }
        public string ID
        {
            get
            {
                return this.id;
            }
            private set
            {
                this.id = value;
            }
        }
        
        public string Name { get; set; }
        
        public string InternetLink { get; set; }

        public IList<IEntry> Archive { get; set; }

        public void AddToArchive(IEntry entry)
        {
            this.Archive.Add(entry);
        }

        public void RemoveFromArchive(IEntry entry)
        {
            this.Archive.Remove(entry);
        }

        public IEntry GetById(string id)
        {
            return this.Archive.FirstOrDefault(x => x.ID == id);
        }

        public void ListAll()
        {
            if (this.Archive.Count < 1)
            {
                Console.WriteLine("DataBase is empty");
                return;
            }

            Console.WriteLine("Videos in archive:");
            foreach (var video in this.Archive)
            {
                Console.WriteLine(video.Title);
            }
                
        }

    }
}
