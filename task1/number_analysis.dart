// finds the max value by comparing each number manually
int findMax(List<int> numbers) {
  int max = numbers[0];
  for (int num in numbers) {
    if (num > max) {
      max = num;
    }
  }
  return max;
}

// finds the min value by comparing each number manually
int findMin(List<int> numbers) {
  int min = numbers[0];
  for (int num in numbers) {
    if (num < min) {
      min = num;
    }
  }
  return min;
}

// adds up all numbers in the list using an accumulator
int calculateSum(List<int> numbers) {
  int sum = 0;
  for (int num in numbers) {
    sum += num;
  }
  return sum;
}

// calculates the average by reusing the sum function
double calculateAverage(List<int> numbers) {
  int total = calculateSum(numbers);
  return total / numbers.length;
}

void main() {
  // list of integers including positive and negative ones
  final numbers = <int>[34, -7, 89, 12, -45, 67, 3, 100, -2, 55];

  int maxVal = findMax(numbers);
  int minVal = findMin(numbers);
  int sumVal = calculateSum(numbers);
  double avgVal = calculateAverage(numbers);

  print('number analysis results');
  print('=======================');
  print('numbers: $numbers');
  print('maximum value: $maxVal');
  print('minimum value: $minVal');
  print('sum: $sumVal');
  print('average: $avgVal');
}

/* conceptual questions
   
   q1. list<int> only accepts integers while list<dynamic> lets you mix types. 
   using list<int> is better for safety and performance.
   
   q2. initializing to the first element ensures the max is actually from 
   the list. if you start at 0 and all numbers are negative, 0 would be 
   the wrong answer.
   
   q3. this is code reuse or the dry principle. it makes the code 
   cleaner and easier to maintain.
   
   q4. for-in is cleaner for just reading items. traditional for loops 
   are better if you need to know the index or position.
   
   q5. an empty list would cause an error on numbers[0]. you could add 
   an if-statement to check if the list is empty before starting.
*/