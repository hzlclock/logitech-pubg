----------------------------------------------------------------------------
----------------        Basic Variable       -----------------------------
----------------         Do not edit                 ---------------------
--------------------------------------------------------------------------
local current_weapon = "none"

--------------------------------------------------------------------------
----------------        Basic Setting       ------------------------------
--------------------------------------------------------------------------

---- key bind ----

local ump9_key = 4
local akm_key = 6
local m16a4_key = nil
local m16a4_key_pressed = false
local m416_key = 7
local scarl_key = nil
local uzi_key = 5

local trigger_key = 7

local set_off_key = 6

local functional = -1


---- fire key ----

local aim_key = 3
local fire_key = "pause"
local mode_switch_key = "scrolllock"
local auto_ads_key = "capslock"


---- ignore key ----
---- can use "lalt", "ralt", "alt"  "lshift", "rshift", "shift"  "lctrl", "rctrl", "ctrl"

local ignore_key = "lshift"

--- Sensitivity in Game
--- default is 50.0

local target_sensitivity = 50
local scope_sensitivity = 47
local scope4x_sensitivity = 44

---- Obfs setting
---- Two firing time intervals = weapon_speed * interval_ratio * ( 1 + random_seed * ( 0 ~ 1))
local weapon_speed_mode = false
-- local obfs_mode = false
local obfs_mode = true
local interval_ratio = 0.75
local random_seed = 1

--------------------------------------------------------------------------
----------------        Recoil Table        ------------------------------
---------------- You can fix the value here ------------------------------
--------------------------------------------------------------------------

local recoil_table = {}

recoil_table["ump9"] = {
    basic={18,19,18,19,18,19,19,21,23,24,23,24,23,24,23,24,23,24,23,24,23,24,24,25,24,25,24,25,24,25,24,25,25,26,25,26,25,26,25,26,25,26,25,26,25,26},
    quadruple={83.3,83.3,83.3,83.3,83.3,83.3,83.3,116.7,116.7,116.7,116.7,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3},
    speed = 92
}

-- recoil_table["akm"] = {
--     basic={23.7,23.7,23.7,23.7,23.7,23.7,23.7,23.7,23.7,23.7,23.7,28,28,28,28,29.7,29.7,29.7,29.7,29.7,29.7,29.7,29.7,29.7,29.7,29.7,29.7,29.7,29.7,29.7,29.7,29.7,29.7,29.7,29.7,29.7,29.7,29.7,29.7,29.7},
--     quadruple={66.7,66.7,66.7,66.7,66.7,66.7,66.7,66.7,66.7,66.7,66.7,123.3,123.3,123.3,123.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3},
--     speed = 100
-- }

recoil_table["akm"] = {
    basic={25,25,25,29,33,33,32,33,32,32,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30},
    quadruple={86.7,86.7,86.7,86.7,86.7,86.7,86.7,150,150,150,150,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120},
    speed = 100
}

-- recoil_table["m16a4"] = {
--     basic={25,25,25,29,33,33,32,33,32,32,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30},
--     quadruple={86.7,86.7,86.7,86.7,86.7,86.7,86.7,150,150,150,150,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120},
--     speed = 75
-- }

recoil_table["m416"] = {
    basic={21,21,21,21,21,21,21,21,21,23,23,24,23,24,25,25,26,27,27,32,31,31,31,31,31,31,31,32,32,32,35,35,35,35,35,35,35,35,35,35,35},
    quadruple={86.7,86.7,86.7,86.7,86.7,86.7,86.7,150,150,150,150,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7},
    speed = 86
}

recoil_table["scarl"] = {
    basic={20,21,22,21,22,22,23,22,23,23,24,24,25,25,25,25,26,27,28,29,30,32,34,34,35,34,35,34,35,34,35,34,34,34,34,34,35,35,35,35,35,35,35,35,35,35},
    quadruple={86.7,86.7,86.7,86.7,86.7,86.7,86.7,150,150,150,150,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7},
    speed = 96
}

recoil_table["uzi"] = {
    basic={16,17,18,20,21,22,23,24,25,26,28,30,32,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34},
    quadruple={13.3,13.3,13.3,13.3,13.3,21.7,21.7,21.7,21.7,21.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7},
    speed = 48
}

recoil_table["none"] = {
    basic={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
    quadruple={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
    speed = 60
}

local lean_base=10.0;
local lean_ran=20.0;


--------------------------------------------------------------------------
----------------          Function          ------------------------------
--------------------------------------------------------------------------


function convert_sens(unconvertedSens) 
    return 0.002 * math.pow(10, unconvertedSens / 50)
end

function calc_sens_scale(sensitivity)
    return convert_sens(sensitivity)/convert_sens(50)
end

local target_scale = calc_sens_scale(target_sensitivity)
local scope_scale = calc_sens_scale(scope_sensitivity)
local scope4x_scale = calc_sens_scale(scope4x_sensitivity)

function recoil_mode()
    if IsKeyLockOn(mode_switch_key) then
        return "quadruple";
    else
        return "basic";
    end
end


function recoil_value(_factor,_duration)
    return_mod=1.2
	
    if _duration<20.0 then
    	return_mod=return_mod*2
    end
    if _factor>2.5 then
        if _duration>350.0 then 
            _duration=350.0
        end
        if _duration>300.0 then
            return_mod=return_mod*1.3
            OutputLogMessage("RETURN_MOD=1.5\n")
        end
    elseif _factor<1.7 then
		
		if _duration>200.0 then
			OutputLogMessage("M249_MAX\n")
        		_duration=100.0
   		end
		return_mod=return_mod*(1.3+3.0*_duration/1000.0)
    elseif _duration>500.0 then
        _duration=500.0
    end
    local v=factor*(0.5+1.1*_duration/1000.0)
    -- if v<factor*0.5 then
    --     v=factor*0.5
    -- end
        return v*6*return_mod;

end

-- function recoil_value(_factor,_duration)
--     _factor=3
--     local v=3.0+(1.4*_duration)/86.0, 8.0
--     if (v>8.0) then
--         v=8.0
--     end
--     return v*50.0/86.0/4.0
-- end

-- math.randomseed(os.time())

function bool2int(value)
    return value and 1 or 0
end

function OnEvent(event, arg)
    
    local fire_key_pressed = -1
    OutputLogMessage("event = %s, arg = %d\n", event, arg)
    if (event == "PROFILE_ACTIVATED") then
        EnablePrimaryMouseButtonEvents(true)
    elseif event == "PROFILE_DEACTIVATED" then
        current_weapon = "none"
        shoot_duration = 0.0
        ReleaseKey(fire_key)
        ReleaseMouseButton(9)
    end

    if (event == "MOUSE_BUTTON_PRESSED" and arg == 4) then
        factor=1.5
        fire_key_pressed = 1
    elseif (event == "MOUSE_BUTTON_PRESSED" and arg == 5) then
        factor=1.8
        fire_key_pressed = 1
    elseif (event == "MOUSE_BUTTON_PRESSED" and arg == 6) then
        factor=2.2
        fire_key_pressed = 1
    elseif (event == "MOUSE_BUTTON_PRESSED" and arg == 7) then
        factor=2.7
        fire_key_pressed = 1
    elseif (event == "MOUSE_BUTTON_PRESSED" and arg == 12) then
        PressAndReleaseKey(mode_switch_key)
    end
    
    if fire_key_pressed == 1 then 
        functional = -functional
        OutputLogMessage("Functional = %d\n", functional )
    end
    
    if (event == "MOUSE_BUTTON_PRESSED" and arg == 10) then
        PressMouseButton(1);
        -- PressKey(fire_key)
    end
    if (event == "MOUSE_BUTTON_RELEASED" and arg == 10) then
        ReleaseMouseButton(1);
        -- ReleaseKey(fire_key)
    end
    OutputLogMessage(math.random())

    if (event == "MOUSE_BUTTON_PRESSED" and arg == 2 and functional == 1) then
        if (IsKeyLockOn(auto_ads_key)) then
            local lean_duration= 0.0
            local swap_time = lean_base+math.random()*lean_ran
            local next_leankey = "q"
            PressKey("e")
            repeat 
                lean_duration = lean_duration+1.0
                -- OutputLogMessage("LEAN_DUR_%f,1[%d]2[%d]\n",lean_duration, bool2int(IsMouseButtonPressed(1)), bool2int(IsMouseButtonPressed(3)))
                if (lean_duration>swap_time) then
                    OutputLogMessage("LEAN_SHIFT_%f\n",lean_duration)
                    ReleaseKey("q")
                    ReleaseKey("e")
                    PressKey(next_leankey)
                    if (next_leankey=="q") then
                        next_leankey="e"
                    else
                        next_leankey="q"
                    end
                    lean_duration = 0.0
                    swap_time = lean_base+math.random()*lean_ran
                end
                Sleep(1)
            until IsMouseButtonPressed(1) or (not IsMouseButtonPressed(3))
            ReleaseKey("q")
            ReleaseKey("e")
        end
    end

    if (event == "MOUSE_BUTTON_PRESSED" and arg == 1 and functional == 1) then

       
        -- if (recoil_mode() == "basic" and IsKeyLockOn(auto_ads_key))  then
            -- PressAndReleaseMouseButton(aim_key)
        -- end
        local lean_duration= 0.0
        local shoot_duration = 0.0
        intervals=1.0
        havent_moved=0.0
        local lean_duration= 0.0
        local swap_time = lean_base+math.random()*lean_ran
        local next_leankey = "q"
        -- if (IsKeyLockOn(auto_ads_key)) then
        --     PressKey("e")
        -- end
        repeat
            local recovery = recoil_value(factor,shoot_duration)
            Sleep(1)
            OutputLogMessage( "%d | Fix = %f\n",shoot_duration, recovery )
            havent_moved=havent_moved+recovery
            while(havent_moved>1.0)
            do
                MoveMouseRelative(0, 1)
                -- OutputLogMessage( "MOV\n", recovery )
                havent_moved=havent_moved-1.0
            end 
            shoot_duration = shoot_duration + intervals*7
            if (IsKeyLockOn(auto_ads_key)) then
                lean_duration = lean_duration+1.0
                -- OutputLogMessage("LEAN_DUR_%f,1[%d]2[%d]\n",lean_duration, bool2int(IsMouseButtonPressed(1)), bool2int(IsMouseButtonPressed(3)))
                if (lean_duration>swap_time) then
                    OutputLogMessage("LEAN_SHIFT_%f\n",lean_duration)
                    ReleaseKey("q")
                    ReleaseKey("e")
                    PressKey(next_leankey)
                    if (next_leankey=="q") then
                        next_leankey="e"
                    else
                        next_leankey="q"
                    end
                    lean_duration = 0.0
                    swap_time = lean_base+math.random()*lean_ran
                end
            end
        until not IsMouseButtonPressed(1)
        if (IsKeyLockOn(auto_ads_key)) then
            ReleaseKey("q")
            ReleaseKey("e")
        end
    elseif (event == "MOUSE_BUTTON_RELEASED" and arg == 1 and functional == 1) then
        if (IsKeyLockOn(auto_ads_key)) then
            local lean_duration= 0.0
            local swap_time = lean_base+math.random()*lean_ran
            local next_leankey = "q"
            PressKey("e")
            repeat 
                lean_duration = lean_duration+1.0
                -- OutputLogMessage("LEAN_DUR_%f,1[%d]2[%d]\n",lean_duration, bool2int(IsMouseButtonPressed(1)), bool2int(IsMouseButtonPressed(3)))
                if (lean_duration>swap_time) then
                    OutputLogMessage("LEAN_SHIFT_%f\n",lean_duration)
                    ReleaseKey("q")
                    ReleaseKey("e")
                    PressKey(next_leankey)
                    if (next_leankey=="q") then
                        next_leankey="e"
                    else
                        next_leankey="q"
                    end
                    lean_duration = 0.0
                    swap_time = lean_base+math.random()*lean_ran
                end
                Sleep(1)
            until IsMouseButtonPressed(1) or (not IsMouseButtonPressed(3))
            ReleaseKey("q")
            ReleaseKey("e")
        end
    end
    
    
    
    fire_key_pressed = -1
end