import 'dart:async';

class Calculator {
  final String name;
  Calculator(this.name);

  double add(double a, double b) => a + b;
  double subtract(double a, double b) => a - b;
  double multiply(double a, double b) => a * b;
  
  double divide(double a, double b) {
    if (b == 0) {
      throw ArgumentError('cannot divide by zero.');
    }
    return a / b;
  }

  // simulates a network delay using 1.5 seconds
  Future<double> computeAsync(double a, double b, String op) async {
    double result;
    switch (op) {
      case 'add':
        result = add(a, b);
        break;
      case 'subtract':
        result = subtract(a, b);
        break;
      case 'multiply':
        result = multiply(a, b);
        break;
      case 'divide':
        result = divide(a, b);
        break;
      default:
        throw ArgumentError('unknown operation: $op');
    }
    
    // wait for 1.5 seconds exactly
    await Future.delayed(Duration(seconds: 1, milliseconds: 500));
    return result;
  }

  // calls the async function and catches errors
  Future<void> displayResult(double a, double b, String op) async {
    try {
      final result = await computeAsync(a, b, op);
      print('$op($a, $b) = $result');
    } catch (e) {
      print('error: $e');
    }
  }
}

Future<void> main() async {
  final calc = Calculator('mycalculator');
  print('--- ${calc.name} ---');

  // testing different cases including division by zero
  await calc.displayResult(10, 4, 'add');
  await calc.displayResult(10, 4, 'subtract');
  await calc.displayResult(10, 4, 'multiply');
  await calc.displayResult(10, 4, 'divide');
  await calc.displayResult(15, 3, 'divide');
  await calc.displayResult(10, 0, 'divide');

  print('all calculations complete.');
}
/* conceptual questions
   
   q6. explain the difference between synchronous and asynchronous functions in dart.
    why is divide() synchronous while computeasync() is asynchronous?
   ANSW: sync functions run line by line and wait. async functions return a future so the app stays responsive. divide() is fast so it is sync, but computeasync simulates a slow network call.
   
   q7. what is the purpose of the await keyword? what would happen if you removed
    it from displayresult()?ANSW: the await keyword tells the program to pause
     and wait for the future to finish before moving on. if you forget it, the program will print 'instance of future' instead of the actual number.
   
   q8. how does the try-catch block contribute to the program's robustness?ANSW: the 
   try-catch block catches the divide-by-zero error so the program keeps running. if
    you removed it, the program would crash as soon as you tried to divide by zero.
   
   q9. why is it better to throw an argumenterror in divide() rather than just returning 0 when a user divides by zero?
   ANSW: throwing an error lets the caller know exactly what went wrong. it is better than just returning 0 because 0 could actually be a real answer in some math problems.
   
   q10. why does the main() function need the async keyword?
   ANSW: the async keyword on main lets you use the await keyword inside it. without it, you could not wait for the async calculator results to finish in order.
*/