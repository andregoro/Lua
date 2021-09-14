local http=require 'socket.http'
local socket=require 'socket'

os.execute("cls")
url_10seg="https://www.youtube.com/watch?v=vppmZMyNq6Y&list=PL61kTUcYddBNHsI2gqA5G_6oUDIPOsdx2&index=4"
url_5seg="https://www.youtube.com/watch?v=vppmZMyNq6Y&list=PL61kTUcYddBNHsI2gqA5G_6oUDIPOsdx2&index=4"
url_3seg="https://www.youtube.com/watch?v=vppmZMyNq6Y&list=PL61kTUcYddBNHsI2gqA5G_6oUDIPOsdx2&index=4"
-- url_1seg="http://slowwly.robertomurray.co.uk/delay/1000/url/http://www.tesserato.video"
url_1seg="https://www.youtube.com/watch?v=vppmZMyNq6Y&list=PL61kTUcYddBNHsI2gqA5G_6oUDIPOsdx2&index=4"

function fetch_data(address)
    local web=http.request(address)
    if web == nil then
       print("Falhou na capitura do pacote")
    else
        print("Conexao Ok")
    end
end

function req_time_counter(address)
    local req_time=socket.gettime() *1000
    fetch_data(address)
    local res_time=socket.gettime() *1000 -req_time
    print(string.format("%.0f Milisegundo(%.1f segundo)",res_time,res_time/1000))
end
function test_set()
    req_time_counter(url_10seg)
    req_time_counter(url_5seg)
    req_time_counter(url_3seg)
    req_time_counter(url_1seg)
end

local execute_start=socket.gettime()*1000
test_set()
local execute_time=socket.gettime()*1000-execute_start
print("=================")
print(string.format("tempo %.0f final \n tempo inicial %.1f",execute_start,execute_time))