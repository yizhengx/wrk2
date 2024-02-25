request = function()
    wrk.headers["x"] = "x"
    return wrk.format()
 end

response = function(status, headers, body)
    for k,v in pairs(headers) do
        io.write(string.format("key%s: %s\n", k, v))
    end
    io.write("--------------------\n")
 end

done = function(summary, latency, requests)
    for _, p in pairs({ 50, 90, 99, 99.999 }) do
       n = latency:percentile(p)
       io.write(string.format("%g%%,%d\n", p, n))
    end
    for i, p in pairs(latency) do
        io.write(string.format("key%g: %s\n", i, v))
    end
 end
 