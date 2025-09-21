# Hello World - Your First C# Program

Let's start with the classic "Hello World" program to ensure your development environment is set up correctly.

## 📝 Program Overview

This simple console application demonstrates:
- Basic C# syntax
- Console input/output
- Variable declaration
- String interpolation

## 💻 Code Example

```csharp
using System;

namespace HelloWorld
{
    class Program
    {
        static void Main(string[] args)
        {
            // Basic output
            Console.WriteLine("Hello, World!");
            Console.WriteLine("Welcome to .NET development!");
            
            // Variables and string interpolation
            string name = "Developer";
            int year = DateTime.Now.Year;
            
            Console.WriteLine($"Hello, {name}! Welcome to .NET in {year}!");
            
            // User interaction
            Console.Write("What's your name? ");
            string userName = Console.ReadLine();
            
            Console.WriteLine($"Nice to meet you, {userName}!");
            Console.WriteLine("Press any key to exit...");
            Console.ReadKey();
        }
    }
}
```

## 🚀 How to Run

1. **Using .NET CLI:**
   ```bash
   dotnet new console -n HelloWorld
   cd HelloWorld
   # Replace Program.cs content with the code above
   dotnet run
   ```

2. **Using Visual Studio:**
   - Create new Console App (.NET)
   - Replace default code with the example above
   - Press F5 to run

3. **Using Visual Studio Code:**
   - Create new folder and Program.cs file
   - Add the code above
   - Run with `dotnet run` in terminal

## 🎯 What You'll Learn

- Basic console application structure
- Using statements and namespaces
- Main method as entry point
- Console input and output methods
- Variable declaration and initialization
- String interpolation with `$"{variable}"`

## 📚 Key Concepts

### Using Statements
```csharp
using System;  // Imports the System namespace
```

### Namespace Declaration
```csharp
namespace HelloWorld  // Organizes code into logical groups
```

### Class Declaration
```csharp
class Program  // Defines a class named Program
```

### Main Method
```csharp
static void Main(string[] args)  // Entry point of the application
```

## 🎯 Next Steps

After running this program successfully:
1. Experiment with different variable types (int, double, bool)
2. Try different Console methods (WriteLine, Write, ReadLine)
3. Practice string formatting and interpolation
4. Add some simple calculations

## 💡 Common Issues

**Issue:** `dotnet` command not found
**Solution:** Install .NET SDK from https://dotnet.microsoft.com/download

**Issue:** Program exits immediately
**Solution:** Add `Console.ReadKey();` at the end

**Issue:** Build errors
**Solution:** Check for missing semicolons and proper syntax

---

Congratulations! You've written your first C# program. Ready for more? 🎉