function dias(esq,num)
	if(num==0) then
		if(esq==1)then
		local d=io.open("cm.bat","r")
		e=d:read("*all")
		print(e)
		os.execute("START EXPLORER C:\\go\\bin")
		d:close()
			print("andre")
	    end
		if(esq==2) then
		end
		if(esq==3) then
		end
		if(esq==4) then
		end
	end
end
function main()
	--program=io.read()
	--print('')
	--if()then
		--os.execute(program)
		segunda()
end
function segunda()
	print("			segunda-feira")
	print("")
	print("-1 Limguagem Go")
	print("-2 Java ")
	print("-3 Word/excel")
	print("-4 engenharia soft/hack")
	esq=tonumber(io.read())
	dias(esq,0)
end

main()
print("ola")
 --[[
while true do
	com=io.read()
	cd=com.sub(com,1,2)
	if(cd =="cd" )then
		os.getenv("cd..")
		print(tostring(os.getenv("cd..")))
		print(tostring(os.execute(com)))
	end
	--
end
]]--
