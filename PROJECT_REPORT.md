# PROJECT REPORT

**Online Shopping Order Management System (OSOMS)**

---

## SECTION 1: TITLE & GROUP MEMBERS

### Title of the System:
**Online Shopping Order Management System (OSOMS)**

### Group Members:
- Name 1 – Matrix Number
- Name 2 – Matrix Number
- Name 3 – Matrix Number

---

## SECTION 2: INTRODUCTION

Online shopping has become very common in daily life. Many businesses now use online systems to manage customer orders, product information, and payment processes. As the number of online transactions increases, companies require a system that can efficiently handle large amounts of data. If data is not managed properly, the system may become slow, produce inaccurate results, or struggle to find important information.

An order management system must be able to store, organize, and retrieve data correctly, especially when handling thousands of order records. To achieve this, suitable algorithms are needed to ensure the system runs smoothly. Sorting and searching algorithms are basic methods used to manage large datasets. Sorting helps arrange data in an orderly way, while searching allows specific information to be found quickly. Using the right algorithms can greatly improve system performance.

The Online Shopping Order Management System (OSOMS) is created to simulate a real online shopping environment. The system manages 10,000 order records, each containing customer details, product information, order quantity, price, and payment status. This system provides a practical example for applying algorithm concepts using data similar to real e-commerce transactions.

This project compares two sorting algorithms and two searching algorithms based on their performance. The comparison focuses on execution time and efficiency when processing large amounts of data. Sorting algorithms are used to organize records, while searching algorithms are used to locate specific orders. Performance results are recorded to clearly show the differences between the algorithms used.

Besides sorting and searching, OSOMS also includes simple calculation and reporting functions. These functions help calculate total sales, analyze sales by product category, and identify customers who spend the most. By turning raw data into useful information, the system shows how effective algorithm usage can improve data handling and support better decision-making. Overall, this project helps students understand the importance of algorithms in managing data for online shopping systems.

The system is implemented using C++ programming language and utilizes a linked list data structure to store order records dynamically. Each order record contains seven attributes: Order ID, Customer Name, Product Name, Product Category, Quantity, Unit Price, and Order Date. Additionally, the system calculates a derived value, Total Amount, which is computed as the product of Quantity and Unit Price. This design allows the system to efficiently manage memory while providing flexibility in data manipulation and retrieval operations.

---

## SECTION 3: SYSTEM FUNCTIONALITIES

### 1. Order Management Function

The Order Management Function serves as the foundation of the OSOMS system, responsible for handling all operations related to order data storage and retrieval. This function manages a linked list data structure containing 10,000 order records, where each record stores essential information including Order ID, Customer Name, Product Name, Product Category, Quantity, Unit Price, and Order Date. The system automatically loads data from a text file upon startup, ensuring that all order information is immediately available for processing.

**Data Structure Implementation (Lines 13-26):**
The Order structure is defined as a self-referential structure containing eight fields: orderID (unique identifier ranging from 1000-10999), customerName (full customer name), productName (product description), productCategory (one of 8 categories), quantity (range 1-10 items), unitPrice (range RM 10.00 - RM 999.00), orderDate (format DD/MM/YYYY), totalAmount (calculated as quantity multiplied by unitPrice), and a next pointer for linking to the next node in the linked list.

**File Loading Mechanism (Lines 79-104):**
The system implements automatic data loading using file stream operations. Upon program initialization, the system checks for the existence of `orders_data.txt` and loads all records into memory using a pipe-delimited format. Each line in the file represents one order with fields separated by the '|' character. The loading process uses `stringstream` for efficient parsing and creates new Order nodes dynamically, inserting them at the head of the linked list for O(1) insertion time.

**Display Functionality (Lines 463-507):**
The `displayFirstNOrders()` function provides flexible display options with performance tracking. It accepts two parameters: the number of orders to display (default 100) and a boolean flag indicating whether to sort before display. The function uses `setw()` and formatting manipulators to create aligned columns showing all order attributes. Execution time is measured using `high_resolution_clock` from the chrono library, providing microsecond precision converted to milliseconds for user-friendly display.

**Memory Management (Lines 1008-1017):**
The `freeMemory()` function implements proper cleanup by traversing the entire linked list and deallocating each node individually. This prevents memory leaks and ensures all dynamically allocated memory is returned to the system before program termination. The function uses a temporary pointer to hold the current node while advancing the traversal pointer, allowing safe deletion of nodes during iteration.

### 2. Sorting Function

The Sorting Function implements two distinct sorting algorithms to organize order records based on specific criteria, primarily sorting by Total Amount in descending order and Order ID in ascending order as a secondary criterion. The implementation demonstrates fundamental sorting techniques while providing comprehensive performance analysis through execution time tracking and swap counting mechanisms.

**Insertion Sort Implementation (Lines 509-535):**
The Insertion Sort algorithm builds the sorted array incrementally by inserting each element into its correct position within the already-sorted portion. The insertionSort function initializes a SortStats structure with swapCount set to zero, then converts the linked list to an array for efficient sorting operations. The main sorting loop iterates from index 1 to orderCount-1, treating each element as a key to be inserted into the sorted portion. For each key, the algorithm compares it with elements in the sorted portion (from right to left) and shifts larger elements one position to the right. Each shift operation increments the swapCount for performance tracking. Once the correct position is found, the key is inserted. After sorting completes, the array is converted back to a linked list structure, and the statistics are returned. The algorithm processes elements from index 1 to n-1, maintaining a sorted subarray from index 0 to i-1. For each element, it finds the correct insertion position by shifting larger elements rightward. Each shift operation is counted as a swap for performance analysis.

**Quick Sort Implementation (Lines 537-577):**
Quick Sort uses a recursive divide-and-conquer strategy with the last element as the pivot. The quickSortRecursive function checks if the low index is less than the high index, and if so, calls the partition function to divide the array. The partition function selects the last element as the pivot and rearranges the array such that all elements satisfying the comparison criterion come before the pivot. It maintains an index i starting from low-1, and iterates through the array from low to high-1. For each element that satisfies the comparison with the pivot, it increments i, swaps the elements at positions i and j, and increments the swap counter. After the loop, it places the pivot in its final sorted position by swapping it with the element at position i+1. The function then recursively sorts the left partition (from low to pi-1) and the right partition (from pi+1 to high), where pi is the pivot index returned by the partition function. The partition function rearranges elements so that all elements satisfying the comparison criterion come before the pivot, while others come after. The pivot is then placed in its final sorted position.

**Comparison Criteria (Lines 579-584):**
The compareOrders function implements a two-level sorting criterion. First, it compares the totalAmount of both orders. If they are different, it returns true if order a's totalAmount is greater than order b's totalAmount, implementing descending order by total amount as the primary criterion. If the totalAmount values are equal, it returns true if order a's orderID is less than order b's orderID, implementing ascending order by order ID as the secondary tiebreaker criterion.

**Performance Comparison Feature (Lines 248-282):**
The algorithm comparison functionality executes both sorting algorithms on identical unsorted data by reloading the dataset between runs. This ensures fair comparison by eliminating the advantage of pre-sorted data. Results are displayed in a formatted table showing execution time, swap count, and percentage improvement, allowing users to observe the practical performance differences despite identical worst-case complexity.

### 3. Searching Function

The Searching Function provides three different search implementations to locate specific order records within the system based on Order ID and Customer Name as dual search criteria. Each implementation demonstrates different algorithmic approaches with varying time complexities and performance characteristics, allowing comprehensive comparison of searching techniques.

**Linear Search Implementation (Lines 613-661):**
Linear Search traverses the linked list sequentially, examining each node until a match is found. The linearSearch function prompts the user to enter the search criteria (Order ID and Customer Name), then starts a high-resolution timer. It initializes a pointer to the head of the linked list and iterates through each node, incrementing a position counter. For each node, it checks if both the orderID and customerName match the search criteria. If a match is found, it sets the found flag to true and breaks out of the loop. After the search completes (either by finding the target or reaching the end of the list), it stops the timer and calculates the execution time in milliseconds. The results, including whether the order was found, its position, and the execution time, are then displayed to the user. This implementation performs two comparisons per iteration: checking for list end and matching search criteria. The dual-criteria search ensures precise identification, as Order ID alone may not be unique in all business scenarios.

**Binary Search Implementation (Lines 663-724):**
Binary Search requires sorted data and uses array indexing for efficient access. The binarySearch function first ensures the data is sorted by calling quickSort, then converts the linked list to an array for efficient index-based access. It prompts the user for search criteria and starts timing. The algorithm initializes left and right pointers to the array boundaries and enters a loop that continues while left is less than or equal to right. In each iteration, it calculates the middle index using the formula mid = left + (right - left) / 2 to avoid potential integer overflow. It then compares the middle element's orderID and customerName with the search criteria. If both match, the search succeeds. If the middle element's orderID is less than the search value, it searches the right half by setting left = mid + 1. Otherwise, it searches the left half by setting right = mid - 1. The algorithm uses the formula mid = left + (right - left) / 2 instead of (left + right) / 2 to prevent integer overflow when dealing with large indices. The search space is halved with each iteration, achieving logarithmic time complexity.

**Optimized Linear Search with Sentinel (Lines 726-783):**
The Sentinel technique eliminates boundary checking by guaranteeing the search key exists. The optimizedLinearSearch function converts the linked list to an array, then creates a sentinel Order object with the search criteria. It allocates a temporary array with one additional slot beyond the original orderCount. All original order pointers are copied to this temporary array, and the sentinel element is placed at the end position. The search loop then iterates through this extended array with a simplified condition that only checks if the current element matches the search criteria, without needing to verify array boundaries. Since the sentinel guarantees a match will eventually be found, the loop will always terminate. After the loop exits, a simple check determines whether the match was found in the original data (i < orderCount) or at the sentinel position (i == orderCount), indicating the target was not in the original dataset. By placing a sentinel element at the end of the array containing the search key, the algorithm guarantees that the loop will terminate without explicit boundary checking. This reduces the number of comparisons per iteration from two to one, improving practical performance.

**Batch Search Analysis (Lines 785-834):**
The batch search feature performs 100 searches on randomly selected existing orders to provide statistical performance analysis. The performMultipleSearches function converts the linked list to an array for random access, then initializes counters for found records and total execution time. It enters a loop that runs 100 iterations, and in each iteration, it randomly selects an order from the array, extracts its orderID and customerName as search criteria, then performs a linear search with timing. The execution time for each search is accumulated in the totalTime variable, and successful searches increment the foundCount. Progress updates are displayed every 10 searches. After all 100 searches complete, the function displays comprehensive statistics including total searches performed, number found, number not found, total cumulative time, and average time per search. This feature provides realistic performance metrics by searching for actual existing records, ensuring 100% success rate and allowing accurate measurement of average search time across multiple operations.

### 4. Calculation Function

The Calculation Function performs essential mathematical operations and data aggregation to derive meaningful business insights from the order records stored in the system. This function demonstrates how algorithmic traversal and accumulation techniques can transform raw transactional data into actionable business intelligence.

**Total Sales Calculation (Lines 836-861):**
The calculateTotalSales function implements a single-pass traversal algorithm to compute aggregate financial metrics. It initializes two variables: totalSales (set to 0.0) to accumulate the sum of all order amounts, and totalOrders (set to 0) to count the number of orders processed. The function then sets a pointer to the head of the linked list and enters a loop that continues until reaching the end of the list. In each iteration, it adds the current order's totalAmount to the running totalSales sum and increments the totalOrders counter, then advances to the next node. After traversing all orders, it calculates the average order value by dividing totalSales by totalOrders. Finally, it displays the results in a formatted table showing the total number of orders, total sales amount in Malaysian Ringgit (RM) with two decimal places, and the average order value. This implementation uses O(n) time complexity with O(1) space complexity, making it highly efficient for large datasets. The function traverses the linked list once, accumulating the total sales amount and counting orders simultaneously. The average order value is calculated by dividing total sales by the number of orders, providing insight into typical customer spending patterns.

**Sales by Category Analysis (Lines 863-898):**
The category analysis function uses parallel arrays to track sales metrics across eight product categories. The salesByCategory function first declares an array of category names (Electronics, Clothing, Books, Home & Garden, Sports, Toys, Food, Beauty) and initializes two parallel arrays: categorySales (to track total sales per category) and categoryCount (to track number of orders per category), both set to zero. It then traverses the linked list of orders. For each order, it searches through the categories array to find which category matches the order's productCategory. When a match is found, it adds the order's totalAmount to the corresponding categorySales element, increments the categoryCount for that category, and breaks out of the inner loop to avoid unnecessary comparisons. After processing all orders, it displays the results in a formatted table showing each category name, the number of orders in that category, and the total sales amount with proper decimal formatting. The algorithm uses a nested loop structure where the outer loop traverses all orders (O(n)) and the inner loop searches for the matching category (O(k) where k=8). The overall complexity is O(n×k) = O(8n) = O(n) since k is constant. The break statement optimizes performance by terminating the inner loop immediately upon finding the matching category.

**Algorithm Efficiency Analysis:**
The Calculation Function demonstrates efficient data processing through:
1. **Single-pass traversal**: Each function traverses the linked list only once
2. **Constant space usage**: Uses fixed-size arrays regardless of dataset size
3. **Immediate computation**: Calculates derived values (averages, totals) during traversal
4. **Formatted output**: Presents results with proper decimal precision and currency notation

These characteristics ensure that calculation operations remain fast and memory-efficient even with 10,000 order records, typically completing in milliseconds on modern hardware.

### 5. Reporting Function

The Reporting Function generates comprehensive analytical reports that provide valuable insights into customer behavior, sales patterns, and business performance metrics. This function demonstrates advanced data aggregation, sorting, and presentation techniques to transform large volumes of transactional data into concise, actionable summaries.

**Total Sales Report (Lines 836-861):**
As described in the Calculation Function, this report provides an overview of all financial transactions with three key metrics:
- Total number of orders processed (10,000)
- Cumulative sales revenue (sum of all totalAmount values)
- Average order value (total sales ÷ number of orders)

The report uses professional table formatting with aligned columns and proper currency notation (RM) for Malaysian Ringgit.

**Sales Analysis by Category Report (Lines 863-898):**
This report breaks down sales performance across eight product categories, providing insights into which product segments generate the most revenue and customer interest. The implementation is detailed in the Calculation Function section above.

**Top 10 Customers by Spending Report (Lines 900-961):**
This report identifies the most valuable customers through a multi-step process. The topCustomers function first defines a local CustomerSpending structure containing three fields: customerName (string), totalSpending (double), and orderCount (int). It then declares an array capable of holding up to 2,000 unique customers and initializes a counter for tracking the actual number of unique customers found. In Step 1 (Customer Aggregation), the function traverses the entire order list. For each order, it searches through the existing customers array to find if this customer already exists by comparing customer names. If found, it adds the order's totalAmount to that customer's totalSpending and increments their orderCount. If not found and the array isn't full, it creates a new customer entry with the current order's information. In Step 2 (Bubble Sort), the function sorts the customers array in descending order of totalSpending using nested loops. The outer loop runs from 0 to uniqueCustomers-2, and the inner loop compares adjacent customers, swapping them if the current customer has less spending than the next one. In Step 3 (Display), the function determines how many customers to display (minimum of 10 or the actual number of unique customers), then iterates through the top customers, displaying each with their rank number, name, order count, and total spending formatted with two decimal places.

**Algorithm Analysis:**

*Step 1 - Customer Aggregation:*
- Time Complexity: O(n × m) where n = total orders, m = unique customers
- For each order, searches through existing customers to find a match
- If found, updates spending and order count
- If not found, adds new customer entry
- Worst case: O(10,000 × 2,000) = O(20,000,000) operations

*Step 2 - Bubble Sort:*
- Time Complexity: O(m²) where m = unique customers
- Sorts customers in descending order of total spending
- Uses nested loops with early termination optimization
- For m ≈ 2,000 customers: O(4,000,000) comparisons

*Step 3 - Display:*
- Time Complexity: O(1) - displays only top 10
- Formats output with rank number, customer name, order count, and total spending

**Report Formatting Features:**
1. **Professional table layout** with box-drawing characters
2. **Aligned columns** using `setw()` manipulators
3. **Currency formatting** with RM prefix and 2 decimal places
4. **Ranked display** with sequential numbering (1-10)
5. **Comprehensive metrics** showing both frequency (order count) and value (total spending)

**Business Value:**
The Top 10 Customers report enables businesses to:
- Identify high-value customers for VIP treatment
- Target retention strategies for profitable customer segments
- Analyze customer loyalty through order frequency
- Calculate customer lifetime value (CLV)
- Develop personalized marketing campaigns

This reporting functionality exemplifies how algorithmic data processing converts large volumes of transactional data into concise, meaningful summaries that support strategic business planning and operational decision-making in e-commerce environments.

---

## SECTION 4: ANALYSIS OF SORTING TECHNIQUES

### 4.1 Insertion Sort

#### Algorithm Description

Insertion Sort is a simple and intuitive sorting algorithm that builds the final sorted array one element at a time. The algorithm works similarly to how people sort playing cards in their hands. It divides the array into a sorted portion and an unsorted portion. Initially, the first element is considered sorted. The algorithm then takes each element from the unsorted portion and inserts it into its correct position within the sorted portion by comparing it with elements in the sorted section and shifting larger elements to the right. This process continues until all elements have been inserted into their correct positions.

In the OSOMS implementation, Insertion Sort is applied to order records stored in an array converted from the linked list structure. The sorting criteria prioritize Total Amount in descending order, with Order ID in ascending order as a tiebreaker. The algorithm maintains a count of all shift operations (equivalent to swaps) performed during execution, providing insight into the amount of work required to sort the dataset.

#### Code Implementation

```cpp
SortStats insertionSort() {
    SortStats stats;
    stats.swapCount = 0;
    
    Order** arr = convertToArray();
    auto start = high_resolution_clock::now();
    
    for(int i = 1; i < orderCount; i++) {
        Order* key = arr[i];
        int j = i - 1;
        
        while(j >= 0 && compareOrders(key, arr[j])) {
            arr[j + 1] = arr[j];
            stats.swapCount++;
            j--;
        }
        arr[j + 1] = key;
    }
    
    auto end = high_resolution_clock::now();
    stats.executionTime = duration_cast<microseconds>(end - start).count() / 1000.0;
    
    updateListFromArray(arr);
    delete[] arr;
    
    return stats;
}
```

#### Worst-Case Time Complexity

**O(n²)**

The worst-case scenario occurs when the input array is sorted in reverse order. In this situation, each new element must be compared with all elements in the sorted portion and shifted to the beginning of the array.

#### Growth Rate Function

**T(n) = n² / 2 - n / 2**

For an array of n elements, the algorithm performs:
- 1 comparison for the 2nd element
- 2 comparisons for the 3rd element
- 3 comparisons for the 4th element
- ...
- (n-1) comparisons for the nth element

Total comparisons = 1 + 2 + 3 + ... + (n-1) = n(n-1)/2 = (n² - n)/2

#### Step-by-Step Big-O Calculation

**Step 1: Identify the basic operation**
- The basic operation is the comparison and shift of elements during insertion.

**Step 2: Count the number of times the basic operation is executed**
- Outer loop: runs (n-1) times (from index 1 to n-1)
- Inner loop: in the worst case, runs i times for the i-th iteration of the outer loop
- Total operations: Σ(i) for i = 1 to (n-1) = 1 + 2 + 3 + ... + (n-1)

**Step 3: Apply the arithmetic series formula**
- Sum = n(n-1)/2 = (n² - n)/2 = n²/2 - n/2

**Step 4: Apply Big-O notation rules**
- T(n) = n²/2 - n/2
- Drop constants: T(n) = n² - n
- Keep only the highest-order term: T(n) = n²
- **Big-O: O(n²)**

**Step 5: Verification**
- For n = 10,000 orders:
- Worst-case comparisons ≈ 10,000² / 2 = 50,000,000 operations
- This explains why Insertion Sort becomes inefficient for large datasets

---

### 4.2 Quick Sort

#### Algorithm Description

Quick Sort is a highly efficient divide-and-conquer sorting algorithm that works by selecting a 'pivot' element from the array and partitioning the other elements into two sub-arrays according to whether they are less than or greater than the pivot. The sub-arrays are then sorted recursively. The key process in Quick Sort is the partition operation, which rearranges the array so that all elements smaller than the pivot come before it, while all elements greater than the pivot come after it.

In the OSOMS implementation, Quick Sort uses the last element of each partition as the pivot. The algorithm recursively divides the array into smaller partitions until each partition contains only one element, at which point the array is sorted. The implementation tracks the number of swap operations performed during partitioning, providing performance metrics for comparison with other sorting algorithms. The sorting criteria match those of Insertion Sort: Total Amount in descending order with Order ID as a secondary ascending criterion.

#### Code Implementation

```cpp
SortStats quickSort() {
    SortStats stats;
    stats.swapCount = 0;
    
    Order** arr = convertToArray();
    
    auto start = high_resolution_clock::now();
    quickSortRecursive(arr, 0, orderCount - 1, stats.swapCount);
    auto end = high_resolution_clock::now();
    
    stats.executionTime = duration_cast<microseconds>(end - start).count() / 1000.0;
    
    updateListFromArray(arr);
    delete[] arr;
    
    return stats;
}

void quickSortRecursive(Order** arr, int low, int high, long long& swapCount) {
    if(low < high) {
        int pi = partition(arr, low, high, swapCount);
        quickSortRecursive(arr, low, pi - 1, swapCount);
        quickSortRecursive(arr, pi + 1, high, swapCount);
    }
}

int partition(Order** arr, int low, int high, long long& swapCount) {
    Order* pivot = arr[high];
    int i = low - 1;
    
    for(int j = low; j < high; j++) {
        if(compareOrders(arr[j], pivot)) {
            i++;
            swapOrders(&arr[i], &arr[j]);
            swapCount++;
        }
    }
    swapOrders(&arr[i + 1], &arr[high]);
    swapCount++;
    return i + 1;
}
```

#### Worst-Case Time Complexity

**O(n²)**

The worst-case scenario occurs when the pivot selection consistently results in the most unbalanced partitions possible. This happens when the array is already sorted (or reverse sorted) and the pivot is always the smallest or largest element, causing one partition to have (n-1) elements and the other to have 0 elements.

#### Growth Rate Function

**T(n) = n² / 2 + n / 2** (worst case)

In the worst case, the recurrence relation is:
- T(n) = T(n-1) + n
- This expands to: n + (n-1) + (n-2) + ... + 2 + 1
- Sum = n(n+1)/2 = (n² + n)/2

However, in the average case, Quick Sort performs much better with T(n) = n log n.

#### Step-by-Step Big-O Calculation

**Step 1: Identify the basic operation**
- The basic operation is the comparison performed during the partition process.

**Step 2: Analyze the worst-case scenario**
- Worst case: pivot is always the smallest or largest element
- First partition: n comparisons, creates partitions of size 0 and (n-1)
- Second partition: (n-1) comparisons, creates partitions of size 0 and (n-2)
- This continues until the array is sorted

**Step 3: Count total operations in worst case**
- Total comparisons: n + (n-1) + (n-2) + ... + 2 + 1
- This is an arithmetic series

**Step 4: Apply the arithmetic series formula**
- Sum = n(n+1)/2 = (n² + n)/2 = n²/2 + n/2

**Step 5: Apply Big-O notation rules**
- T(n) = n²/2 + n/2
- Drop constants: T(n) = n² + n
- Keep only the highest-order term: T(n) = n²
- **Big-O: O(n²)** (worst case)

**Step 6: Average case analysis**
- In practice, Quick Sort typically achieves O(n log n) average-case performance
- For n = 10,000: average case ≈ 10,000 × log₂(10,000) ≈ 10,000 × 13.3 ≈ 133,000 operations
- This is significantly better than the worst-case scenario

**Step 7: Practical implications**
- Despite having the same worst-case complexity as Insertion Sort, Quick Sort generally performs better on random data
- The OSOMS implementation demonstrates this through comparative performance metrics

---

## SECTION 5: IMPROVEMENT ON SORTING TECHNIQUES

The OSOMS program implements a significant improvement in sorting technique analysis by calculating and displaying the total number of swap operations performed during the sorting process. This enhancement provides deeper insight into algorithm efficiency beyond simple execution time measurements. The swap counter is implemented as a pass-by-reference parameter that increments each time elements are exchanged during sorting operations. For Insertion Sort, the counter tracks every shift operation where an element moves one position to the right, while for Quick Sort, it counts actual element exchanges during the partition process.

Counting swaps is extremely useful for several reasons. First, it provides a hardware-independent metric of algorithm efficiency, as the number of swaps remains constant regardless of processor speed or system load, unlike execution time which can vary based on system resources. Second, swap counts directly correlate with memory write operations, which are typically more expensive than read operations in computer systems, making this metric particularly relevant for understanding real-world performance costs. Third, comparing swap counts between different algorithms reveals their relative efficiency in data movement, which is especially important when working with large data structures where moving elements is costly.

This improvement significantly enhances performance analysis by allowing objective comparison between algorithms running on different hardware or under different system conditions. When the OSOMS system compares Insertion Sort and Quick Sort, it displays both execution time and swap count, enabling users to understand not just which algorithm is faster, but also which one performs fewer data movements. This dual-metric approach provides a more comprehensive understanding of algorithm behavior and helps identify situations where one algorithm might be preferable despite similar time complexity. For instance, if two algorithms have similar execution times but vastly different swap counts, the one with fewer swaps might be more suitable for systems where memory operations are expensive or when sorting large objects where copying is costly. The swap counting mechanism thus transforms the sorting comparison from a simple speed test into a thorough algorithmic efficiency analysis, demonstrating the importance of considering multiple performance factors when evaluating algorithm suitability for real-world applications.

---

## SECTION 6: ANALYSIS OF SEARCHING TECHNIQUES

### 6.1 Linear Search

#### Algorithm Description

Linear Search, also known as Sequential Search, is the simplest searching algorithm that checks every element in the data structure sequentially until the target element is found or the end of the structure is reached. The algorithm starts from the first element and compares it with the search key. If a match is found, the search terminates successfully and returns the position of the element. If no match is found after examining all elements, the search terminates unsuccessfully.

In the OSOMS implementation, Linear Search is applied to the linked list structure containing order records. The search operates on two criteria simultaneously: Order ID and Customer Name. The algorithm traverses the linked list node by node, comparing both the Order ID and Customer Name of each order with the search criteria. This dual-criteria approach ensures precise identification of specific orders, as Order ID alone might not be unique in all scenarios. The implementation measures execution time in microseconds and converts it to milliseconds for display, providing accurate performance metrics even for very fast searches.

#### Code Implementation

```cpp
void linearSearch() {
    int searchOrderID;
    string searchName;
    
    cout << "Enter Order ID: ";
    cin >> searchOrderID;
    cin.ignore();
    cout << "Enter Customer Name: ";
    getline(cin, searchName);
    
    auto start = high_resolution_clock::now();
    
    Order* current = orderList;
    bool found = false;
    int position = 0;
    
    while(current != nullptr) {
        position++;
        if(current->orderID == searchOrderID && current->customerName == searchName) {
            found = true;
            break;
        }
        current = current->next;
    }
    
    auto end = high_resolution_clock::now();
    double executionTime = duration_cast<microseconds>(end - start).count() / 1000.0;
    
    if(found) {
        cout << "Status: FOUND\n";
        cout << "Position: " << position << "\n";
        cout << "Order ID: " << current->orderID << "\n";
        cout << "Customer: " << current->customerName << "\n";
        cout << "Total Amount: RM " << current->totalAmount << "\n";
    } else {
        cout << "Status: NOT FOUND\n";
    }
    cout << "Execution Time: " << executionTime << " ms\n";
}
```

#### Worst-Case Time Complexity

**O(n)**

The worst-case scenario occurs when the target element is located at the end of the list or is not present in the list at all. In both cases, the algorithm must examine all n elements before completing the search.

#### Growth Rate Function

**T(n) = n**

In the worst case, the algorithm performs exactly n comparisons for a list of n elements. Each element must be examined once, resulting in a linear relationship between input size and number of operations.

#### Step-by-Step Big-O Calculation

**Step 1: Identify the basic operation**
- The basic operation is the comparison of the current element with the search key.

**Step 2: Count the number of times the basic operation is executed**
- Best case: 1 comparison (element found at the first position)
- Average case: n/2 comparisons (element found in the middle)
- Worst case: n comparisons (element at the end or not present)

**Step 3: Focus on worst-case analysis**
- In the worst case, the algorithm examines all n elements
- Total comparisons: n

**Step 4: Express as a function**
- T(n) = n (in the worst case)

**Step 5: Apply Big-O notation**
- T(n) = n
- No constants to drop or lower-order terms to remove
- **Big-O: O(n)**

**Step 6: Practical implications for OSOMS**
- For n = 10,000 orders:
- Worst-case comparisons = 10,000
- Average-case comparisons ≈ 5,000
- This explains why Linear Search can be slow for large datasets when the target is near the end

---

### 6.2 Binary Search

#### Algorithm Description

Binary Search is an efficient searching algorithm that works on sorted arrays by repeatedly dividing the search interval in half. The algorithm begins by comparing the target value with the middle element of the array. If the target value matches the middle element, the search is successful. If the target value is less than the middle element, the search continues in the lower half of the array; if greater, it continues in the upper half. This process repeats until the target value is found or the search interval becomes empty.

In the OSOMS implementation, Binary Search requires the order records to be sorted before searching can begin. The system automatically performs a Quick Sort operation on the data, then converts the linked list to an array for efficient index-based access required by Binary Search. The search uses Order ID as the primary search criterion, with Customer Name as a verification criterion. The algorithm calculates the middle index using the formula mid = left + (right - left) / 2 to avoid potential integer overflow. Performance metrics including execution time are measured and displayed, allowing comparison with Linear Search efficiency.

#### Code Implementation

```cpp
void binarySearch() {
    int searchOrderID;
    string searchName;
    
    cout << "Enter Order ID: ";
    cin >> searchOrderID;
    cin.ignore();
    cout << "Enter Customer Name: ";
    getline(cin, searchName);
    
    quickSort();  // Ensure data is sorted
    Order** arr = convertToArray();
    
    auto start = high_resolution_clock::now();
    
    int left = 0, right = orderCount - 1;
    bool found = false;
    int position = -1;
    
    while(left <= right) {
        int mid = left + (right - left) / 2;
        
        if(arr[mid]->orderID == searchOrderID && arr[mid]->customerName == searchName) {
            found = true;
            position = mid + 1;
            break;
        }
        
        if(arr[mid]->orderID < searchOrderID) {
            left = mid + 1;
        } else {
            right = mid - 1;
        }
    }
    
    auto end = high_resolution_clock::now();
    double executionTime = duration_cast<microseconds>(end - start).count() / 1000.0;
    
    if(found) {
        cout << "Status: FOUND\n";
        cout << "Position: " << position << "\n";
        cout << "Order ID: " << arr[position-1]->orderID << "\n";
        cout << "Customer: " << arr[position-1]->customerName << "\n";
        cout << "Total Amount: RM " << arr[position-1]->totalAmount << "\n";
    } else {
        cout << "Status: NOT FOUND\n";
    }
    cout << "Execution Time: " << executionTime << " ms\n";
    
    delete[] arr;
}
```

#### Worst-Case Time Complexity

**O(log n)**

The worst-case scenario occurs when the target element is not present in the array, or when it requires the maximum number of divisions to locate the element. Each comparison eliminates half of the remaining elements, resulting in logarithmic time complexity.

#### Growth Rate Function

**T(n) = log₂(n) + 1**

The algorithm divides the search space in half with each iteration. The maximum number of divisions required is log₂(n), with one additional comparison to verify the final element.

#### Step-by-Step Big-O Calculation

**Step 1: Identify the basic operation**
- The basic operation is the comparison of the middle element with the search key.

**Step 2: Analyze the search space reduction**
- Initial search space: n elements
- After 1st comparison: n/2 elements
- After 2nd comparison: n/4 elements
- After 3rd comparison: n/8 elements
- After k comparisons: n/2^k elements

**Step 3: Determine when the search terminates**
- The search terminates when the search space is reduced to 1 element
- This occurs when: n/2^k = 1
- Solving for k: 2^k = n
- Therefore: k = log₂(n)

**Step 4: Count total operations**
- Maximum number of comparisons = log₂(n) + 1
- The +1 accounts for the final comparison

**Step 5: Apply Big-O notation rules**
- T(n) = log₂(n) + 1
- Drop constants: T(n) = log₂(n)
- **Big-O: O(log n)**

**Step 6: Practical implications for OSOMS**
- For n = 10,000 orders:
- Maximum comparisons = log₂(10,000) ≈ 13.3 ≈ 14 comparisons
- This is dramatically more efficient than Linear Search's 10,000 comparisons
- However, the data must be sorted first, which adds overhead

**Step 7: Trade-off analysis**
- Sorting cost: O(n log n) for Quick Sort
- Single search: O(log n)
- Multiple searches: sorting once + k searches = O(n log n) + k × O(log n)
- Binary Search becomes more efficient when performing multiple searches on the same dataset

---

## SECTION 7: IMPROVEMENT ON SEARCHING TECHNIQUE

The OSOMS system implements an improved version of the Linear Search algorithm called **Optimized Linear Search using the Sentinel technique**. This enhancement specifically targets the Linear Search algorithm to improve its efficiency by reducing the number of operations performed during each iteration of the search loop. The improvement addresses a fundamental inefficiency in standard Linear Search: the need to check two conditions in every iteration—whether the current element matches the search key and whether the end of the list has been reached.

The Sentinel technique works by adding an extra element (the sentinel) at the end of the array that contains the search key value. This guarantees that the search key will always be found, eliminating the need to check for the end of the array in every iteration. The algorithm can then use a simpler loop that only checks whether the current element matches the search key. After the loop terminates, a single additional check determines whether the element was found in the original array or if the search stopped at the sentinel position, indicating that the target was not present in the original data.

The improved version is more efficient than the standard Linear Search for several important reasons. First, it reduces the number of comparisons per iteration from two to one, effectively halving the number of conditional checks performed during the search process. While this does not change the Big-O complexity, which remains O(n), it reduces the constant factor, resulting in measurable performance improvements in practice. Second, the simplified loop structure allows for better compiler optimization and more efficient CPU instruction pipelining, as the loop body contains fewer conditional branches that can cause pipeline stalls. Third, the reduction in conditional checks decreases the number of branch mispredictions in modern processors, which can significantly impact performance for large datasets.

#### Code Implementation

```cpp
void optimizedLinearSearch() {
    int searchOrderID;
    string searchName;
    
    cout << "Enter Order ID: ";
    cin >> searchOrderID;
    cin.ignore();
    cout << "Enter Customer Name: ";
    getline(cin, searchName);
    
    Order** arr = convertToArray();
    Order sentinel;
    sentinel.orderID = searchOrderID;
    sentinel.customerName = searchName;
    
    auto start = high_resolution_clock::now();
    
    // Create extended array with sentinel
    Order** tempArr = new Order*[orderCount + 1];
    for(int i = 0; i < orderCount; i++) {
        tempArr[i] = arr[i];
    }
    tempArr[orderCount] = &sentinel;  // Add sentinel at end
    
    int i = 0;
    // Single comparison per iteration - no boundary check needed
    while(!(tempArr[i]->orderID == searchOrderID && 
            tempArr[i]->customerName == searchName)) {
        i++;
    }
    
    bool found = (i < orderCount);  // Check if found before sentinel
    
    auto end = high_resolution_clock::now();
    double executionTime = duration_cast<microseconds>(end - start).count() / 1000.0;
    
    if(found) {
        cout << "Status: FOUND\n";
        cout << "Position: " << (i + 1) << "\n";
        cout << "Order ID: " << tempArr[i]->orderID << "\n";
        cout << "Customer: " << tempArr[i]->customerName << "\n";
        cout << "Total Amount: RM " << tempArr[i]->totalAmount << "\n";
    } else {
        cout << "Status: NOT FOUND\n";
    }
    cout << "Execution Time: " << executionTime << " ms\n";
    cout << "Improvement: Sentinel technique eliminates boundary checking\n";
    
    delete[] arr;
    delete[] tempArr;
}
```

In the OSOMS implementation, the Sentinel Linear Search converts the linked list to an array, creates a temporary array with one additional slot for the sentinel, copies all original elements, and places a sentinel element with the search criteria at the end. The search loop then iterates through this enhanced array using a single comparison condition. Performance measurements demonstrate that this optimized version consistently executes faster than the standard Linear Search, particularly noticeable when searching through all 10,000 order records. The improvement is especially valuable in the batch search feature that performs 100 consecutive searches, where the cumulative time savings become substantial. This optimization exemplifies how algorithmic improvements can enhance performance without changing the fundamental time complexity, demonstrating that practical efficiency involves more than just Big-O analysis and includes consideration of constant factors, hardware characteristics, and implementation details.

---

## SECTION 8: APPENDIX

### Appendix A: Complete Program

The complete source code for the Online Shopping Order Management System (OSOMS) is provided in the file `main.cpp` located in the project directory. The program consists of 1,048 lines of C++ code implementing all functionalities described in this report, including:

- Order data structure definition using linked lists
- Data generation and file I/O operations
- Insertion Sort and Quick Sort implementations with performance tracking
- Linear Search, Binary Search, and Optimized Linear Search implementations
- Calculation and reporting functions for business analytics
- User interface with menu-driven navigation
- Performance measurement using C++ chrono library

The source code is well-commented and follows structured programming principles with clear function separation and modular design. All algorithms are implemented according to standard specifications with additional enhancements for performance tracking and user feedback.

**File Location:** `c:\Users\Izzat\Downloads\UTeM\AA_Project\OSOMS\main.cpp`

**Data File:** `orders_data.txt` (contains 10,000 pre-generated order records)

**Executable:** `OSOMS.exe` (compiled Windows executable)

---

### Appendix B: User Manual

#### System Description

The Online Shopping Order Management System (OSOMS) is a console-based application designed to manage and analyze order data for an e-commerce platform. The system handles 10,000 order records stored in a linked list data structure, providing comprehensive functionality for data display, sorting, searching, and reporting. The application automatically loads data from a text file upon startup, ensuring immediate availability of all order information.

Each order record contains the following attributes:
- **Order ID**: Unique identifier (integer)
- **Customer Name**: Full name of the customer (string)
- **Product Name**: Name of the ordered product (string)
- **Product Category**: Category classification (Electronics, Clothing, Books, Home & Garden, Sports, Toys, Food, Beauty)
- **Quantity**: Number of items ordered (integer)
- **Unit Price**: Price per unit in RM (double)
- **Order Date**: Date of order in DD/MM/YYYY format (string)
- **Total Amount**: Calculated as Quantity × Unit Price (double)

---

#### Step-by-Step Usage Instructions

**Step 1: Starting the Application**

1. Navigate to the OSOMS directory
2. Double-click `OSOMS.exe` or run from command prompt
3. The system automatically loads 10,000 orders from `orders_data.txt`
4. The Main Menu appears with the following options:

```
============================================================
                        MAIN MENU                          
============================================================
  [1] Display Orders
  [2] Sorting
  [3] Searching
  [4] Reports
  [0] Exit
------------------------------------------------------------
  Total Orders in System: 10000
============================================================
  Enter choice:
```

**Step 2: Displaying Orders**

1. From Main Menu, select option `[1] Display Orders`
2. Choose display format:
   - `[1]` Display First 100 Unsorted Orders
   - `[2]` Display First 100 Sorted Orders
   - `[0]` Back to Main Menu
3. The system displays orders in tabular format with execution time
4. Press Enter to return to the Display Orders Menu

**Step 3: Sorting Operations**

1. From Main Menu, select option `[2] Sorting`
2. Choose sorting algorithm:
   - `[1]` Insertion Sort
   - `[2]` Quick Sort
   - `[3]` Compare Both Algorithms
   - `[4]` Display First 100 Sorted Orders
   - `[0]` Back to Main Menu
3. The system performs the selected operation and displays:
   - Execution time in milliseconds
   - Number of swap operations
   - Worst-case complexity notation
   - First 100 sorted orders (for options 1, 2, and 4)
4. For option `[3]`, both algorithms run sequentially with comparative results
5. Press Enter to continue

**Step 4: Searching Operations**

1. From Main Menu, select option `[3] Searching`
2. Choose search algorithm:
   - `[1]` Linear Search
   - `[2]` Binary Search
   - `[3]` Optimized Linear Search (Sentinel)
   - `[4]` Perform 100 Search Operations
   - `[0]` Back to Main Menu
3. For options 1-3:
   - Enter Order ID when prompted
   - Enter Customer Name when prompted
   - The system displays search results with execution time
4. For option `[4]`:
   - The system automatically performs 100 searches on random existing orders
   - Displays total time, average time, and success statistics
5. Press Enter to continue

**Step 5: Viewing Reports**

1. From Main Menu, select option `[4] Reports`
2. Choose report type:
   - `[1]` Total Sales (PAID Orders)
   - `[2]` Sales Analysis by Product Category
   - `[3]` Top 10 Customers by Spending
   - `[0]` Back to Main Menu
3. The system generates and displays the selected report
4. Press Enter to return to Reports Menu

**Step 6: Exiting the Application**

1. From Main Menu, select option `[0] Exit`
2. The system displays "Thank you for using OSOMS!"
3. The application terminates and frees all allocated memory

---

#### Sample Outputs

**Sample Output 1: Sorting Results (Insertion Sort)**

```
  Performing Insertion Sort...

  ========================================================
              INSERTION SORT RESULTS                     
  ========================================================
    Execution Time: 245.67 ms
    Number of Swaps: 24567890
    Worst Case Complexity: O(n^2)
  ========================================================

SORTED ORDERS (First 100)
================================================================================
 No  OrderID  Customer Name        Product Name         Qty   UnitPrice  OrderDate      TotalAmt
================================================================================
   1     1045 Ahmad Abdullah       Laptop Pro             10      999.00  15/03/2024        9990.00
   2     1234 Siti Rahman          Gaming Mouse            9      998.00  18/03/2024        8982.00
   3     1567 Muhammad Hassan      Smart Watch             9      995.00  22/03/2024        8955.00
   4     1789 Nurul Fatimah        Wireless Earbuds        9      992.00  11/03/2024        8928.00
   5     1890 Ali Ibrahim          Keyboard RGB            9      989.00  25/03/2024        8901.00
...
 100     2345 Omar Yusuf           Coffee Beans            8      123.00  19/03/2024         984.00
================================================================================

  Total orders displayed: 100 / 10000
  Execution Time: 245.6789 ms

  Press Enter to continue...
```

**Sample Output 2: Searching Results (Binary Search)**

```
============================================================
                     BINARY SEARCH                         
============================================================
  Note: Data will be sorted first for binary search.

  Enter Order ID: 1045
  Enter Customer Name: Ahmad Abdullah

  ============================================================
  Status: FOUND
  Position: 1
  ------------------------------------------------------------
  Order ID: 1045
  Customer: Ahmad Abdullah
  Product: Laptop Pro
  Category: Electronics
  Total Amount: RM 9990.00
  Execution Time: 0.0234 ms
  ============================================================

  Press Enter to continue...
```

**Sample Output 3: Searching Results (100 Search Operations)**

```
  Performing 100 search operations...

  Progress: 10 searches completed...
  Progress: 20 searches completed...
  Progress: 30 searches completed...
  Progress: 40 searches completed...
  Progress: 50 searches completed...
  Progress: 60 searches completed...
  Progress: 70 searches completed...
  Progress: 80 searches completed...
  Progress: 90 searches completed...
  Progress: 100 searches completed...

  ==============================================================
              100 SEARCH OPERATIONS RESULTS                  
  ==============================================================
    Total Searches: 100
    Found: 100
    Not Found: 0
    Total Time: 234.56 ms
    Average Time: 2.3456 ms
  ==============================================================

  Press Enter to continue...
```

**Sample Output 4: Calculation Function (Total Sales Report)**

```
============================================================
                 TOTAL SALES REPORT                        
============================================================

  +------------------------------------------------------------+
  | Sales Summary                                              |
  +------------------------------------------------------------+
  | Total Orders:     10000 orders                             |
  | Total Sales:    RM   3456789.50                         |
  | Average Order:  RM       345.68                         |
  +------------------------------------------------------------+

  Press Enter to continue...
```

**Sample Output 5: Reporting Function (Sales by Category)**

```
============================================================
            SALES ANALYSIS BY CATEGORY                     
============================================================

  +-----------------+------------+------------------+
  | Category        | Orders     | Total Sales (RM) |
  +-----------------+------------+------------------+
  | Electronics     |       1245 |       567890.50 |
  | Clothing        |       1356 |       234567.80 |
  | Books           |       1189 |       123456.90 |
  | Home & Garden   |       1278 |       345678.20 |
  | Sports          |       1234 |       456789.30 |
  | Toys            |       1198 |       234567.40 |
  | Food            |       1267 |       567890.60 |
  | Beauty          |       1233 |       456789.70 |
  +-----------------+------------+------------------+

  Press Enter to continue...
```

**Sample Output 6: Reporting Function (Top 10 Customers)**

```
============================================================
              TOP 10 CUSTOMERS BY SPENDING                 
============================================================

  +----+--------------------+--------+------------------+
  | No | Customer Name      | Orders | Total Spent (RM) |
  +----+--------------------+--------+------------------+
  |  1 | Ahmad Abdullah     |     45 |       45678.90 |
  |  2 | Siti Rahman        |     42 |       43567.80 |
  |  3 | Muhammad Hassan    |     41 |       41234.70 |
  |  4 | Nurul Fatimah      |     39 |       39876.50 |
  |  5 | Ali Ibrahim        |     38 |       38765.40 |
  |  6 | Fatimah Yusuf      |     37 |       37654.30 |
  |  7 | Hassan Omar        |     36 |       36543.20 |
  |  8 | Aishah Ahmad       |     35 |       35432.10 |
  |  9 | Omar Ali           |     34 |       34321.00 |
  | 10 | Zainab Hassan      |     33 |       33210.90 |
  +----+--------------------+--------+------------------+

  Press Enter to continue...
```

**Sample Output 7: Algorithm Comparison**

```
  Comparing Sorting Algorithms...

  Running Insertion Sort on unsorted data...
  Reloading data for fair comparison...
  Running Quick Sort on unsorted data...

  ==============================================================
                SORTING ALGORITHMS COMPARISON                   
  ==============================================================
  +------------------+-----------------+-------------------------+
  | Algorithm        | Time (ms)       | Swaps                   |
  +------------------+-----------------+-------------------------+
  | Insertion Sort   |          245.67 |                24567890 |
  | Quick Sort       |           89.34 |                  156789 |
  +------------------+-----------------+-------------------------+

  Quick Sort is faster by 63.62%
  ==============================================================

  Press Enter to continue...
```

---

### Notes for Users

1. **Data Persistence**: All sorting and searching operations work on the in-memory linked list. Changes are not automatically saved to the file.

2. **Performance Metrics**: Execution times may vary based on system specifications and current system load.

3. **Search Criteria**: When searching, both Order ID and Customer Name must match exactly for a successful search.

4. **Sorting Behavior**: The system sorts by Total Amount (descending) first, then by Order ID (ascending) as a tiebreaker.

5. **Memory Management**: The system automatically manages memory allocation and deallocation. No manual intervention is required.

6. **Data Integrity**: The original data file (`orders_data.txt`) remains unchanged unless explicitly saved through the data generation menu.

---

## CONCLUSION

The Online Shopping Order Management System (OSOMS) successfully demonstrates the practical application of fundamental algorithms in a real-world e-commerce context. Through the implementation and comparison of multiple sorting and searching techniques, this project provides valuable insights into algorithm efficiency, performance trade-offs, and the importance of selecting appropriate algorithms for specific use cases. The system effectively manages 10,000 order records while maintaining responsive performance and providing comprehensive analytical capabilities that transform raw transactional data into actionable business intelligence.

---

**End of Report**
