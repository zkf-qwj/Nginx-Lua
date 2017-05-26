--http://192.168.1.179/index.html?DeviceID=abcd&ChannelID=12&Port=50000
--Query string 要按照DeviceID、ChannelID、Port这个顺序来添加

--提取query string 
local DeviceID = ngx.var.arg_DeviceID
local ChannelID = ngx.var.arg_ChannelID
local Port = ngx.var.arg_Port


function IsDir(path)
    local file = io.open(path, "rb")
    if file then file:close() end
    return file ~= nil
end

--创建一个文件夹
function file_createDic(_path)
	if IsDir(_path.."\\".."zlj") == true then
		ngx.log(ngx.ERR,"-------The directory has been created")
		return true
	end
    ngx.log(ngx.ERR,"*******************Create a directory:".._path)
	os.execute("md \"" .. _path .. "\"")
	f = io.open(_path.."\\".."zlj","w")
	f:close()
end


--local QueryStr = string.match(ngx.var.request_uri, "?(.+)")
--local DeviceID = string.match(QueryStr, "DeviceID=(.+)&Channel")
--local ChannelID = string.match(QueryStr, "ChannelID=(.+)&")
--local Port = string.match(QueryStr, "Port=((%d+))")

--在c盘创建目录
local root = "C:"  
local DeviceDir = root .. "\\" .. DeviceID
file_createDic(DeviceDir)
local ChannelDir = DeviceDir .. "\\" .. ChannelID
local file = io.open(ChannelDir,"w")
file:write(Port)
file:close()
