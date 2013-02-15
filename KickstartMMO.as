﻿package  {		import com.smartfoxserver.v2.SmartFox;	import com.smartfoxserver.v2.core.SFSEvent;	import com.smartfoxserver.v2.requests.*;		public class KickstartMMO {				// function handlers		public var HandleConnection:Function = UnhandledEvent;		public var HandleConnectionLost:Function = UnhandledEvent;		public var HandleLogin:Function = UnhandledEvent;		public var HandleLoginError:Function = UnhandledEvent;		public var HandleJoin:Function = UnhandledEvent;		public var HandleJoinError:Function = UnhandledEvent;				public var sfs:SmartFox;				private var isConnected:Boolean = false;				// Internal Magic :P		public function KickstartMMO() {			// constructor code			sfs = new SmartFox();			sfs.debug = false;						sfs.addEventListener(SFSEvent.CONNECTION, onConnection);			sfs.addEventListener(SFSEvent.CONNECTION_LOST, onConnectionLost);								 			sfs.addEventListener(SFSEvent.LOGIN, onLogin);			sfs.addEventListener(SFSEvent.LOGIN_ERROR, onLoginError);						sfs.addEventListener(SFSEvent.ROOM_JOIN, onJoin);			sfs.addEventListener(SFSEvent.ROOM_JOIN_ERROR, onJoinError);		}				private function UnhandledEvent(e:SFSEvent){			trace("unhandled event");		}				// API functions				public function Connect(host:String=null, port:int = -1):void{			sfs.connect(host, port);		}				public function Login(username:String="", password:String="", zoneName:String="KickstartMMO"):void{			sfs.send(new LoginRequest(username, password, zoneName));		}				public function ConnectLogin(host:String=null, port:int = -1, username:String="", password:String="", zoneName:String="KickstartMMO"){			HandleConnection = function(){				Login(username, password, zoneName);			};						Connect(host, port);		}				public function JoinRoom(roomName:String){			sfs.send(new JoinRoomRequest(roomName));		}						// SFS Event Handlers				private function onConnection(e:SFSEvent){			isConnected = e.params.success;			trace("Connected");						HandleConnection(e);		}				private function onConnectionLost(e:SFSEvent){			trace("Connection lost");			HandleConnectionLost(e);		}						private function onLoginError(e:SFSEvent){			trace("Login error");			HandleLoginError(e);		}				private function onLogin(e:SFSEvent){			trace("Login successful");			HandleLogin(e);		}				private function onJoin(e:SFSEvent){			trace("Join successful");			HandleJoin(e);		}				private function onJoinError(e:SFSEvent){			HandleJoinError(e);		}			}	}