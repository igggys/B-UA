using static System.Runtime.InteropServices.JavaScript.JSType;
using System.Text;
using System;
using WebAppTest.Infrastructure;

namespace WebAppTest.Services
{
    public class Connector
    {
        public Connector() 
        {
            //
        }

        public async Task<ApplicationResponse> Get(string serviceName, string path, Dictionary<string, string> headers)
        {
            ApplicationResponse result = null;

            using (var client = new HttpClient())
            {
                try
                {
                    var response = await client.GetAsync(path);

                    if (response.StatusCode != System.Net.HttpStatusCode.OK)
                    {
                        result = new() { IsError = true, Message = $"Response StatusCode is {response.StatusCode}", Data = null };
                    }
                    else
                    {
                        var responseContentString = await response.Content.ReadAsStringAsync();
                        result = new() { IsError = false, Message = string.Empty, Data = responseContentString };
                    }
                }
                catch (System.Exception exception)
                {
                    result = new() { IsError = true, Message = exception.Message, Data = null };
                }
            }

            return result;
        }
    }
}
