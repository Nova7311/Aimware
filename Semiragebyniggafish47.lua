
local entities_GetPlayerResources, entities_FindByClass, entities_GetByIndex, entities_GetLocalPlayer, entities_GetByUserID =
    entities.GetPlayerResources,
    entities.FindByClass,
    entities.GetByIndex,
    entities.GetLocalPlayer,
    entities.GetByUserID
local client_GetLocalPlayerIndex,
    client_ChatSay,
    client_WorldToScreen,
    client_Command,
    client_GetPlayerIndexByUserID,
    client_SetConVar,
    client_GetPlayerInfo,
    client_GetConVar =
    client.GetLocalPlayerIndex,
    client.ChatSay,
    client.WorldToScreen,
    client.Command,
    client.GetPlayerIndexByUserID,
    client.SetConVar,
    client.GetPlayerInfo,
    client.GetConVar
local client_GetPlayerNameByIndex, client_GetPlayerNameByUserID, client_ChatTeamSay, client_AllowListener =
    client.GetPlayerNameByIndex,
    client.GetPlayerNameByUserID,
    client.ChatTeamSay,
    client.AllowListener
local globals_FrameTime,
    globals_AbsoluteFrameTime,
    globals_CurTime,
    globals_TickCount,
    globals_MaxClients,
    globals_RealTime,
    globals_FrameCount,
    globals_TickInterval =
    globals.FrameTime,
    globals.AbsoluteFrameTime,
    globals.CurTime,
    globals.TickCount,
    globals.MaxClients,
    globals.RealTime,
    globals.FrameCount,
    globals.TickInterval
local http_Get = http.Get
local math_ceil,
    math_tan,
    math_huge,
    math_log10,
    math_randomseed,
    math_cos,
    math_sinh,
    math_random,
    math_mod,
    math_pi,
    math_max,
    math_atan2,
    math_ldexp,
    math_floor,
    math_sqrt,
    math_deg,
    math_atan =
    math.ceil,
    math.tan,
    math.huge,
    math.log10,
    math.randomseed,
    math.cos,
    math.sinh,
    math.random,
    math.mod,
    math.pi,
    math.max,
    math.atan2,
    math.ldexp,
    math.floor,
    math.sqrt,
    math.deg,
    math.atan
local math_fmod,
    math_acos,
    math_pow,
    math_abs,
    math_min,
    math_log,
    math_frexp,
    math_sin,
    math_tanh,
    math_exp,
    math_modf,
    math_cosh,
    math_asin,
    math_rad =
    math.fmod,
    math.acos,
    math.pow,
    math.abs,
    math.min,
    math.log,
    math.frexp,
    math.sin,
    math.tanh,
    math.exp,
    math.modf,
    math.cosh,
    math.asin,
    math.rad
local table_foreach, table_sort, table_remove, table_foreachi, table_maxn, table_getn, table_concat, table_insert =
    table.foreach,
    table.sort,
    table.remove,
    table.foreachi,
    table.maxn,
    table.getn,
    table.concat,
    table.insert
local string_find,
    string_lower,
    string_format,
    string_rep,
    string_gsub,
    string_len,
    string_gmatch,
    string_dump,
    string_match,
    string_reverse,
    string_byte,
    string_char,
    string_upper,
    string_gfind,
    string_sub =
    string.find,
    string.lower,
    string.format,
    string.rep,
    string.gsub,
    string.len,
    string.gmatch,
    string.dump,
    string.match,
    string.reverse,
    string.byte,
    string.char,
    string.upper,
    string.gfind,
    string.sub



local font = draw.CreateFont("Microsoft Tai Le", 32, 1000);
local font1 = draw.CreateFont("Verdana", 22, 400);
local ref = gui.Reference("Ragebot");
local tab = gui.Tab(ref, "SemiRage", "[Nigga-SemiRage]");
local screen_w, screen_h = draw.GetScreenSize();
local updaterfont1 = draw.CreateFont("Bahnschrift", 15);

local UserName=cheat.GetUserName()

local ffi = ffi
local function a(b, c, d, e)
    local f = gui.Reference("menu")
    return (function()
        local g = {}
        local h, i, j, k, l, m, n, o, p, q, r, s, t, u
        local v = {__index = {Drag = function(self, ...)
                    local w, x = self:GetValue()
                    local y, z = g.drag(w, x, ...)
                    if w ~= y or x ~= z then
                        self:SetValue(y, z)
                    end
                    return y, z
                end, SetValue = function(self, w, x)
                    local p, q = draw.GetScreenSize()
                    self.x:SetValue(w / p * self.res)
                    self.y:SetValue(x / q * self.res)
                end, GetValue = function(self)
                    local p, q = draw.GetScreenSize()
                    return math.floor(self.x:GetValue() / self.res * p), math.floor(self.y:GetValue() / self.res * q)
                end}}
        function g.new(x, A, B, C, D)
            local D = D or 10000
            local p, q = draw.GetScreenSize()
            local A = A ~= "" and A .. "." or A
            local E = gui.Slider(x, A .. "x", "Position x", B / p * D, 0, D)
            local F = gui.Slider(x, A .. "y", "Position y", C / q * D, 0, D)
            E:SetInvisible(true)
            F:SetInvisible(true)
            return setmetatable({x = E, y = F, res = D}, v)
        end
        function g.drag(w, x, G, H, I)
            if globals.FrameCount() ~= h then
                i = f:IsActive()
                l, m = j, k
                j, k = input.GetMousePos()
                o = n
                n = input.IsButtonDown(1) == true
                s = r
                r = {}
                u = t
                t = false
                p, q = draw.GetScreenSize()
            end
            if i and o ~= nil then
                if (not o or u) and n and l > w and m > x and l < w + G and m < x + H then
                    t = true
                    w, x = w + j - l, x + k - m
                    if not I then
                        w = math.max(0, math.min(p - G, w))
                        x = math.max(0, math.min(q - H, x))
                    end
                end
            end
            table.insert(r, {w, x, G, H})
            return w, x, G, H
        end
        return g
    end)().new(b, c, d, e)
end
do
    ffi.cdef [[
    typedef void* (__cdecl* tCreateInterface)(const char* name, int* returnCode);
    void* GetProcAddress(void* hModule, const char* lpProcName);
    void* GetModuleHandleA(const char* lpModuleName);
    typedef struct {
        uint8_t r;
        uint8_t g;
        uint8_t b;
        uint8_t a;
    } color_struct_t;

    typedef void (*console_color_print)(const color_struct_t&, const char*, ...);

    typedef void* (__thiscall* get_client_entity_t)(void*, int);
    ]]
    function mem.CreateInterface(J, K)
        return ffi.cast("tCreateInterface", ffi.C.GetProcAddress(ffi.C.GetModuleHandleA(J), "CreateInterface"))(K, ffi.new("int*"))
    end
end
do
    local L =
        draw.CreateTexture(
        common.RasterizeSVG(
            [[<defs><linearGradient id="b" x1="100%" y1="0%" x2="0%" y2="0%"><stop offset="0%" style="stop-color:rgb(255,255,255); stop-opacity:0" /><stop offset="100%" style="stop-color:rgb(255,255,255); stop-opacity:1" /></linearGradient></defs><rect width="500" height="500" style="fill:url(#b)" /></svg>]]
        )
    )
    local M =
        draw.CreateTexture(
        common.RasterizeSVG(
            [[<defs><linearGradient id="a" x1="0%" y1="100%" x2="0%" y2="0%"><stop offset="0%" style="stop-color:rgb(255,255,255); stop-opacity:0" /><stop offset="100%" style="stop-color:rgb(255,255,255); stop-opacity:1" /></linearGradient></defs><rect width="500" height="500" style="fill:url(#a)" /></svg>]]
        )
    )
    function draw.FilledRectFade(N, O, P, Q, R)
        local S = R and L or M
        draw.SetTexture(S)
        draw.FilledRect(math.floor(N), math.floor(O), math.floor(P), math.floor(Q))
        draw.SetTexture(nil)
    end
end
do
    function math.clamp(T, U, V)
        return T > V and V or T < U and U or T
    end
end

local hit_groups = {"Head", "Chest", "Stomach", "Left Arm", "Right Arm", "Left Leg", "Right Leg"}

local ffi_log = ffi.cast("console_color_print", ffi.C.GetProcAddress(ffi.C.GetModuleHandleA("tier0.dll"), "?ConColorMsg@@YAXABVColor@@PBDZZ"))

local _SetTag = ffi.cast('int(__fastcall*)(const char*, const char*)', mem.FindPattern('engine.dll', '53 56 57 8B DA 8B F9 FF 15'))

local SetTag = function(v)
    if v ~= last then
      _SetTag(v, v)
      last = v
    end
  end

function client.log(msg, ...)
    for k, v in pairs({...}) do
        msg = tostring(msg .. v)
    end
    ffi_log(ffi.new("color_struct_t"), msg .. "\n")
end

function client.color_log(r, g, b, msg, ...)
    for k, v in pairs({...}) do
        msg = tostring(msg .. v)
    end
    local clr = ffi.new("color_struct_t")
    clr.r, clr.g, clr.b, clr.a = r, g, b, 255
    ffi_log(clr, msg .. "\n")
end

local c_hud_chat =
    ffi.cast("unsigned long(__thiscall*)(void*, const char*)", mem.FindPattern("client.dll", "55 8B EC 53 8B 5D 08 56 57 8B F9 33 F6 39 77 28"))(
    ffi.cast("unsigned long**", ffi.cast("uintptr_t", mem.FindPattern("client.dll", "B9 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 5D 08")) + 1)[0],
    "CHudChat"
)

local ffi_print_chat = ffi.cast("void(__cdecl*)(int, int, int, const char*, ...)", ffi.cast("void***", c_hud_chat)[0][27])

function client.PrintChat(msg)
    ffi_print_chat(c_hud_chat, 0, 0, " " .. msg)
end

function startswith(text, prefix)
    return text:find(prefix, 1, true) == 1
end


local function on_player_hurt(Event)
end

panorama.RunScript([[
        let muteSomeoneUHate = (ent) => {
        let xuid = GameStateAPI.GetPlayerXuidFromUserID(ent);
            if (GameStateAPI.IsXuidValid(xuid) && !GameStateAPI.IsFakePlayer(xuid) && !GameStateAPI.IsSelectedPlayerMuted(xuid)) {
                let isMuted = GameStateAPI.IsSelectedPlayerMuted(xuid);;
                if(isMuted) return;
                GameStateAPI.ToggleMute(xuid);
            }
        }
]])

panorama.RunScript([[
    let UnmuteSomeoneULike = (ent) => {
    let xuid = GameStateAPI.GetPlayerXuidFromUserID(ent);
        if (GameStateAPI.IsXuidValid(xuid) && !GameStateAPI.IsFakePlayer(xuid) && !GameStateAPI.IsSelectedPlayerMuted(xuid)) {
            let isMuted = GameStateAPI.IsSelectedPlayerMuted(xuid);
            if(isMuted) 
                GameStateAPI.ToggleMute(xuid);
        }
    }
]])

local function mute_someone_you_hate(UserID)

    panorama.RunScript([[muteSomeoneUHate( ]] .. UserID .. [[); 
                        var xuid = GameStateAPI.GetPlayerXuidFromUserID(]] .. UserID .. [[)
                        var name = GameStateAPI.GetPlayerName(xuid);
                        $.Msg("Muted: " + name)]])

end

local function unmute_someone_you_love_like_yukine(UserID)

    panorama.RunScript([[
        $.Msg("Running UnmuteFunc")
        UnmuteSomeoneULike(]] .. UserID .. [[);
    ]])

end

local function unmute_all()

    panorama.RunScript([[
        for(var i = 0; i < 1000; i++){
            $.Msg(i)
            UnmuteSomeoneULike(i)
        }
    ]])

end

local function mute_all()

    panorama.RunScript([[
        for(var i = 0; i < 1000; i++){
            $.Msg(i)
            muteSomeoneUHate(i)
        }
    ]])

end

local clantag_speed = 3

local function print_user_id()

    local players = entities.FindByClass("CCSPlayer");

    for i = 1, #players do

        local player = players[i];

        local info = client.GetPlayerInfo(player:GetIndex())

        client.PrintChat(string.format( "Username: %s -> UserID: %s", player:GetName(), info["UserID"]))
        
    end


end

local function round(num, numDecimalPlaces)

	local mult = 10 ^ (numDecimalPlaces or 0)

	return math.floor(num * mult + 0.5) / mult

end

local last_update_time = 0

local iter = 1

local clantag_set = ""

local clantag_type = ""

local clantag_str = ""

local function do_clantag(clantag, style)

    if clantag == nil or clantag == "" then return end

    
    local clantag_len = string.len(clantag)

    local cur_time = round(globals.CurTime() * clantag_speed, 0)



    if cur_time == last_update_time then return end



    if style == "Static" then

        clantag_set = clantag

    elseif style == "Build" then

       

        if cur_time % clantag_len == 0 then

            iter = 1

        end



     

        clantag_set = ""



        for i = 1, iter do

            clantag_set = clantag_set .. clantag:sub(i, i)

            print(clantag_set)

        end



   
        iter = iter + 1

    elseif style == "Scroll" then

 

        if cur_time % clantag_len == 0 then

            clantag_set = clantag .. " "

        end



    

        if clantag_set:len() > 0 then

            clantag_set = clantag_set .. clantag_set:sub(1, 1)

            clantag_set = clantag_set:sub(2, clantag_set:len())

        end

    elseif style == "Build-Scroll" then

   

        if cur_time % (clantag_len * 3 + 1) == 0 then 

            iter = 1

        end

    

 

        if iter <= clantag_len * 3 + 1 then

            if iter <= clantag_len then

                clantag_set = string.sub(clantag, 1, iter)

            elseif iter >= (clantag_len * 2) then

                clantag_set = string.sub(clantag, iter - clantag_len * 2 + 1, clantag_len)

            end

    

            iter = iter + 1

        end

    end



    SetTag(clantag_set, clantag_set)



    last_update_time = round(globals.CurTime() * clantag_speed, 0)

end



local function on_create_move(cmd)
 
    if(clantag_type == "") then clantag_type = "Static" end

    do_clantag(clantag_str, clantag_type)
    
end

local function set_animation(anim_type)

    if(string.find(string.lower(anim_type), "static") == 1) then

        clantag_type = "Static"

        return true

    elseif(string.find(string.lower(anim_type), "scroll") == 1) then

        clantag_type = "Scroll"

        return true

    elseif(string.find(string.lower(anim_type), "build") == 1) then

        clantag_type = "Build"

        return true

    elseif(string.find(string.lower(anim_type), "build-scroll") == 1) then

        clantag_type = "Build-Scroll"

        return true

    end

end

local function on_cmd(cmd) 

    if(string.find(cmd:Get(), 'say "!') == 1) then 

        if(cmd:Get() == 'say "!help"') then

            client.PrintChat("\02[NiggaFish.lua]\08 !clantag Clantag You want to set i.e. !clantag AIMWARE")

            client.PrintChat("\02[NiggaFish.lua]\08 !animation static/scroll/build/build-scroll")

            client.PrintChat("\02[NiggaFish.lua]\08 !clantag_speed 3")

            client.PrintChat("\02[NiggaFish.lua]\08 !name Name You want to set i.e. !name Squidoodle")

            client.PrintChat("\02[NiggaFish.lua]\08 !consolecommand i.e. !disconnect")

            client.PrintChat("\02[NiggaFish.lua]\08 !mute UID i.e. !mute 3 use !list to find UID")

            client.PrintChat("\02[NiggaFish.lua]\08 !muteall UID i.e. !muteall Mutes everyone")

            client.PrintChat("\02[NiggaFish.lua]\08 !unmute UID i.e. !unmute 3 use !list to find UID (Not working?)")

            client.PrintChat("\02[NiggaFish.lua]\08 !list prints player names and their UID")

        elseif(cmd:Get() == 'say "!todo"') then

            client.PrintChat("\02[To-do]\08 !unmuteall")

            client.PrintChat("\02[To-do]\08 !muteall")

            client.PrintChat("\02[To-do]\08 !clantag prints subdirectories")

        elseif(string.find(cmd:Get(), 'say "!clantag') == 1) then 

            local commmand = cmd:Get()

            local t = string.gsub(cmd:Get(), 'say "!clantag ', "")

            t = string.gsub(t, '"', "")

            client.PrintChat("\02[NiggaFish.lua]\08 Setting clantag: " .. t)

            clantag_str = t

        elseif(string.find(cmd:Get(), 'say "!unmuteall') == 1) then 

            client.PrintChat("\02[NiggaFish.lua]\08 Unmuting everyone")

            unmute_all()

        elseif(string.find(cmd:Get(), 'say "!muteall') == 1) then 

            client.PrintChat("\02[NiggaFish.lua]\08 Muting everyone")

            mute_all()

        elseif(string.find(cmd:Get(), 'say "!clantag_speed') == 1) then 

            local commmand = cmd:Get()

            local t = string.gsub(cmd:Get(), 'say "!clantag_speed ', "")

            t = string.gsub(t, '"', "")

            client.PrintChat("\02[NiggaFish.lua]\08 Setting clantag speed: " .. t)

            clantag_speed = tonumber(t)

        elseif(string.find(cmd:Get(), 'say "!animation') == 1) then 

            local commmand = cmd:Get()

            local t = string.gsub(cmd:Get(), 'say "!animation ', "")

            t = string.gsub(t, '"', "")

            local sucess = set_animation(t)

            if(sucess) then client.PrintChat("\02[NiggaFish.lua]\08 Setting animation: " .. t) end

        elseif(string.find(cmd:Get(), 'say "!name') == 1) then

            local commmand = cmd:Get()

            local t = string.gsub(cmd:Get(), 'say "!name ', "")

            t = string.gsub(t, '"', "")

            client.PrintChat("\02[NiggaFish.lua]\08 Setting name: " .. t)

            client.SetConVar("name", t, 1)

        elseif(string.find(cmd:Get(), 'say "!mute') == 1) then

            local commmand = cmd:Get()

            local t = string.gsub(cmd:Get(), 'say "!mute', "")

            t = string.gsub(t, '"', "")

            client.PrintChat("\02[NiggaFish.lua]\08 Muting player with UID: " .. t)

            mute_someone_you_hate(t)

        elseif(string.find(cmd:Get(), 'say "!unmute') == 1) then

            local commmand = cmd:Get()

            local t = string.gsub(cmd:Get(), 'say "!unmute', "")

            t = string.gsub(t, '"', "")

            client.PrintChat("\02[NiggaFish.lua]\08 Unmuting player with UID: " .. t)

            unmute_someone_you_love_like_yukine(t)

        elseif(string.find(cmd:Get(), 'say "!list') == 1) then

            print_user_id()

        else 

            local commmand = cmd:Get()

            local t = string.gsub(cmd:Get(), 'say "!', "")

            t = string.gsub(t, '"', "")

            client.PrintChat("\02[NiggaFish.lua]\08 Running command: " .. t)

            client.Command(t, 1)

        end

    end

end

client.AllowListener("player_hurt")
callbacks.Register("SendStringCmd", on_cmd)
callbacks.Register("FireGameEvent", on_player_hurt)
callbacks.Register("CreateMove", on_create_move)








local guiSet = gui.SetValue
local guiGet = gui.GetValue
local auto = guiGet("rbot.accuracy.weapon.asniper.mindmg")
local sniper = guiGet("rbot.accuracy.weapon.sniper.mindmg")
local pistol = guiGet("rbot.accuracy.weapon.pistol.mindmg")
local revolver = guiGet("rbot.accuracy.weapon.hpistol.mindmg")
local smg = guiGet("rbot.accuracy.weapon.smg.mindmg")
local rifle = guiGet("rbot.accuracy.weapon.rifle.mindmg")
local shotgun = guiGet("rbot.accuracy.weapon.shotgun.mindmg")
local scout = guiGet("rbot.accuracy.weapon.scout.mindmg")
local lmg = guiGet("rbot.accuracy.weapon.lmg.mindmg")
local toggle = 1;
local defusing = false;





local main_box = gui.Groupbox(tab, "Main", 16, 16, 200, 0);
local main_unlockinv = gui.Checkbox(main_box, "main.unlockinv", "Unlock Inventory", true);
local main_fixrevolver = gui.Checkbox(main_box, "main.fixrevolver", "Disable FakeLag With R8", false);
local dynamic_enable = gui.Checkbox(main_box, "dynamic.enable", "Dynamic Fov Enable", true);
local dynamic_min_slider = gui.Slider(main_box, "dynamic.min", "Fov Min", 5, 1, 30);
local dynamic_max_slider = gui.Slider(main_box, "dynamic.max", "Fov Max", 10, 1, 30);




local legit_aa_box = gui.Groupbox(tab, "Legit Anti-Aim", 232, 16, 200, 0);
local legit_aa_enable = gui.Checkbox(legit_aa_box, "aa.enable", "Enable", false);
local legit_aa_dis_on_fd = gui.Checkbox(legit_aa_box, "aa.disonfd", "Disable On FakeDuck", false);
local legit_aa_type = gui.Combobox(legit_aa_box, "aa.type", "DeSync Type", "Default", "Low");
local legit_aa_key = gui.Keybox(legit_aa_box, "aa.inverter", "Inverter", 0);

local switch_box = gui.Groupbox(tab, "Switch", 448, 16, 174, 0);
local switch_enable = gui.Checkbox(switch_box, "switch.enable", "Enable", true);
local switch_fbaim_key = gui.Keybox(switch_box, "switch.force", "Force Baim", 0);
local switch_awall_key = gui.Keybox(switch_box, "switch.autowall", "Auto Wall", 0);
local key = gui.Keybox(switch_box, "lua_keybox", "Rage/Legit",0);


local misc_box = gui.Groupbox(tab, "Clantag", 232, 266, 200, 0);

local EnableClantag=gui.Checkbox(misc_box,"EnableClantag","Clantag",false)
local enable = gui.Checkbox(misc_box,"customtagenable", "Custom clantag", 0)
local tagbox = gui.Editbox(misc_box, "customtag", "Clantag name ")
local speedslider = gui.Slider(misc_box, "customtagspeed", "Clantag speed", 3, 0, 10, 0.1)
local stealclan = gui.Combobox(misc_box, "stealclan", "Steal Clan", "Off")


local misc_box = gui.Groupbox(tab, "Misc", 16, 266, 200, 0);
local EngineRadar = gui.Checkbox(misc_box, "engineradar", "Engine Radar", true)
local main_switch = gui.Checkbox(misc_box, "", "Anti server crasher", 0)
local fullupdate_key = gui.Keybox(misc_box, "", "FULL UPDATE", 0)
local X = gui.Checkbox(misc_box, "so.rainbow", "Rainbow", 0)
X:SetInvisible(true)
local Y = gui.Checkbox(misc_box, "so.watermark", "Watermark", 1)
local Z = gui.ColorPicker(Y, "clr", "Color", 255, 0, 0, 255)


local pressed = false;

local a1 = draw.CreateFont("verdana", 15)
local a2 = {watermark = 0, spectators = 0}
local a3 = {

    watermark = function()
        local a4 = mem.FindPattern("engine.dll", "FF E1")
        local a5 = ffi.cast("uint32_t(__fastcall*)(unsigned int, unsigned int, const char*)", a4)
        local a6 = ffi.cast("uint32_t(__fastcall*)(unsigned int, unsigned int, uint32_t, const char*)", a4)
        local a7 = ffi.cast("uint32_t**", ffi.cast("uint32_t", mem.FindPattern("engine.dll", "FF 15 ?? ?? ?? ?? A3 ?? ?? ?? ?? EB 05")) + 2)[0][0]
        local a8 = ffi.cast("uint32_t**", ffi.cast("uint32_t", mem.FindPattern("engine.dll", "FF 15 ?? ?? ?? ?? 85 C0 74 0B")) + 2)[0][0]
        local a9 = function(aa, ab, ac)
            local ad = ffi.typeof(ac)
            return function(...)
                return ffi.cast(ad, a4)(a6(a7, 0, a5(a8, 0, aa), ab), 0, ...)
            end
        end
        local ae = a9("user32.dll", "EnumDisplaySettingsA", "int(__fastcall*)(unsigned int, unsigned int, unsigned int, unsigned long, void*)")
        local af = ffi.new("struct { char pad_0[120]; unsigned long dmDisplayFrequency; char pad_2[32]; }[1]")
        ae(0, 4294967295, af[0])
        callbacks.Register(
            "Draw",
            function()
                local ag = globals.FrameTime() * 8
                local s, h, c, b = Z:GetValue()
                local ah = entities.GetLocalPlayer()
                local ai = os.date("%X")
                local aj = "NiggaFish.lua"
                local ak = ah and ah:GetName() or client.GetConVar("name")
                local al = (" %s | %s | %s"):format(aj, ak, ai)
                if ah then
                    local am = entities.GetPlayerResources():GetPropInt("m_iPing", ah:GetIndex())
                    local an = (" | delay: %dms"):format(am)
                    al = (" %s | %s%s | %s"):format(aj, ak, an, ai)
                end
                draw.SetFont(a1)
                local ao, ap = draw.GetScreenSize()
                local i, x = 18, draw.GetTextSize(al) + 8
                local y, z = ao, 10 + 25 * 0
                y = y - x - 10
                a2.watermark = math.clamp(a2.watermark + (Y:GetValue() and ag or -ag), 0, 1)
                draw.SetScissorRect(y + x - x * a2.watermark, z, x, i * 3)
                if X:GetValue() then
                    draw.Color(s, h, c)
                    draw.FilledRectFade(y + x / 2 + 1, z + 2, y, z, true)
                    draw.FilledRectFade(y + x / 2, z, y + x, z + 2, true)
                    draw.Color(h, c, s)
                    draw.FilledRectFade(y, z, y + x / 2 + 1, z + 2, true)
                    draw.Color(c, s, h)
                    draw.FilledRectFade(y + x, z + 2, y + x / 2, z, true)
                else
                    draw.Color(s, h, c)
                    draw.FilledRect(y, z, y + x, z + 2)
                end
                draw.Color(17, 17, 17, 255)
                draw.FilledRect(y, z + 2, y + x, z + i)
                draw.Color(255, 255, 255)
                draw.Text(y + 4, z + 4, al)
                local al = ("%dhz"):format(tonumber(af[0].dmDisplayFrequency))
                local i, x = 18, draw.GetTextSize(al) + 8
                local y, z = ao, 10 + 25 * 1
                y = y - x - 10
                draw.Color(0, 0, 0, 25)
                draw.FilledRectFade(y, z + i, y + x / 2, z + i + 1, true)
                draw.FilledRectFade(y + x, z + i + 1, y + x / 2, z + i, true)
                draw.Color(s, h, c)
                draw.FilledRectFade(y + x / 2, z + i + 1, y, z + i, true)
                draw.FilledRectFade(y + x / 2, z + i, y + x, z + i + 1, true)
                draw.Color(17, 17, 17, b)
                draw.FilledRect(y, z, y + x, z + i)
                draw.Color(255, 255, 255)
                draw.Text(y + 4, z + 4, al)
                draw.SetScissorRect(0, 0, ao, ap)
            end
        )
    end,
   d
 
}
a3.watermark()

local aspect_table = {0, 2.0, 1.9, 1.8, 1.7, 1.6, 1.5, 1.4, 1.3, 1.2, 1.1, 1.0, 0.9, 0.8, 0.7, 0.6, 0.5, 0.4, 0.3};
local weapons_table = {"asniper", "hpistol", "lmg", "pistol", "rifle", "scout", "smg", "shotgun", "sniper", "zeus",
                       "shared"};
local aa_side = false;
local switch_fbaim = false;
local switch_awall = false;
local fakeducking = false;
local time = 0.0;

local c_hud_chat =
    ffi.cast("unsigned long(__thiscall*)(void*, const char*)", mem.FindPattern("client.dll", "55 8B EC 53 8B 5D 08 56 57 8B F9 33 F6 39 77 28"))(
    ffi.cast("unsigned long**", ffi.cast("uintptr_t", mem.FindPattern("client.dll", "B9 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 5D 08")) + 1)[0],
    "CHudChat"
)

local ffi_print_chat = ffi.cast("void(__cdecl*)(int, int, int, const char*, ...)", ffi.cast("void***", c_hud_chat)[0][27])

function client.PrintChat(msg)
    ffi_print_chat(c_hud_chat, 0, 0, " " .. msg)
end

local vote_print_chat =
    (function()
    local on = gui.Checkbox(misc_box, "showvote", "Vote Revealer ", 1)

   

    callbacks.Register(
        "DispatchUserMessage",
        function(um)
            local lp = entities.GetLocalPlayer()
            if not (gui.GetValue("misc.master") and on:GetValue() and lp) then
                return
            end

            local team = lp:GetTeamNumber()
            local clr = team == 2 and "\09" or team == 3 and "\10" or "\01"
            if um:GetID() == 46 then
                local type = um:GetInt(3)
                local type_name =
                    type == 0 and "\07kick player " or type == 1 and " Change map " or type == 6 and "\04Surrender" or
                    type == 13 and "\07Call a timeout"

                client.PrintChat(
                    "[" .. clr .. "\02NiggaFish.lua\01] " .. client.GetPlayerNameByIndex(um:GetInt(2)) .. " wants to " .. type_name .. um:GetString(5)
                )
            end

            local results = um:GetID() == 47 and "\06Passed" or um:GetID() == 48 and "\02Failed"
            local _ = results and client.PrintChat("[" .. clr .. "\02NiggaFish.lua\01] " .. results)
        end
    )

    client.AllowListener("vote_cast")

    callbacks.Register(
        "FireGameEvent",
        function(e)
            local lp = entities.GetLocalPlayer()
            if not (gui.GetValue("misc.master") and on:GetValue() and lp) then
                return
            end

            if e:GetName() and e:GetName() == "vote_cast" then
                local team = lp:GetTeamNumber()
                local option = e:GetInt("vote_option")
                local results = option == 0 and "\06YES" or option == 1 and "\07NO" or "?"

                client.PrintChat(
                    "[" ..
                        (team == 2 and "\09" or team == 3 and "\10" or "\02") ..
                            "\02NiggaFish.lua\01] " .. client.GetPlayerNameByIndex(e:GetInt("entityid")) .. " " .. results
                )
            end
        end
    )
end)()

local function get_name(localplayer)
    if localplayer then
        local lp_index = client_GetLocalPlayerIndex()
        local n = client_GetPlayerNameByIndex(lp_index)
        return n
    else
        local n = client_GetConVar("name")
        return n
    end
end
local name = get_name(pattern)
local function rect(x, y, w, h, col)
    draw.Color(col[1], col[2], col[3], col[4]);
    draw.FilledRect(x, y, x + w, y + h);
end




local set_clan_tag = ffi.cast("int(__fastcall*)(const char*)", mem.FindPattern("engine.dll", "53 56 57 8B DA 8B F9 FF 15"))
local SetClantag= ffi.cast('int(__fastcall*)(const char*, const char*)', mem.FindPattern('engine.dll', '53 56 57 8B DA 8B F9 FF 15'))
function client.SetClanTag(...)
    local clan = ""

    for k, v in pairs({...}) do
        clan = tostring(clan .. v)
    end

    set_clan_tag(clan)
end
local animation={
  
    "NiggaFish.lua ",
    "NiggaFish.lu ",
    "NiggaFish.l ",
    "NiggaFish. ",
    "NiggaFish ",
    "NiggaFis ",
    "NiggaFi ",
    "NiggaF ",
    "Nigga ",
    "Nigg ",
    "Nig ",
    "Ni ",
    "N ",
    "U",
    "Us",
    "Use",
    "User",
    "User",
    "User:"..name,
    "User:"..name,
    "User:"..name,
    "N ",
    "Ni ",
    "Nig ",
    "Nigg ",
    "Nigga ",
    "NiggaF ",
    "NiggaFi ",
    "NiggaFis ",
    "NiggaFish ",
    "NiggaFish. ",
    "NiggaFish.l ",
    "NiggaFish.lu ",
    "NiggaFish.lua ",
    
}
function Clantag()
	if EnableClantag:GetValue()  then
		local CurTime = math.floor(globals.CurTime() * 2.3);
    	if OldTime ~= CurTime then
    	    SetClantag(animation[CurTime % #animation+1], animation[CurTime % #animation+1]);
    	end
    	OldTime = CurTime;
		clantagset = 1;
	else
		if clantagset == 1 then
            clantagset = 0;
            SetClantag("", "");
        end
	end
end
local last = nil
local tag = " "
local lasttag = nil
local tagsteps = {}
local SetTag = function(v)
    if v ~= last then
        SetClantag(v, "")
      last = v
    end
  end
  
  local function makesteps()
    tagsteps = {" "}
  
    for i = 1, #tag do
      table.insert(tagsteps, tag:sub(1, i))
    end
  
    for i = #tagsteps - 1, 1, -1 do
      table.insert(tagsteps, tagsteps[i])
    end
  end
  
  local function monkey()
    if enable:GetValue() then
      gui.SetValue("misc.clantag", false)
      tag = tagbox:GetValue()
      if tag:match("gamesense") then tag = "retard" end
      if lasttag ~= tag then
        makesteps()
        lasttag = tag
      end
      if speedslider:GetValue() == 0 then
        SetTag(tag)
      else
        SetTag(tagsteps[math.floor(globals.TickCount()/((11-speedslider:GetValue())*3.5))%(#tagsteps-1)+1])
      end
    else
      SetTag("")
    end
  end
  
  callbacks.Register("Draw", monkey)
  
  callbacks.Register("Unload", function()
    SetTag("")
  end)

local function gradient_h(x1, y1, x2, y2, col1, left)
    local w = x2 - x1;
    local h = y2 - y1;

    for i = 0, w do
        local a = (i / w) * 200;
        local r, g, b = col1[1], col1[2], col1[3];
        draw.Color(r, g, b, a);
        if left then
            draw.FilledRect(x1 + i, y1, x1 + i + 1, y1 + h);
        else
            draw.FilledRect(x1 + w - i, y1, x1 + w - i + 1, y1 + h);
        end
    end
end

local function gradient_v(x, y, w, h, col1, col2, down)
    rect(x, y, w, h, col1);

    local r, g, b = col2[1], col2[2], col2[3];

    for i = 1, h do
        local a = i / h * 255;
        if down then
            rect(x, y + i, w, 1, {r, g, b, a});
        else
            rect(x, y - i, w, 1, {r, g, b, a});
        end
    end
end

local function check(option)
    if not option:GetValue() then
        return false;
    end
    if not gui.GetValue("rbot.master") then
        return false;
    end
    local lc = entities.GetLocalPlayer();
    if not lc or not lc:IsAlive() then
        return false;
    end
    return true;
end

local function get_weapon_class(lp)
    local weapon_id = lp:GetWeaponID();

    if weapon_id == 11 or weapon_id == 38 then
        return "asniper";
    elseif weapon_id == 1 or weapon_id == 64 then
        return "hpistol";
    elseif weapon_id == 14 or weapon_id == 28 then
        return "lmg";
    elseif weapon_id == 2 or weapon_id == 3 or weapon_id == 4 or weapon_id == 30 or weapon_id == 32 or weapon_id == 36 or weapon_id == 61 or weapon_id == 63 then
        return "pistol";
    elseif weapon_id == 7 or weapon_id == 8 or weapon_id == 10 or weapon_id == 13 or weapon_id == 16 or weapon_id == 39 or weapon_id == 60 then
        return "rifle";
    elseif weapon_id == 40 then
        return "scout";
    elseif weapon_id == 17 or weapon_id == 19 or weapon_id == 23 or weapon_id == 24 or weapon_id == 26 or weapon_id == 33 or weapon_id == 34 then
        return "smg";
    elseif weapon_id == 25 or weapon_id == 27 or weapon_id == 29 or weapon_id == 35 then
        return "shotgun";
    elseif weapon_id == 9 then
        return "sniper";
    elseif weapon_id == 31 then
        return "zeus";
    end

    return "shared";
end

local function antiaim()
    if not check(legit_aa_enable) then
        return;
    end

 

    if fakeducking then
        gui.SetValue("rbot.antiaim.base", "0.0 Off");
        return;
    end

    gui.SetValue("rbot.antiaim.base", "0.0 Desync");
    gui.SetValue("rbot.antiaim.advanced.pitch", 0);
    gui.SetValue("rbot.antiaim.advanced.autodir.edges", 0);
    gui.SetValue("rbot.antiaim.advanced.autodir.targets", 0);

    if legit_aa_key:GetValue() ~= 0 then
        if input.IsButtonPressed(legit_aa_key:GetValue()) then
            if not aa_side then
                if legit_aa_type:GetValue() == 0 then
                    gui.SetValue("rbot.antiaim.base.rotation", -58);
                elseif legit_aa_type:GetValue() == 1 then
                    gui.SetValue("rbot.antiaim.base.rotation", -35);
                end
                gui.SetValue("rbot.antiaim.base.lby", 120);
                aa_side = true;
            else
                if legit_aa_type:GetValue() == 0 then
                    gui.SetValue("rbot.antiaim.base.rotation", 58);
                elseif legit_aa_type:GetValue() == 1 then
                    gui.SetValue("rbot.antiaim.base.rotation", 35);
                end
                gui.SetValue("rbot.antiaim.base.lby", -120);
                aa_side = false;
            end
        end
    end
end
function gradient(x1, y1, x2, y2, left)
    local w = x2 - x1
    local h = y2 - y1
 
    for i = 0, w do
        local a = (i / w) * 200
 
        draw.Color(0, 0, 0, a)
        if left then
            draw.FilledRect(x1 + i, y1, x1 + i + 1, y1 + h)
        else
            draw.FilledRect(x1 + w - i, y1, x1 + w - i + 1, y1 + h)
        end
    end
end
local function dynamic()
    if not check(dynamic_enable) then
        return;
    end

    if dynamic_min_slider:GetValue() > dynamic_max_slider:GetValue() then
        return;
    end

    if math.abs(globals.CurTime() - time) > 1 then
        gui.SetValue("rbot.aim.target.fov", math.random(dynamic_min_slider:GetValue(), dynamic_max_slider:GetValue()));
        time = globals.CurTime();
    end
end

local function switch()

    local lc = entities.GetLocalPlayer();
   if lc and lc:IsAlive() then
        local x, y = draw.GetScreenSize()
        local centerX = x / 2
     

        draw.SetFont(updaterfont1);


        draw.Color(15,15,15,235);
		draw.FilledRect(0 , 510, 170 , 536);

        draw.Color(255,220,220,255);
        draw.Text(5, 517, "SemiRage - by Niggafish47");

		draw.Color(15,15,15,205);
		draw.FilledRect(0 , 537, 170 , 690);

		draw.Color(255, 0, 0,255);
		draw.FilledRect( 0 , 536, 170, 537);
      
      
		
        draw.SetFont(font1);
        	
        draw.Color(255, 255, 255, 255);
        draw.Text(screen_w / 2 - 941, screen_h / 2, "Fov:");
        draw.Text(screen_w / 2 - 941, screen_h / 2 + 40, "DMG:");
        draw.Text(screen_w / 2 - 941, screen_h / 2 + 120, "Accuracy:");

        draw.Color(0, 255, 0, 255);

        draw.Text(screen_w / 2 - 900, screen_h / 2, gui.GetValue("rbot.aim.target.fov"," °"));
        draw.Color(0, 255, 0, 255);
        draw.Text(screen_w / 2 - 890, screen_h / 2 + 40, gui.GetValue("rbot.accuracy.weapon." .. get_weapon_class(lc) .. ".mindmg"));

        if switch_awall then
            draw.Color(0, 255, 0, 255);
            draw.Text(screen_w / 2 - 941, screen_h / 2 + 60, "AWALL");
        else
            draw.Color(255, 0, 0, 255);
            draw.Text(screen_w / 2 - 941, screen_h / 2 + 60, "AWALL");
        end

        if switch_fbaim then
            draw.Color(0, 255, 0, 255);
            draw.Text(screen_w / 2 - 941, screen_h / 2 + 80, "Baim");
        else
            draw.Color(255, 0, 0, 255);
            draw.Text(screen_w / 2 - 941, screen_h / 2 + 80, "Baim");
        end

        if gui.GetValue("rbot.accuracy.posadj.resolver") then
            draw.Color(0, 255, 0, 255);
            draw.Text(screen_w / 2 - 941, screen_h / 2 + 100, "Resolver");
        else
            draw.Color(255, 0, 0, 255);
            draw.Text(screen_w / 2 - 941, screen_h / 2 + 100, "Resolver");
        end

        local accuracy = 100 - math.floor(entities.GetLocalPlayer():GetWeaponInaccuracy() * 10 ^ 3 + 0.5) / 10 ^ 3 * 100;

        if accuracy > 90 then
            draw.Color(0, 255, 0, 255);
            draw.Text(screen_w / 2 - 850, screen_h / 2 + 120, "High");
        else
            draw.Color(255, 0, 0, 255);
            draw.Text(screen_w / 2 - 850, screen_h / 2 + 120, "Low");
        end
        if (gui.GetValue("rbot.master") == true ) and (gui.GetValue("rbot.aim.enable") == true) then
            onoroff = "Rage"
            draw.Color(0, 255, 0, 255)
            draw.Text(screen_w / 2 - 941, screen_h / 2 + 20, onoroff)     
            else
            onoroff = "Rage"
            draw.Color(255, 0, 0, 255)
            draw.Text(screen_w / 2 - 941, screen_h / 2 + 20, onoroff)     
            
        end
   end
 
    if not check(switch_enable) then
        return;
    end

    if switch_fbaim_key:GetValue() ~= 0 then
        if input.IsButtonPressed(switch_fbaim_key:GetValue()) then
            if not switch_fbaim then
                for i, v in next, weapons_table do
                    gui.SetValue("rbot.hitscan.mode." .. v .. ".bodyaim.force", 1);
                end
                switch_fbaim = true;
            else
                for i, v in next, weapons_table do
                    gui.SetValue("rbot.hitscan.mode." .. v .. ".bodyaim.force", 0);
                end
                switch_fbaim = false;
            end
        end
    end

    if switch_awall_key:GetValue() ~= 0 then
        if input.IsButtonPressed(switch_awall_key:GetValue()) then
            if not switch_awall then
                for i, v in next, weapons_table do
                    gui.SetValue("rbot.hitscan.mode." .. v .. ".autowall", 1);
                end
                switch_awall = true;
            else
                for i, v in next, weapons_table do
                    gui.SetValue("rbot.hitscan.mode." .. v .. ".autowall", 0);
                end
                switch_awall = false;
            end
        end
    end
end

local teamDamageArray = {}

local function gameEvents(event)

	if event:GetName() == "weapon_fire" then
		lPlayer = entities.GetLocalPlayer()
		lPlayerTeam = lPlayer:GetTeamNumber()
	end

	if event:GetName() == "player_hurt" or event:GetName() == "player_death" then
		local attacker = event:GetInt("attacker")
		local victim = event:GetInt("userid")
		local dmgdone = event:GetInt("dmg_health")
		local attackerIndex = client.GetPlayerIndexByUserID(attacker)
		local victimIndex = client.GetPlayerIndexByUserID(victim)
		local attackerName = client.GetPlayerNameByUserID(attacker)
		local attackerUID = entities.GetByUserID(attacker)
		local victimUID = entities.GetByUserID(victim)
		local attackerTeam = attackerUID:GetTeamNumber()
		local victimTeam = victimUID:GetTeamNumber()
		local attackerPlayerInfo = client.GetPlayerInfo(attackerIndex)
		local victimPlayerInfo = client.GetPlayerInfo(victimIndex)
		local attackerSteamID = attackerPlayerInfo["SteamID"]
		local victimSteamID = victimPlayerInfo["SteamID"]

		if event:GetName() == "player_hurt" then
			local lPlayerTeam = lPlayer:GetTeamNumber()
			if victimTeam == lPlayerTeam and attackerTeam == lPlayerTeam and victimIndex ~= attackerIndex then
				if teamDamageArray[attackerSteamID] == nil then
					teamDamageArray[attackerSteamID] = {0, 0, attackerName}
				end
				teamDamageArray[attackerSteamID][1] = teamDamageArray[attackerSteamID][1] + dmgdone
			end
		elseif event:GetName() == "player_death" then
			local lPlayerTeam = lPlayer:GetTeamNumber()
			if victimTeam == lPlayerTeam and attackerTeam == lPlayerTeam and victimIndex ~= attackerIndex then
				teamDamageArray[attackerSteamID][2] = teamDamageArray[attackerSteamID][2] + 1
			end
		end
	end
	if event:GetName() == "cs_win_panel_match" then
		teamDamageArray = {}
	end
end



screenSize = {0, 0}
local function draw_Func()
	screenSize = {draw.GetScreenSize()}
	local playerCount = 0
	for i, v in pairs(teamDamageArray) do

        local lc = entities.GetLocalPlayer();
        if lc and lc:IsAlive() then
			if playerCount % 2 == 0 then
				draw.Color(50, 50, 50, 255)
			else
				draw.Color(20, 20, 20, 255)
			end

			if v[3]:len() > 15 then
				v[3] = v[3]:sub(1, 15).."..."
			end

           
			draw.FilledRect(screenSize[1] - select(1, draw.GetTextSize("Damage: 300")) - 53, screenSize[2] * 0.187 + (screenSize[2] * 0.027 * playerCount), screenSize[1], screenSize[2] * 0.214 + (screenSize[2] * 0.027 * playerCount))
		
			if v[2] == 0 then
				draw.Color(245, 245, 245, 255)
			elseif v[2] == 1 then
				draw.Color(245, 245, 0, 255)
			elseif v[2] == 2 then
				draw.Color(245, 150, 0, 255)
			elseif v[2] >= 3 then
				draw.Color(245, 0, 0, 255)				
			end
			draw.TextShadow(screenSize[1] - select(1, draw.GetTextSize("Kills: 0")) - 5, screenSize[2] * 0.2 + (screenSize[2] * 0.027 * playerCount), "Kills: "..v[2])	

		
			if v[1] < 100 then
				draw.Color(245, 245, 0, 255)
			elseif v[1] > 99 and v[1] < 199 then
				draw.Color(245, 150, 0, 255)
			elseif v[1] > 200 then
				draw.Color(245, 0, 0, 255)
			end
			draw.TextShadow(screenSize[1] - select(1, draw.GetTextSize("Damage: 300")) - 50, screenSize[2] * 0.2 + (screenSize[2] * 0.027 * playerCount), "Damage: "..v[1])

	
			draw.Color(255, 255, 255, 255)
			draw.TextShadow(screenSize[1] - select(1, draw.GetTextSize("Damage: 300")) - 50, screenSize[2] * 0.189 + (screenSize[2] * 0.027 * playerCount), v[3])
			

			playerCount = playerCount + 1
		end
	end
end





local function main()
    if legit_aa_dis_on_fd:GetValue() then
        local fdvalue = gui.GetValue("rbot.antiaim.extra.fakecrouchkey");
        if fdvalue ~= 0 then
            if input.IsButtonDown(fdvalue) then
                fakeducking = true;
            else
                fakeducking = false;
            end
        end
    else
        fakeducking = false;
    end

    if check(main_fixrevolver) then
        local weaponid = entities.GetLocalPlayer():GetPropEntity("m_hActiveWeapon"):GetWeaponID();

        if weaponid == 64 then
            gui.SetValue("misc.fakelag.enable", false);
        else
            gui.SetValue("misc.fakelag.enable", true);
        end
    end

 

end












 

local frame_rate = 0.0
local get_abs_fps = function()
    frame_rate = 0.9 * frame_rate + (1.0 - 0.9) * globals.AbsoluteFrameTime()
    return math.floor((1.0 / frame_rate) + 0.5)
end
 
 
local kills  = {}
local deaths = {}
 
local function KillDeathCount(event)
 
	local local_player = client.GetLocalPlayerIndex( );
	local INDEX_Attacker = client.GetPlayerIndexByUserID( event:GetInt( 'attacker' ) );
	local INDEX_Victim = client.GetPlayerIndexByUserID( event:GetInt( 'userid' ) );
 
	if (event:GetName( ) == "client_disconnect") or (event:GetName( ) == "begin_new_match") then
		kills = {}
		deaths = {}
	end
 
	if event:GetName( ) == "player_death" then
		if INDEX_Attacker == local_player then
			kills[#kills + 1] = {};
		end
 
		if (INDEX_Victim == local_player) then
			deaths[#deaths + 1] = {};
		end
 
	end
end
 
function paint_traverse()
    local lc = entities.GetLocalPlayer();
   if lc and lc:IsAlive() then
    local x, y = draw.GetScreenSize()
    local centerX = x / 2
 
   
    gradient(centerX - 200, y - 20, centerX - 51, y, 0, true)
    gradient(centerX - 200, y - 20, centerX - 51, y - 19, true)

    gradient(centerX - 100, y - 40, centerX - 51, y, 0, true)
    gradient(centerX - 100, y - 40, centerX - 51, y - 19, true)


    draw.Color(0, 0, 0, 200)
    draw.FilledRect(centerX - 50, y - 20, centerX + 50, y)
 
    draw.Color(0, 0, 0, 255)
    draw.FilledRect(centerX - 50, y - 20, centerX + 50, y - 19)

 draw.Color(0, 0, 0, 200)
 draw.FilledRect(centerX - 50, y - 40, centerX + 50, y)

 draw.Color(0, 0, 0, 255)
 draw.FilledRect(centerX - 50, y - 40, centerX + 50, y - 19)

    gradient(centerX + 50, y - 20, centerX + 200, y, false)
    gradient(centerX + 50, y - 20, centerX + 200, y - 19, false)

 gradient(centerX + 50, y - 40, centerX + 100, y, false)
 gradient(centerX + 50, y - 40, centerX + 100, y - 19, false)
 

  draw.Color(255, 255, 255, 255)
    draw.Text(centerX - 35,  y - 35, "Nigga      .lua")
    draw.Color(255, 0, 0, 255)
    draw.Text(centerX - 0,  y - 35, "Fish")
   draw.Color(255, 255, 255, 255)
   draw.Text(centerX - 60,  y - 15," |-> ".. UserName.." <-|");
 

    draw.Color(255, 255, 255, 255)
    draw.Text(centerX - 100, y - 15, #kills)
 
    draw.Color(0, 255, 0, 255)
    draw.Text(centerX - 135, y - 15, "Kills:")
 

    draw.Color(255, 255, 255, 255)
    draw.Text(centerX + 155, y - 15, #deaths)
 
    draw.Color(255, 50, 50, 255)
    draw.Text(centerX + 105, y - 15, "Deaths:")
    end
end











callbacks.Register(
    "Draw",
    function()
        if main_switch:GetValue() then
            client.Command("cl_timeout -1", true)
        end

        if fullupdate_key:GetValue() ~= 0 and input.IsButtonDown(fullupdate_key:GetValue()) then
            client.Command("cl_fullupdate 1", true)
        end
    end
)
callbacks.Register('Draw', function()
	if EngineRadar:GetValue() == true then
		isEngineRadarOn = 1
	else
		isEngineRadarOn = 0
	end

	for index, Player in pairs(entities.FindByClass('CCSPlayer')) do
        Player:SetProp('m_bSpotted', isEngineRadarOn)
	end
end)
callbacks.Register("Draw",Clantag)
client.AllowListener( "player_death" );
client.AllowListener( "client_disconnect" );
client.AllowListener( "begin_new_match" );
callbacks.Register( "FireGameEvent", "KillDeathCount", KillDeathCount);
callbacks.Register("Draw", "paint_traverse", paint_traverse);
callbacks.Register("Draw", function()
    if key:GetValue() ~= 0 then
        if input.IsButtonPressed(key:GetValue()) then
 pressed=true;
 elseif (pressed and input.IsButtonReleased(key:GetValue())) then
 pressed=false;
 if gui.GetValue("rbot.master") then
 gui.SetValue("rbot.master", false)
 gui.SetValue("lbot.master", true)
 else
 gui.SetValue("rbot.master", true)
 gui.SetValue("lbot.master", false)
 end
 end
    end
 
end)

client.AllowListener("player_death")
client.AllowListener("player_hurt")
client.AllowListener("weapon_fire")
client.AllowListener("cs_win_panel_match")
callbacks.Register("FireGameEvent", "gameEvents", gameEvents)
callbacks.Register("Draw", "draw_Func", draw_Func)


callbacks.Register(
    "Draw",
    function()
        local lp = entities.GetLocalPlayer()

        if not entities.GetLocalPlayer() then
            return
        end

        local name = {"Off"}
        local clan = {}

        for k, v in pairs(entities.FindByClass("CCSPlayer")) do
            local idx = v:GetIndex()
            local m_szClan = idx ~= lp:GetIndex() and entities.GetPlayerResources():GetPropString("m_szClan", idx)
            if m_szClan then
                table.insert(name, v:GetName())
                table.insert(clan, m_szClan)
            end
        end

        stealclan:SetOptions(unpack(name))

        if clan[stealclan:GetValue()] and entities.GetPlayerResources():GetPropString("m_szClan", lp:GetIndex()) ~= clan[stealclan:GetValue()] then
            client.SetClanTag(clan[stealclan:GetValue()])
        end
    end
)

callbacks.Register("Draw", "legit_aa", antiaim);
callbacks.Register("Draw", "dynamic_fov", dynamic);
callbacks.Register("Draw", "switch", switch);
callbacks.Register("Draw", "defaults", main);

print("Welocme to NiggaFish.lua "..UserName.."!")