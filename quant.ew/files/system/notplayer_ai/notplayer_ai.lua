local ctx = dofile_once("mods/quant.ew/files/core/ctx.lua")
local wandfinder = dofile_once("mods/quant.ew/files/system/notplayer_ai/wandfinder.lua")

local MAX_RADIUS = 128*4

local state = nil

local module = {}

local function log(...)
    -- GamePrint(...)
end

local function aim_at(world_x, world_y)
    local ch_x, ch_y = EntityGetTransform(state.entity)
    local dx, dy = world_x - ch_x, world_y - ch_y
    ComponentSetValue2(state.control_component, "mAimingVector", dx, dy)
    
    -- No idea what coordinate system that field uses.
    -- Writing a big positive/negative value to turn to the right side seems to work.
    local mouse_x
    if dx > 0 then
        mouse_x = 100000
    else
        mouse_x = -100000
    end
    ComponentSetValue2(state.control_component, "mMousePosition", mouse_x, 0)
    
    local dist = math.sqrt(dx * dx + dy * dy)
    if dist > 0 then
        -- ComponentSetValue2(state.control_component, "mAimingVectorNonZeroLatest", dx, dy)
        ComponentSetValue2(state.control_component, "mAimingVectorNormalized", dx/dist, dy/dist)
    end
end

local function fire_wand(enable)
    ComponentSetValue2(state.control_component, "mButtonDownFire", enable)
    ComponentSetValue2(state.control_component, "mButtonDownFire2", enable)
    if enable then
        if not state.was_firing_wand then
            ComponentSetValue2(state.control_component, "mButtonFrameFire", GameGetFrameNum()+1)
        end
        ComponentSetValue2(state.control_component, "mButtonLastFrameFire", GameGetFrameNum())
    end
    state.was_firing_wand = enable
end


local function init_state()
    state = {
        entity = ctx.my_player.entity,
        control_component = EntityGetFirstComponentIncludingDisabled(ctx.my_player.entity, "ControlsComponent"),
        
        attack_wand = wandfinder.find_attack_wand(),

        was_firing_wand = false,
        was_a = false,
        was_w = false,
        was_d = false,
        init_timer = 0,

        control_a = false,
        control_w = false,
        control_d = false,
    }
end

local target = nil

local last_length = nil

local last_did_hit = false

local function is_suitable_target(entity)
    return EntityGetIsAlive(entity) and not EntityHasTag(entity,"ew_notplayer")
end

local function choose_wand_actions()
    if state.attack_wand ~= nil and target ~= nil and EntityGetIsAlive(target) then
        np.SetActiveHeldEntity(state.entity, state.attack_wand, false, false)
        local t_x, t_y = EntityGetFirstHitboxCenter(target)
        if t_x == nil then
            t_x, t_y = EntityGetTransform(target)
        end
        aim_at(t_x, t_y)

        fire_wand(not last_did_hit)
        return
    end
    fire_wand(false)
end

local last_my_y = 0

local stop_y = false

local get_close = false

local swap_side = false

local on_right = false

local function choose_movement()
    if target == nil then
        state.control_a = false
        state.control_d = false
        state.control_w = false
        stop_y = false
        get_close = false
        swap_side = false
        on_right = false
        return
    end
    local my_x, my_y = EntityGetTransform(ctx.my_player.entity)
    local t_x, t_y = EntityGetTransform(target)
    local dist = my_x - t_x
    local LIM = 100
    if get_close and t_y < my_y + 40 then
        LIM = 0
    end
    if swap_side then
        dist = -dist
    end
    if dist > 0 then
        state.control_a = dist > LIM
        state.control_d = not state.control_a
    else
        state.control_a = dist > -LIM
        state.control_d = not state.control_a
    end
    if (not stop_y) and ((last_did_hit and t_y < my_y + 80) or t_y < my_y) and (GameGetFrameNum() % 300) < 200 then
        state.control_w = last_my_y ~= my_y
        if last_my_y == my_y then
            stop_y = true
        end
    else
        if stop_y and (GameGetFrameNum() % 300) > 200 then
            stop_y = false
        end
        state.control_w = (GameGetFrameNum() % 60) > 45
    end

    if last_did_hit and t_y < my_y + 40 then
        local did_hit_1, _, _ = RaytracePlatforms(my_x, my_y, t_x, my_y)
        local did_hit_2, _, _ = RaytracePlatforms(t_x, my_y, t_x, t_y)
        if did_hit_1 and (not did_hit_2) then
            get_close = true
        end
    end

    if t_y < my_y - 10 then
        get_close = false
    end

    if (not last_did_hit) and get_close then
        get_close = false
        swap_side = true
        on_right = my_x > t_x
    end

    if swap_side and on_right ~= (my_x > t_x) then
        swap_side = false
    end

    local did_hit_1, _, _ = RaytracePlatforms(my_x, my_y, my_x+5, my_y)
    local did_hit_2, _, _ = RaytracePlatforms(my_x, my_y, my_x-5, my_y)
    if (did_hit_1 and my_x > t_x) or (did_hit_2 and my_x < t_x) then
        get_close = false
        swap_side = true
        on_right = my_x > t_x
    end

    last_my_y = my_y
end

local function update()
    -- No taking control back, even after pressing esc.
    ComponentSetValue2(state.control_component, "enabled", false)

    state.init_timer = state.init_timer + 1

    local ch_x, ch_y = EntityGetTransform(state.entity)
    local potential_targets = EntityGetInRadiusWithTag(ch_x, ch_y, MAX_RADIUS, "ew_client") or {}
    local x, y = EntityGetTransform(ctx.my_player.entity)

    if target ~= nil and not is_suitable_target(target) then
        target = nil
        last_length = nil
        last_did_hit = false
    end
    if target ~= nil then
        local t_x, t_y = EntityGetFirstHitboxCenter(target)
        if t_x == nil then
            t_x, t_y = EntityGetTransform(target)
        end
        local did_hit, _, _ = RaytracePlatforms(x, y, t_x, t_y)
        last_did_hit = did_hit
    end

    log("Trying to choose target")
    for _, potential_target in ipairs(potential_targets) do
        log("Trying "..potential_target)
        if is_suitable_target(potential_target) then
            local t_x, t_y = EntityGetFirstHitboxCenter(potential_target)
            if t_x == nil then
                t_x, t_y = EntityGetTransform(potential_target)
            end
            local dx = x - t_x
            local dy = y - t_y
            local length = dx * dx + dy * dy
            local did_hit, _, _ = RaytracePlatforms(x, y, t_x, t_y)
            if last_length == nil or (not did_hit and (last_length > length or not last_did_hit)) then
                last_length = length
                last_did_hit = did_hit
                target = potential_target
            end
        end
    end

    local do_kick = last_length ~= nil and last_length < 100

    if do_kick then
        fire_wand(false)
        ComponentSetValue2(state.control_component, "mButtonDownKick", true)
        ComponentSetValue2(state.control_component, "mButtonFrameKick", GameGetFrameNum()+1)
    else
        ComponentSetValue2(state.control_component, "mButtonDownKick", false)
        choose_wand_actions()
    end
    choose_movement()

    ComponentSetValue2(state.control_component, "mButtonDownLeft", state.control_a)
    if state.control_a and not state.was_a then
        ComponentSetValue2(state.control_component, "mButtonFrameLeft", GameGetFrameNum()+1)
    end
    state.was_a = state.control_a

    ComponentSetValue2(state.control_component, "mButtonDownRight", state.control_d)
    if state.control_d and not state.was_d then
        ComponentSetValue2(state.control_component, "mButtonFrameRight", GameGetFrameNum()+1)
    end
    state.was_d = state.control_d

    ComponentSetValue2(state.control_component, "mButtonDownUp", state.control_w)
    ComponentSetValue2(state.control_component, "mButtonDownFly", state.control_w)
    if state.control_w and not state.was_w then
        ComponentSetValue2(state.control_component, "mButtonFrameUp", GameGetFrameNum()+1)
        ComponentSetValue2(state.control_component, "mButtonFrameFly", GameGetFrameNum()+1)
    end
    state.was_w = state.control_w
    local _, y = EntityGetTransform(ctx.my_player.entity)
    ComponentSetValue2(state.control_component, "mFlyingTargetY", y - 10)
end

function module.on_world_update()
    local active = GameHasFlagRun("ew_flag_notplayer_active")
    if active then
        if state == nil then
            init_state()
        end
        update()
    else
        state = nil
    end
end


return module