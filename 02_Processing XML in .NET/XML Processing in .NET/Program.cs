using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Xml;
using System.Xml.Linq;
using System.Xml.Schema;
using System.Xml.Xsl;

namespace XML_Processing_in.NET
{
    /* 1. Create a XML file representing catalogue.

    The catalogue should contain albums of different artists.
    For each album you should define: name, artist, year, producer, price and a list of songs.
    Each song should be described by title and duration.

        2. Write program that extracts all different artists which are found in the catalog.xml.

    For each author you should print the number of albums in the catalogue.
    Use the DOM parser and a hash-table.
*/

    class Program
    {
        static void Main(string[] args)
        {
            XmlDocument doc = new XmlDocument();
            doc.Load("../../catalog.xml");

            XmlNode root = doc.DocumentElement;

            XmlNode albumsListNode = root.FirstChild;

            Hashtable table = new Hashtable();
            int count = 1;

            foreach (XmlNode album in albumsListNode.ChildNodes)
            {
                string artist = album["artist"].InnerText;

                if (table.ContainsKey(artist))
                {
                    int currentCount = (int)table[artist];
                    currentCount++;
                    table[artist] = currentCount;
                    continue;
                }

                table.Add(artist, count);
            }

            PrintNumberAlbumsPerArtist(table);

            EndTask();

            // 3. Implement the previous using XPath.

            table.Clear();

            XmlNodeList artists = root.SelectNodes("albums/album/artist");

            count = 1;
            foreach (XmlNode artist in artists)
            {
                string artistName = artist.InnerText;

                if (table.ContainsKey(artistName))
                {
                    int currentCount = (int)table[artistName];
                    currentCount++;
                    table[artistName] = currentCount;
                    continue;
                }

                table.Add(artistName, count);
            }

            PrintNumberAlbumsPerArtist(table);

            EndTask();

            /*
         *  4. Using the DOM parser write a program to delete from catalog.xml all albums having price > 20.
         *  */

            XmlNodeList listToDelete = root.SelectNodes("albums/album[price>20]");

            var textToDelete = new List<string>();
            foreach (XmlNode node in listToDelete)
            {
                textToDelete.Add(node.InnerText);
                Console.WriteLine("Index of text to delete in original xml: {0}", root.InnerText.IndexOf(node.InnerText));
                node.ParentNode.RemoveChild(node);
            }
            Console.WriteLine();
            foreach (var text in textToDelete)
            {
                Console.WriteLine("Index of text to delete in new xml: {0}", root.InnerText.IndexOf(text));
            }

            EndTask();
            /*
             *  5. Write a program, which using XmlReader extracts all song titles from catalog.xml.
            */

            int number = 0;
            Console.WriteLine("Songs in the catalogue:");
            using (XmlReader reader = XmlReader.Create("../../catalog.xml"))
            {
                while (reader.Read())
                {
                    if ((reader.NodeType == XmlNodeType.Element) && (reader.Name == "title"))
                    {
                        Console.WriteLine(++number + " " + reader.ReadElementContentAsString());
                    }
                }
            }

            EndTask();

            /*
             * 6. Rewrite the same using XDocument and LINQ query.
             * */

            XDocument xdoc = XDocument.Load("../../catalog.xml");

            var songs = from title in xdoc.Descendants("title")
                        select title.Value;

            number = 0;
            Console.WriteLine("Songs in the catalogue (LINQ Query):");
            foreach (string song in songs)
            {
                Console.WriteLine(++number + ". " + song);
            }
            EndTask();

            /* 7. In a text file we are given the name, address and phone number of given person (each at a single line).

            Write a program, which creates new XML document, which contains these data in structured XML format.
            */
            XElement person = new XElement("person", "");

            XElement rootPeopleXml = new XElement("people",
                person);

            using (StreamReader reader = new StreamReader("../../people.txt"))
            {
                string line;
                while ((line = reader.ReadLine()) != null)
                {
                    string firstWord = line.Split(' ')[0];
                    string nodeName = firstWord.Trim(' ', ':').ToLower();

                    if (nodeName == "phone")
                    {
                        nodeName = "phoneNumber";
                        firstWord = "Phone number:";
                    }

                    string nodeValue = line.Replace(firstWord, "").Trim();

                    if (person.Elements(nodeName).Any())
                    {
                        person = new XElement("person", "");
                        rootPeopleXml.Add(person);
                    }

                    person.Add(new XElement(nodeName, nodeValue));
                }
            }

            Console.WriteLine(rootPeopleXml);

            rootPeopleXml.Save("../../peopleXml.xml");

            EndTask();

            /* 8. Write a program, which (using XmlReader and XmlWriter) reads the file catalog.xml 
             * and creates the file album.xml, in which stores in appropriate way the names of all albums 
             * and their authors.
             */

            using (XmlReader reader = XmlReader.Create("../../catalog.xml"))
            {
                using (XmlWriter writer = XmlWriter.Create("../../albums.xml"))
                {
                    writer.WriteStartDocument();
                    writer.WriteStartElement("albums");
                    writer.WriteStartElement("album");

                    while (reader.Read())
                    {
                        if (reader.NodeType == XmlNodeType.Element && reader.Name == "name")
                        {
                            writer.WriteElementString("name", reader.ReadElementContentAsString());
                        }
                        else if ((reader.NodeType == XmlNodeType.Element && reader.Name == "artist"))
                        {
                            writer.WriteElementString("author", reader.ReadElementContentAsString());
                        }
                    }

                    writer.WriteEndElement();
                    writer.WriteEndDocument();
                }

            }
            /*
    *  9. Write a program to traverse given directory and write to a XML file its contents together with all 
             *  subdirectories and files.

         - Use tags <file> and <dir> with appropriate attributes.
         - For the generation of the XML document use the class XmlWriter.
        */

            using (XmlWriter writer = XmlWriter.Create("../../traverseDir.xml"))
            {
                writer.WriteStartDocument();
                writer.WriteStartElement("dir");
                writer.WriteAttributeString("name", "root");

                string directory = "../../../../";

                InDepthSearch(writer, directory);

                writer.WriteEndDocument();
            }

            Console.WriteLine("View in browser!");
            EndTask();

            /*
             10. Rewrite the last exercises using XDocument, XElement and XAttribute.
             */

            XElement rootDirectory = new XElement("dir", "");
            rootDirectory.SetAttributeValue("id", "root");
            rootDirectory.SetAttributeValue("depthLevel", 0);

            string startDirectory = "../../../../";

            AddChildrenNodes(rootDirectory, startDirectory);

            rootDirectory.Save("../../traverseDirXElements.xml");

            Console.WriteLine("View in browser!");
            EndTask();
    /*  11. Write a program, which extract from the file catalog.xml the prices for all albums, 
     * published 5 years ago or earlier.
    Use XPath query.
*/

            var yearNow = DateTime.Now.Year;
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load("../../catalog.xml");
            
            string xPathDateQuery = string.Format("albums/album[year<={0}]", yearNow - 5);

            XmlNodeList listAlbums = xmlDoc.DocumentElement.SelectNodes(xPathDateQuery);

            Console.WriteLine("Prices for all albums published 5 years ago or earlier:");
            foreach (XmlNode album in listAlbums)
            {
                Console.WriteLine("{0} --> {1:C2}", album.SelectSingleNode("name").InnerText, 
                    Convert.ToDecimal(album.SelectSingleNode("price").InnerText));
            }

            EndTask();

            // 12.  Rewrite the previous using LINQ query.

            XDocument xDoc = XDocument.Load("../../catalog.xml");

            var results = xDoc.Descendants("year")
                            .Where(x => Convert.ToInt32(x.Value) <= yearNow - 5)
                            .Select(x => x.Parent);

            Console.WriteLine("Prices for all albums published 5 years ago or earlier (LINQ):");
            foreach (var res in results)
            {
                Console.WriteLine("{0} --> {1:C}", res.Element("name").Value, 
                    Convert.ToDecimal(res.Element("price").Value));
            }

            EndTask();

            /*
              13. Create an XSL stylesheet, which transforms the file catalog.xml into HTML document, 
             * formatted for viewing in a standard Web-browser.
             14.  Write a C# program to apply the XSLT stylesheet transformation on the file catalog.xml 
             * using the class XslTransform.
             */

            XslCompiledTransform xslt = new XslCompiledTransform();
            xslt.Load("../../catalog.xslt");
            xslt.Transform("../../catalog.xml", "../../catalog.html");

            /*
             16. Using Visual Studio generate an XSD schema for the file catalog.xml.
                - Write a C# program that takes an XML file and an XSD file (schema) 
             *  and validates the XML file against the schema.
                - Test it with valid XML catalogs and invalid XML catalogs.
             */

            XmlSchemaSet schema = new XmlSchemaSet();
            schema.Add("", "../../catalog.xsd");
            XDocument goodDocument = XDocument.Load("../../catalog.xml");
            XDocument badDocument = XDocument.Load("../../brokenCatalog.xml");

            ValidateDocument(goodDocument, schema);
            ValidateDocument(badDocument, schema);

            EndTask();
        }

        private static void ValidateDocument(XDocument doc, XmlSchemaSet schema)
        {
            string showScreen = string.Format("Validating {0}... ", doc.GetType().Name);
            int sleepTime = 0;
            foreach (char letter in showScreen)
            {
                Console.Write(letter);
                Thread.Sleep(sleepTime);
                sleepTime += 8;
            }
            var errorInfo = new XElement("errorsInfo", "");
            int index = 0;
            doc.Validate(schema, (success, error) =>
            {
                XElement errorMessage = new XElement("error", error.Message);
                errorMessage.SetAttributeValue("number", ++index);
                errorInfo.Add(errorMessage);
                errorInfo.Add(new XElement("severity", error.Severity));
                Console.ForegroundColor = ConsoleColor.Red;
            });

            string result = errorInfo.HasElements ? "Validation Failed!" : "Validation Successfull!";

            Console.WriteLine(result);

            foreach (XElement el in errorInfo.Descendants())
            {
                Console.WriteLine();
                string criticalError = string.Format("{0} {1} : {2}", el.Name.ToString().ToUpper(), el.Attribute("number"), el.Value);
                foreach(char symbol in criticalError)
                {
                    Console.Write(symbol);
                    Thread.Sleep(3);
                }
            }
            Console.ForegroundColor = ConsoleColor.Gray;
        }

        
        private static void AddChildrenNodes(XElement parent, string directory)
        {
           
            parent.Add(GetFileNames(directory).Select(x => new XElement("file", GetClearName(x))));

            foreach (string path in GetDirNames(directory))
            {
                int depth = Convert.ToInt32(parent.Attribute("depthLevel").Value);
                XElement el = new XElement("dir", GetClearName(path));
                el.SetAttributeValue("depthLevel", ++depth);
                el.SetAttributeValue("type", "folder");
                parent.Add(el);
                AddChildrenNodes(el, path);
            }
        }

        private static void InDepthSearch(XmlWriter writer, string directory)
        {

            foreach (string dir in GetDirNames(directory))
            {
                string dirName = GetClearName(dir);
                writer.WriteStartElement("dir");
                writer.WriteAttributeString("type", "folder");
                writer.WriteValue(dirName);

                foreach (string file in GetFileNames(dir))
                {
                    string fileName = GetClearName(file);
                    writer.WriteElementString("file", fileName);
                }

                InDepthSearch(writer, dir);
                
                writer.WriteEndElement();
            }

        }

        private static IEnumerable<string> GetFileNames(string dir)
        {
            return Directory.GetFiles(dir, "*.*", SearchOption.TopDirectoryOnly);

        }

        private static IEnumerable<string> GetDirNames(string dir)
        {
            return Directory.GetDirectories(dir, "*", SearchOption.TopDirectoryOnly);
        }

        private static string GetClearName(string path)
        {
            return path.Split('/', '\\').Reverse().ToArray()[0];
        }

        private static void EndTask()
        {
            Console.WriteLine();
            Console.WriteLine(new string('^', 30));
        }


        private static void PrintNumberAlbumsPerArtist(Hashtable table)
        {
            Console.WriteLine("Artist --> Number of albums:");
            foreach (DictionaryEntry artist in table)
            {
                Console.WriteLine("{0} --> {1}", artist.Key, artist.Value);
            }
        }
    }
}
