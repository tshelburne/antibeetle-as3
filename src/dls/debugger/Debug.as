﻿package dls.debugger  {		import dls.debugger.types.ConsoleDebugger;	import dls.debugger.types.IDebugger;	import dls.debugger.types.TraceDebugger;		public class Debug {				// priority level of debug information		public static const NONE:int = 0;		public static const ACTIONS:int = 1;		public static const DETAILS:int = 2;		public static const DEBUG:int = 3;				public static var priorityLevel:int;		public static var debugger:IDebugger;				public static function setDebugger(inBrowser:Boolean, priority:int):void {			if (priority <= 0) { priorityLevel = 0; }			else if (priority >= 3) { priorityLevel = 3; }			else { priorityLevel = priority; }						var debug:Boolean = priorityLevel > 0;			debugger = inBrowser ? new ConsoleDebugger(debug) : new TraceDebugger(debug); //new StageDebugger(stage, debug);		}				public static function out(message:*, priority:int=1, options:Object=null):void {			if (priority <= priorityLevel) {				if (options != null && options.hasOwnProperty("separate")) { debugger.out("-------------------------"); }				if (options != null && options.hasOwnProperty("title")) { debugger.out(options["title"]); }								var source:String = options != null && options.hasOwnProperty("source") ? " -- " + options["source"] + ": " : "";								debugger.out(message, source); 								if (options != null && options.hasOwnProperty("separate")) { debugger.out("-------------------------"); }			}		}	}	}