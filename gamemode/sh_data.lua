local meta = FindMetaTable("Player")

function meta:HasItem(item)
  if self.data[item] != nil then
    return true
  else
    return false
  end
end

-- Can be int,string,bool etc
function meta:SetItem(item,amt)
  self.data[item] = amt  
  	net.Start("SendData")
		net.WriteTable(self.data)
	net.Send(self)
end

function meta:RemoveItemVar(item)
  self.data[item] = nil
  	net.Start("SendData")
		net.WriteTable(self.data)
	net.Send(self)
end

function meta:GetItemVal(item)
	if self.data[item] == nil then
	return 0
	else
	return self.data[item]
	end
end

function meta:Save()
	file.Write("survival/"..self:SteamID64()..".txt", util.TableToJSON(self.data))
end