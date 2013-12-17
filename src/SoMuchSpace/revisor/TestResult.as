package SoMuchSpace.revisor 
{
	/**
	 * ...
	 * @author SoMuchSpace
	 */
	public class TestResult extends Object
	{
		public const testCaseList:Array = [];
		
		internal var _testsPassed:int = 0;
		internal var _testsFailed:int = 0;
		
		public function TestResult() 
		{
			
		}
		
		public function get testsPassed():int 
		{
			return _testsPassed;
		}
		
		public function get testsFailed():int 
		{
			return _testsFailed;
		}
		
		public function get testsTotal():int
		{
			return testsPassed+testsFailed;
		}
		
		public function toString():String
		{
			var string:String = "";
			string += "> Revisor test results:\n";
			for (var i:int = 0; i < testCaseList.length; i++) 
			{
				var testCase:TestCase = testCaseList[i];
				string += (i+1)+") "+testCase.name + "\n";
				for (var j:int = 0; j < testCase.testList.length; j++) 
				{
					var test:Test = testCase.testList[j];
					if (!test.passed)
					{
						string += "!   " + (j + 1) + ") Failed.\n";
						if (test.message)
						{
							string += "        Message: " + test.message + "\n";
						}
						string += "        Expected: ";
						if (test.not)
						{
							string += "not ";
						}
						string += printValue(test.expected) + "\n";
						string += "        Result:   " + printValue(test.actual)+"\n\n";
					}
				}
				if (testCase.testsFailed)
				{
					string += "    Failed: " + testCase.testsFailed + "/" + testCase.testsTotal+"\n";
				}
			}
			string += "Passed: " + testsPassed + "/" + testsTotal+"\n";
			if (testsFailed)
			{
				string += "Failed: " + testsFailed + "/" + testsTotal+"\n";
			}
			return string;
		}
		
		private function printValue(expected:*):String 
		{
			var string:String = expected;
			if (expected is String)
			{
				string = "\"" + string + "\"";
			}
			return string;
		}
		
	}

}