﻿package dls.debugger.types {		import dls.debugger.types.IDebugger;	import dls.debugger.utils.DebugUtil;		public class TraceDebugger implements IDebugger {		private var active:Boolean;		public function TraceDebugger(active:Boolean=false) {			this.active = active;		}				public function out(message:*):void {			if (this.active) {				trace(DebugUtil.print(message));			}		}	}	}