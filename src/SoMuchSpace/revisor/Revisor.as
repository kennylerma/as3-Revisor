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
		
		static public function clear():void
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
		
		static public function sorted(data:*, compareFunction:Function, message:String = ""):Boolean
		{
			checkData(data);
			var testResult:Boolean = true;
			for (var i:int = 1; i < data.length; i++) 
			{
				if (compareFunction.call(null, data[i - 1], data[i]) == 1)
				{
					testResult = false;
					break;
				}
			}
			if (_currentTestCase)
			{
				createNewTest(_currentTestCase, "Sorted array or vector", data, message, testResult);
			}
			return testResult;
		}
		
		static private function checkData(data:*):void 
		{
			var test:Boolean = data is Array || data is Vector.<*> || 
												data is Vector.<Number> || 
												data is Vector.<int> || 
												data is Vector.<uint>;
			if (!test)
			{
				throw new ArgumentError("Data is not Array or Vector");
			}
		}
		
		static public function get result():TestResult 
		{
			return _result;
		}
		
	}

}