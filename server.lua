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
testing=false

if testing~=true then
	print=function() end	
end

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

globhandler={}
glob={}
function editGlobal(i,v)
	print('_GLOBAL ',i,' SET = ',v)
	globhandler[i]=v
end
function getGlobal(i)
	print('_GLOBAL ',i, ' GET = ', globhandler[i])
	return globhandler[i]
end
setmetatable(glob,{
	['__newindex']=function(t,i,v)
		editGlobal(i,v)
		return true	
	end,
	['__index']=function(t,i)
		return getGlobal(i)
	end
})
local f=Instance.new('RemoteFunction')
f.Name='DevEthan > _GLOBAL'
f.OnServerInvoke=function(plr,index,value)
	if value==nil then
		--GET
		return getGlobal(index)
	else
		--SET
		editGlobal(index,value)
	end
end



function addPackage(name,a)
	_G.devethan.packages[name]=a
	_G.devethan.new:fire(name,a)
end

addPackage('_GLOBAL',function()
	getfenv(0)['_GLOBAL']=glob
end)
