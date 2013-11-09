package SoMuchSpace.revisor 
{
	/**
	 * The Revisor class provides basic functionality for unit testing.
	 * @author SoMuchSpace
	 */
	public class Revisor 
	{
		static private var _result:TestResult = new TestResult();
		static private var _currentTestCase:TestCase;
		
		static public function test(testCaseName:String, testFunction:Function):void
		{
			createNewTestCase(_result, testCaseName);
			testFunction.call();
			_currentTestCase = null;
		}
		
		static private function createNewTestCase(result:TestResult, testCaseName:String):void 
		{
			_currentTestCase = new TestCase(testCaseName);
			result.testCaseList.push(_currentTestCase);
		}
		
		static private function clear():void
		{
			_result = new TestResult();
		}
		
		static public function equal(value1:*, value2:*, message:String=""):Boolean 
		{
			var testResult:Boolean = value1 == value2;
			if (_currentTestCase)
			{
				createNewTest(_currentTestCase, value1, value2, message, testResult);
			}
			return testResult;
		}
		
		static private function createNewTest(currentTestCase:TestCase, value1:*, value2:*, message:String, testResult:Boolean, not:Boolean = false):void 
		{
			currentTestCase.testList.push(new Test(value1, value2, message, testResult, not));
			if (testResult)
			{
				_result._testsPassed++;
				_currentTestCase._testsPassed++;
			}
			else
			{
				_result._testsFailed++;
			}
		}
		
		static public function notEqual(value1:*, value2:*, message:String=""):Boolean 
		{
			var testResult:Boolean =  value1 != value2;
			if (_currentTestCase)
			{
				createNewTest(_currentTestCase, value1, value2, message, testResult, true);
			}
			return testResult;
		}
		
		static public function notStrictEqual(value1:*, value2:*, message:String=""):Boolean 
		{
			var testResult:Boolean = value1 !== value2;
			if (_currentTestCase)
			{
				createNewTest(_currentTestCase, value1, value2, message, testResult, true);
			}
			return testResult;
		}
		
		static public function ok(value:*, message:String=""):Boolean 
		{
			var testResult:Boolean = Boolean(value);
			if (_currentTestCase)
			{
				createNewTest(_currentTestCase, true, value, message, testResult);
			}
			return testResult;
		}
		
		static public function strictEqual(value1:*, value2:*, message:String=""):Boolean 
		{
			var testResult:Boolean = value1 === value2;
			if (_currentTestCase)
			{
				createNewTest(_currentTestCase, value1, value2, message, testResult);
			}
			return testResult;
		}
		
		static public function get result():TestResult 
		{
			return _result;
		}
		
	}

}