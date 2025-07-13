local UI = require("WalvyXploit/ui")

-- Contoh penggunaan
local myWindow = UI:CreateWindow("My Window", {w = 200, h = 150})

-- Di suatu tempat di loop utama Anda
if myWindow.visible then
    -- Gambar jendela
end

-- Di suatu tempat di event handler Anda
-- Panggil myWindow:Minimize() saat tombol minimize diklik
