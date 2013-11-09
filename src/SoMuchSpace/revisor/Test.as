package SoMuchSpace.revisor 
{
	/**
	 * ...
	 * @author SoMuchSpace
	 */
	public class Test extends Object
	{
		private var _message:String = "";
		private var _expected:*;
		private var _actual:*;
		private var _passed:Boolean = false;
		private var _not:Boolean = false;
		
		public function Test(expected:*, actual:*, message:String, passed:Boolean, not:Boolean) 
		{
			_expected = expected;
			_actual = actual;
			_message = message;
			_passed = passed;
			_not = not;
		}
		
		public function get message():String 
		{
			return _message;
		}
		
		public function get expected():* 
		{
			return _expected;
		}
		
		public function get actual():* 
		{
			return _actual;
		}
		
		public function get passed():Boolean 
		{
			return _passed;
		}
		
		public function get not():Boolean 
		{
			return _not;
		}
		
	}

}