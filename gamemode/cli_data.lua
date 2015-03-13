local function RecvData()
	data = net.ReadTable()
end
net.Receive("SendData", RecvData)

function GetClientData(name)
	return data[name] or 0
end