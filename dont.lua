-- l={
--     p=1,p2=10,

-- }
-- function l:f()
--     p=0
--     print(p)
--     p=p+1
-- end

-- l.f()


-- o=coroutine.create(function()
--     -- p=0
--     -- print(p)
--     -- p=p+1
--     -- io.write(p)
--     i=0
--     while true do
--         print(i)
--         print("s")
--         i=i+1
--        coroutine.yield(i)
--     end
-- end)
-- -- print(coroutine.status(o))
-- coroutine.resume(o)
-- -- print(coroutine.status(o))
-- coroutine.resume(o)
-- coroutine.resume(o)
-- coroutine.resume(o)
-- coroutine.resume(o)
-- coroutine.resume(o)
-- coroutine.resume(o)

obj1={var=13}
obj2={var=1}
meta={
    __index = obj1
}
print(obj2.var)
setmetatable(obj2,meta)
print(obj2.var)
------------------
objeto={}
objeto.prototype={a=1,b=10}
objeto.metetable={__index=objeto.prototype,__call=function(t)
  return t.a.." = "..t.b
end}

objeto.new=function(o)
    local i=o
    setmetatable(i,objeto.metetable)
    return i
end

inst=objeto.new({a=2,b=90})
print(inst())