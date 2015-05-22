_GLOBAL is a table that is available on all players and the server,
the table is shared between all players and the server.
	
For example:
	
If on the server I write
_GLOBAL.abc='Hello, world!'
	
And then on any player I write
print(_GLOBAL.abc)
	
The result will be: Hello, world!
	
	
	
The same works with the client setting and the server getting the value
	
Hope you enjoy! I might do global security in the future (For example making a value readonly to clients)
	
TO INSTALL
	Put Put In StarterGui in the StarterGui (duh)
		
IN ANY SCRIPT THAT YOU WANT TO USE _GLOBAL
	Put this at the top
	repeat wait() until _G.devethan repeat wait() until _G.devethan.ini _G.devethan.ini('_GLOBAL')	
	
	
