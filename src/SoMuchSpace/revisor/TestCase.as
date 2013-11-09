package SoMuchSpace.revisor 
{
	/**
	 * ...
	 * @author SoMuchSpace
	 */
	public class TestCase extends Object
	{
		public const testList:Array/*of Test*/ = [];
		
		internal var _name:String = "";
		internal var _testsPassed:int = 0;
		
		public function TestCase(name:String) 
		{
			this._name = name;
		}
		
		public function get name():String 
		{
			return _name;
		}
		
		public function get testsPassed():int 
		{
			return _testsPassed;
		}
		
		public function get testsFailed():int
		{
			return testsTotal - testsPassed;
		}
		
		public function get testsTotal():int
		{
			return testList.length;
		}
		
	}

}