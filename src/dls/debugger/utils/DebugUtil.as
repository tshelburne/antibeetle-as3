﻿package dls.debugger.utils {		public class DebugUtil {		public function DebugUtil() {			// constructor code		}				/**		 * @Author - dev.base86 (http://dev.base86.com/solo/47/actionscript_3_equivalent_of_phps_printr.html)		 * @Author - Tim Shelburne (tim@dontlookstudios.com) 		 */		public static function print(msg:*, output:String="", level:int=0):* {			// Print 			if (["object", "array"].indexOf(typeof(msg)) != -1) {					var tabs:String = "";				for(var i:int = 0; i < level; i++) {					tabs += "\t";				}								for(var child:* in msg) {					output += tabs +"["+ child +"] => "+ msg[child];					var childOutput:String = print(msg[child], "", level+1);					if(childOutput != '') 						output += ' {\n'+ childOutput + tabs +'}';					output += "\n";				}			}			else {				output += msg;			}						return output;		}	}	}