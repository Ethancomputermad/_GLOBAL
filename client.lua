------------------------------------------
--										--
--				_GLOBAL					--
--			Ethancomputermad			--
--										--
--	http://github.com/Ethancomputermad	--
--										--
--		http://devhub.devethan.com		--
--										--
--DevEthan 2015---------------------------
glob={}

hold={}
game.ReplicatedStorage:WaitForChild('DevEthan > _GLOBAL')
send=function(i,v)
	return game.ReplicatedStorage['DevEthan > _GLOBAL']:InvokeServer(i,v)
end
setmetatable(glob,{
	['__newindex']=function(i,v)
		send(i,v)
	end,
	['__index']=function(i)
		return send(i)
	end
})

if _G.devethan==nil then
	_G.devethan={
		ini=function(...)
			local needs={...}
			local loaded={}
			for _,f in pairs(_G.devethan.packages) do
				print('Loading package ',_)
				f()
				loaded[_]=true
			end
			_G.devethan.new:connect(function(a,b) b() loaded[a]=true end)
			local function continue()
				for _,i in pairs(needs) do
					if loaded[i]~=true then
						return false
					end
				end
				return true
			end
			repeat wait() until continue()==true
		end,
		new=LoadLibrary('RbxUtility').CreateSignal(),
		packages={
			
		}
	}
end

function addPackage(name,a)
	_G.devethan.packages[name]=a
	_G.devethan.new:fire(name,a)
end
addPackage('_GLOBAL',function()
	getfenv(0)['_GLOBAL']=glob
end)
