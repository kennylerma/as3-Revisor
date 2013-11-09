as3-Revisor
===========

Small ActionScript 3.0 framework for unit testing inspired by QUnit.

####Example
The following example runs two test cases with a few tests in them, write the result to the output and clears result for the futher usage.
```as3
Revisor.test("First example test case", function():void {
	Revisor.equal(2 + 2, 4, "Equal example. Passed.");
	Revisor.notEqual(2 + 2, 5, "Non equal example. Passed.");
	Revisor.strictEqual(5, "5", "Strict equal example. Failed.");
	Revisor.notStrictEqual(5, 5, "Not strict equal example. Failed.");
	Revisor.ok(true, "OK example. Passed.");
});
Revisor.test("Second example test case", function():void {
	Revisor.equal(2 + 2, 4);
});
trace(Revisor.result);
Revisor.clear();
```
Output:
```
> Revisor test results:
1) First example test case
    1) Passed.
    2) Passed.
!   3) Failed.
        Message: Strict equal example. Failed.
        Expected: 5
        Result:   "5"
!   4) Failed.
        Message: Not strict equal example. Failed.
        Expected: not 5
        Result:   5
    5) Passed.
    Passed: 3/5
    Failed: 2/5
    
2) Second example test case
    1) Passed.
    Passed: 1/1

Passed: 4/6
Failed: 2/6
```
