function n(m,m2)
	if(m>m2)then
		m2=m2+1
		return m2,10
	end
end

for d,d2 in n,3,0 do
	print(d,d2)
end
