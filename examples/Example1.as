﻿package  {		import flash.display.Sprite;		import KickstartMMO;	import com.smartfoxserver.v2.core.SFSEvent;		public class Example1 extends Sprite{				public var ksm:KickstartMMO;		public function Example1() {			// constructor code			ksm = new KickstartMMO();						ksm.HandleLogin = LoginHandler;						ksm.ConnectLogin("magnesiumbeta.com", 9933, "", "", "KickstartMMO");		}				public function LoginHandler(event:SFSEvent){			ksm.JoinRoom("Lobby");			trace("Joining the Lobby..");		}	}	}