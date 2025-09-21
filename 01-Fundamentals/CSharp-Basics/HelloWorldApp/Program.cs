using System;

namespace HelloWorldApp
{
    class Program
    {
        static void Main(string[] args)
        {
            // Basic output
            Console.WriteLine("🚀 Welcome to BeNiceDeveloper!");
            Console.WriteLine("Your .NET learning journey starts here!");
            
            // Variables and string interpolation
            string repositoryName = "BeNiceDeveloper";
            int currentYear = DateTime.Now.Year;
            
            Console.WriteLine($"Repository: {repositoryName}");
            Console.WriteLine($"Year: {currentYear}");
            
            // User interaction
            Console.Write("\nWhat's your name? ");
            string? userName = Console.ReadLine();
            
            if (!string.IsNullOrWhiteSpace(userName))
            {
                Console.WriteLine($"\nHello, {userName}! 👋");
                Console.WriteLine("Ready to become a .NET developer? Let's go! 🎯");
            }
            else
            {
                Console.WriteLine("\nHello, future .NET developer! 👋");
            }
            
            Console.WriteLine("\nPress any key to continue your learning journey...");
            Console.ReadKey();
        }
    }
}
