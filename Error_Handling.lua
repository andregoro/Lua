local function add(a,...)
    assert(type(a)=="number","nao e um numero")
    local arg={...}
    -- local array={}
    for i,v in ipairs(arg) do
        if(not assert(type(v)=="number","nao e numero"))then
            return a
        end
        a=a+v
    end
    return a
end
print(add(1,10,""))