obs = obslua

function script_load(settings)
        stuff = {}
        local scenes = obs.obs_frontend_get_scenes()
        for _, scene in pairs(scenes) do
                local name = obs.obs_source_get_name(scene)
                local sh = obs.obs_source_get_signal_handler(scene)
                obs.signal_handler_connect(sh, "item_transform", item_transform)
                obs.signal_handler_connect(sh, "activate", activate)
        end
        obs.source_list_release(scenes)
end

function activate(cd)
        local source = obs.calldata_source(cd, "source")
        local name = obs.obs_source_get_name(source)
        print(name)

        local scene = obs.obs_scene_from_source(source)
        -- find all of the items in the new scene
        local items = obs.obs_scene_enum_items(scene)
        for _, item in ipairs(items) do
                fit_to_bounds(item)
        end
        obs.sceneitem_list_release(items)
end

function fit_to_bounds(item)
        source = obs.obs_sceneitem_get_source(item)
        local source_type = obs.obs_source_get_unversioned_id(source)

        if source_type ~= "browser_source" then
                return
        end
        local data = obs.obs_source_get_settings(source)
        info = obs.obs_transform_info()
        obs.obs_sceneitem_get_info(item, info)
        local width = info.bounds.x
        local height = info.bounds.y
        if width ~= 0 and height ~= 0 then
                obs.obs_data_set_int(data, "width", width)
                obs.obs_data_set_int(data, "height", height)
                obs.obs_source_update(source, data)
        end
        obs.obs_data_release(data)
end

function item_transform(cd)
        local item = obs.calldata_sceneitem(cd, "item")
        if item ~= nil then
                fit_to_bounds(item)
	end
end
