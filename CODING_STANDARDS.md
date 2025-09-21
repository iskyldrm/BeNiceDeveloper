# .NET Coding Standards & Best Practices 📏

A comprehensive guide to writing clean, maintainable, and professional .NET code.

## 🎯 General Principles

### Code Quality Fundamentals
1. **Readability** - Code should be self-documenting
2. **Consistency** - Follow established patterns throughout
3. **Simplicity** - Prefer simple solutions over complex ones
4. **Maintainability** - Think about future developers (including yourself)

### SOLID Principles
- **S** - Single Responsibility Principle
- **O** - Open/Closed Principle
- **L** - Liskov Substitution Principle
- **I** - Interface Segregation Principle
- **D** - Dependency Inversion Principle

## 📝 Naming Conventions

### Classes and Interfaces
```csharp
// ✅ Good - PascalCase
public class CustomerService { }
public interface IPaymentProcessor { }

// ❌ Bad
public class customerservice { }
public interface paymentProcessor { }
```

### Methods and Properties
```csharp
// ✅ Good - PascalCase
public string FirstName { get; set; }
public void ProcessPayment() { }

// ❌ Bad
public string firstName { get; set; }
public void process_payment() { }
```

### Variables and Parameters
```csharp
// ✅ Good - camelCase
private string customerName;
public void UpdateCustomer(string customerId) { }

// ❌ Bad
private string CustomerName;
public void UpdateCustomer(string CustomerId) { }
```

### Constants and Static Fields
```csharp
// ✅ Good - PascalCase
public const int MaxRetryAttempts = 3;
public static readonly string ConnectionString = "...";

// ❌ Bad
public const int MAX_RETRY_ATTEMPTS = 3;
public static readonly string connection_string = "...";
```

## 🏗️ Code Structure

### File Organization
```
Project/
├── Controllers/
├── Models/
├── Services/
├── Repositories/
├── DTOs/
├── Interfaces/
├── Extensions/
└── Utilities/
```

### Class Structure Order
```csharp
public class ExampleClass
{
    // 1. Constants
    private const int MaxItems = 100;
    
    // 2. Static fields
    private static readonly Logger _logger = LogManager.GetCurrentClassLogger();
    
    // 3. Instance fields
    private readonly IRepository _repository;
    private string _customerName;
    
    // 4. Constructors
    public ExampleClass(IRepository repository)
    {
        _repository = repository ?? throw new ArgumentNullException(nameof(repository));
    }
    
    // 5. Properties
    public string CustomerName { get; set; }
    
    // 6. Public methods
    public void ProcessCustomer() { }
    
    // 7. Private methods
    private void ValidateCustomer() { }
}
```

## 🧼 Clean Code Practices

### Method Guidelines
```csharp
// ✅ Good - Single responsibility, clear intent
public bool IsValidEmail(string email)
{
    if (string.IsNullOrWhiteSpace(email))
        return false;
        
    return Regex.IsMatch(email, @"^[^@\s]+@[^@\s]+\.[^@\s]+$");
}

// ❌ Bad - Too many responsibilities
public string ProcessUserDataAndSendEmail(User user)
{
    // Validation logic
    // Data processing logic
    // Email sending logic
    // Return multiple types of information
}
```

### Variable Declarations
```csharp
// ✅ Good - Meaningful names, appropriate scope
var customers = await _repository.GetCustomersAsync();
var isValidCustomer = ValidateCustomer(customer);

// ❌ Bad - Unclear names, unnecessary declarations
var c = await _repository.GetCustomersAsync();
var temp = ValidateCustomer(customer);
bool flag = true;
```

### Exception Handling
```csharp
// ✅ Good - Specific exceptions, proper logging
public async Task<Customer> GetCustomerAsync(int customerId)
{
    try
    {
        if (customerId <= 0)
            throw new ArgumentException("Customer ID must be positive", nameof(customerId));
            
        return await _repository.GetByIdAsync(customerId);
    }
    catch (DatabaseException ex)
    {
        _logger.LogError(ex, "Database error retrieving customer {CustomerId}", customerId);
        throw new ServiceException("Unable to retrieve customer data", ex);
    }
}

// ❌ Bad - Generic exceptions, swallowing errors
public Customer GetCustomer(int id)
{
    try
    {
        return _repository.GetById(id);
    }
    catch
    {
        return null; // Don't swallow exceptions!
    }
}
```

## 🔄 Async/Await Best Practices

### Async Method Naming
```csharp
// ✅ Good - Async suffix for async methods
public async Task<Customer> GetCustomerAsync(int id) { }
public async Task SaveCustomerAsync(Customer customer) { }

// ❌ Bad - Missing Async suffix
public async Task<Customer> GetCustomer(int id) { }
```

### ConfigureAwait Usage
```csharp
// ✅ Good - In library code
var result = await SomeOperationAsync().ConfigureAwait(false);

// ✅ Good - In UI/Web applications (can omit ConfigureAwait)
var result = await SomeOperationAsync();
```

### Avoid Async Void
```csharp
// ✅ Good - Return Task for async methods
public async Task ProcessDataAsync() { }

// ❌ Bad - Avoid async void (except event handlers)
public async void ProcessData() { } // Don't do this!
```

## 🧪 Testing Standards

### Test Method Naming
```csharp
[Test]
public void GetCustomer_WithValidId_ReturnsCustomer() { }

[Test] 
public void GetCustomer_WithInvalidId_ThrowsArgumentException() { }
```

### Arrange-Act-Assert Pattern
```csharp
[Test]
public void CalculateTotal_WithValidItems_ReturnsCorrectSum()
{
    // Arrange
    var calculator = new OrderCalculator();
    var items = new List<OrderItem>
    {
        new OrderItem { Price = 10.00m, Quantity = 2 },
        new OrderItem { Price = 5.00m, Quantity = 1 }
    };

    // Act
    var total = calculator.CalculateTotal(items);

    // Assert
    Assert.AreEqual(25.00m, total);
}
```

## 📊 Performance Guidelines

### String Operations
```csharp
// ✅ Good - StringBuilder for multiple concatenations
var sb = new StringBuilder();
foreach (var item in items)
{
    sb.AppendLine(item.ToString());
}
return sb.ToString();

// ❌ Bad - String concatenation in loops
string result = "";
foreach (var item in items)
{
    result += item.ToString() + "\n"; // Creates new string each time
}
```

### LINQ Optimization
```csharp
// ✅ Good - Efficient LINQ usage
var activeCustomers = customers
    .Where(c => c.IsActive)
    .Select(c => c.Name)
    .ToList();

// ❌ Bad - Multiple enumerations
var activeCustomers = customers.Where(c => c.IsActive);
var count = activeCustomers.Count(); // First enumeration
var names = activeCustomers.Select(c => c.Name).ToList(); // Second enumeration
```

## 🔒 Security Best Practices

### Input Validation
```csharp
// ✅ Good - Validate all inputs
public void UpdateUser(string userId, string email)
{
    if (string.IsNullOrWhiteSpace(userId))
        throw new ArgumentException("User ID cannot be null or empty");
        
    if (!IsValidEmail(email))
        throw new ArgumentException("Invalid email format");
        
    // Process the update
}
```

### SQL Injection Prevention
```csharp
// ✅ Good - Parameterized queries
var sql = "SELECT * FROM Users WHERE UserId = @userId";
var parameters = new { userId = userIdParameter };

// ❌ Bad - String concatenation
var sql = $"SELECT * FROM Users WHERE UserId = {userId}"; // Don't do this!
```

## 📚 Documentation Standards

### XML Documentation
```csharp
/// <summary>
/// Calculates the total amount for an order including taxes and shipping.
/// </summary>
/// <param name="order">The order to calculate the total for.</param>
/// <param name="includeTax">Whether to include tax in the calculation.</param>
/// <returns>The total amount as a decimal value.</returns>
/// <exception cref="ArgumentNullException">Thrown when order is null.</exception>
public decimal CalculateOrderTotal(Order order, bool includeTax = true)
{
    // Implementation
}
```

### Code Comments
```csharp
// ✅ Good - Explain WHY, not WHAT
// Using exponential backoff to handle transient failures
await Task.Delay(Math.Min(1000 * (int)Math.Pow(2, retryCount), 30000));

// ❌ Bad - Obvious comments
// Increment the counter by 1
counter++;
```

## 🔧 Tools & Extensions

### Recommended Tools
- **EditorConfig** - Consistent formatting across team
- **StyleCop** - Code style analysis
- **SonarLint** - Code quality analysis
- **Resharper** - Advanced refactoring and analysis

### Code Formatting
Use `.editorconfig` file for consistent formatting:
```ini
[*.cs]
indent_style = space
indent_size = 4
end_of_line = crlf
charset = utf-8
trim_trailing_whitespace = true
insert_final_newline = true
```

---

Remember: These standards are guidelines to help you write better code. The most important thing is consistency within your project and team! 🎯