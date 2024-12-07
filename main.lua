local HttpService = game:GetService("HttpService")

-- 'load.txt' dosyasını kontrol et ve komutları çalıştır
local function checkLoadTxt()
    local loadData = readfile("load.txt")

    if loadData then
        -- Eğer load.txt dosyasındaki komut 'isExecuted = true;' içermiyorsa
        if not loadData:match("isExecuted%s*=%s*true") then
            -- Yeni komutu loadstring ile çalıştır
            local func, err = loadstring(loadData)

            if func then
                -- Komutu çalıştır
                func()
                -- 'load.txt' dosyasına 'isExecuted = true;' ekle
                writefile("load.txt", "isExecuted = true;")
            else
                -- Hata durumu
                print("Hata: " .. err)
            end
        else
        end
    else
        print("txt not found")
    end
end

-- Sürekli kontrol etmek için bir fonksiyon
while true do
    checkLoadTxt()
end
