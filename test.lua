-- test 用来测试一些方法与neovim无关，lua测试
print("============ test.lua  =============")

-- metatable test
MyTable = {}
setmetatable(MyTable, {
	__index = function(_, k)
		return "mt:" .. k
	end,
})

print("===== MyTable[root] = " .. MyTable["root"])
print("===== type(MyTable) = " .. type(MyTable))
