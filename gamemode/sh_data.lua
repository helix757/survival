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
end

function meta:RemoveItem(item)
  self.data[item] = nil
end

function meta:GetItemVal(item)
  return self.data[item]
end

function meta:Save()
	file.Write("survival/"..self:SteamID64()..".txt", util.TableToJSON(self.data))
end