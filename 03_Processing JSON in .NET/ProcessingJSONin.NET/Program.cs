using HtmlAgilityPack;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Xml;

namespace ProcessingJSONin.NET
{   /*
     Homework

    Using JSON.NET and the Telerik Academy Youtube RSS feed, implement the following:
        1.The RSS feed is located at https://www.youtube.com/feeds/videos.xml?channel_id=UCLC-vbm7OWvpbqzXaoAMGGw
        2. Download the content of the feed programatically
            - You can use WebClient.DownloadFile()
        3. Parse teh XML from the feed to JSON
        4. Using LINQ-to-JSON select all the video titles and print the on the console
        5. Parse the videos' JSON to POCO
        6. Using the POCOs create a HTML page that shows all videos from the RSS
            - Use <iframe>
            - Provide a links, that nagivate to their videos in YouTube
     */
    class Program
    {
        static void Main(string[] args)
        {
            System.Text.Encoding encoding = System.Text.Encoding.GetEncoding(1251);

            Console.OutputEncoding = Encoding.GetEncoding(1251);

            string rssYouTubeTelerik = "https://www.youtube.com/feeds/videos.xml?channel_id=UCLC-vbm7OWvpbqzXaoAMGGw";
            string downloadLocation = "../../download.xml";

            var downloader = new WebClient();
            downloader.DownloadFile(rssYouTubeTelerik, downloadLocation);

            XmlDocument document = new XmlDocument();
            document.Load(downloadLocation);

            var json = JsonConvert.SerializeObject(document, Newtonsoft.Json.Formatting.Indented);
            var jsonObj = JObject.Parse(json);
            var arr = jsonObj["feed"]["entry"];

            Console.WriteLine("Видео Заглавия:");
            for (int i = 0; i < arr.Count(); i++)
            {
                Console.WriteLine("{0} --> {1}", i + 1, arr[i]["title"]);   
            }

            Console.WriteLine(new string('+', 35));

            // Info for the channel
            var dataBaseInfo = new
            {
                id = jsonObj["feed"]["yt:channelId"],
                Name = jsonObj["feed"]["title"],
                InternetLink = jsonObj["feed"]["author"]["uri"]
            };

            var databaseJson = JsonConvert.SerializeObject(dataBaseInfo);
            
            var dataBaseVideos = JsonConvert.DeserializeObject<VideoChannelDataBase>(databaseJson);


            // Videos as a list of JSONs
            var jsonVideosList = jsonObj["feed"]["entry"].Children().ToList();
            
            foreach (var jsonObject in jsonVideosList)
            {
                Entry video = JsonConvert.DeserializeObject<Entry>(jsonObject.ToString());
                dataBaseVideos.AddToArchive(video);
            }

            HtmlDocument doc = new HtmlDocument();
            doc.Load("../../index.html");
            HtmlNode wrapper = doc.GetElementbyId("wrapper");
            HtmlNode ul = doc.CreateElement("ul");
            ul.SetAttributeValue("class", "list-group");
            HtmlNode videoChapter = doc.CreateElement("div");
            videoChapter.SetAttributeValue("style", "width:70%");

            var strBuilder = new StringBuilder();

            foreach (Entry video in dataBaseVideos.Archive)
            {
                var li = doc.CreateElement("li");
                li.SetAttributeValue("class", "list-group-item");
                li.SetAttributeValue("style", "background-color:maroon");
                
                string authorButton = string.Format(
                    "<button type=\"button\" class=\"btn btn-success\"><a style=\"color:white\" href=\"{0}\">{1}</a></button><br>",
                    video.author.Uri, video.author.Name);
                string title = string.Format("<div class=\"panel panel-default\"><div class=\"panel-heading\"><strong>{0}</strong></div><div class=\"panel-body\">{1}</div></div>"
                    , video.Title, video.ExtraInfo.Description);

                strBuilder.Append(authorButton);
                strBuilder.Append(title);
                li.InnerHtml += strBuilder.ToString();
                strBuilder.Clear();

                HtmlNode videoFrame = doc.CreateElement("div");
                videoFrame.SetAttributeValue("style", "width:520");
                videoFrame.InnerHtml = string.Format("<iframe width=\"500\" height=\"300\" src=\"{0}\"></iframe><img style=\"position: absolute; right:50px\" src=\"super_ninja.png\">"
                    , video.Link);
                
                li.AppendChild(videoFrame);

                ul.AppendChild(li);
            }

            videoChapter.AppendChild(ul);
            wrapper.AppendChild(videoChapter);
            doc.Save("../../video-catalog.html");
        }
    }
}
