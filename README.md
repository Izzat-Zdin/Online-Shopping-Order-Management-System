# OSOMS - Online Shopping Order Management System

## 7 Attributes Display + 1 Derived Value

### Order Attributes:
1. **Order ID** - Unique order identifier
2. **Customer Name** - Name of the customer
3. **Product Name** - Name of the product
4. **Quantity** - Number of items ordered
5. **Unit Price** - Price per unit (RM)
6. **Order Date** - Date of order
7. **Payment Status** - PAID, UNPAID, or REFUND

### Derived Value:
- **Total Amount** = Quantity × Unit Price

## Quick Start

### Just Run It!
```cmd
OSOMS_final.exe
```

**Data is pre-loaded!** The program automatically loads 10,000 orders from `orders_data.txt` on startup.

## Features

### Display
- Clean list format (no table borders)
- Shows 7 attributes (Category removed)
- First 100 orders (sorted/unsorted)

### Sorting
- Insertion Sort (O(n²))
- Quick Sort (O(n²) worst case)
- Performance comparison
- Sort by: Total Amount (DESC), Order ID (ASC)

### Searching
- Linear Search
- Binary Search
- Optimized Linear Search (Sentinel)
- 100 search operations test
- Search by: Order ID + Customer Name

### Reports
- Total Sales (PAID orders)
- Sales by Category
- Top 10 Customers

## Sample Display

```
SORTED ORDERS (First 100)
================================================================================
 No  OrderID  Customer Name        Product Name         Qty  UnitPrice   OrderDate   Payment    TotalAmt
--------------------------------------------------------------------------------
   1     1045 Ahmad Abdullah       Laptop Pro             5     450.00  15/03/2024  PAID         2250.00
   2     1023 Siti Rahman          T-Shirt Cotton         3      45.90  18/03/2024  UNPAID        137.70
================================================================================
```

## Files

- **main.cpp** - Source code
- **OSOMS_final.exe** - Executable (ready to run!)
- **orders_data.txt** - 10,000 pre-generated orders
- **README.md** - This file

## Data Structure
- **Linked List** (no vectors)
- 10,000 order records
- Auto-loaded from file
- Simple, clean display

## No Setup Required!
Just run `OSOMS_final.exe` and the data loads automatically! 🚀
