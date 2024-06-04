import 'package:flutter/material.dart';

void main() {
  SubClass().someMethod();  // Output: SubClass someMethod
  SubClass().nonExistentMethod();  // Output: SubClass nonExistentMethod
}

class JobsOverride {
  const JobsOverride();
}

const jobsOverride = JobsOverride();

class SuperClass {
  void someMethod() {
    debugPrint("SuperClass someMethod");
  }
}

class SubClass extends SuperClass {
  @jobsOverride
  void someMethod() {
    debugPrint("SubClass someMethod");
  }

  // This should ideally cause an error, but Dart does not enforce it at compile time
  @jobsOverride
  void nonExistentMethod() {
    debugPrint("SubClass nonExistentMethod");
  }
}

