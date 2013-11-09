package SoMuchSpace.revisor 
{
	/**
	 * The Revisor class provides basic functionality for unit testing.
	 * @author SoMuchSpace
	 */
	public class Revisor 
	{
		
		static public function equal(value1:*, value2:*, message:String=""):Boolean 
		{
			return value1 == value2;
		}
		
		static public function notEqual(value1:*, value2:*, message:String=""):Boolean 
		{
			return value1 != value2;
		}
		
		static public function notStrictEqual(value1:*, value2:*, message:String=""):Boolean 
		{
			return value1 !== value2;
		}
		
		static public function ok(value:*, message:String=""):Boolean 
		{
			return Boolean(value);
		}
		
		static public function strictEqual(value1:*, value2:*, message:String=""):Boolean 
		{
			return value1 === value2;
		}
		
	}

}