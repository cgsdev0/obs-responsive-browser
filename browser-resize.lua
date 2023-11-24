obs = obslua

function script_load(settings)
        stuff = {}
        local scenes = obs.obs_frontend_get_scenes()
        for _, scene in pairs(scenes) do
                local name = obs.obs_source_get_name(scene)
                local sh = obs.obs_source_get_signal_handler(scene)
                obs.signal_handler_connect(sh, "item_transform", item_transform)
        end
        obs.source_list_release(scenes)
end

stuff = {}

function item_transform(cd)
        local item = obs.calldata_sceneitem(cd, "item")
        if item ~= nil then
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
                        local id = obs.obs_sceneitem_get_id(item)
                        local name = obs.obs_source_get_name(source)
                        local cached = stuff[name]
                        if cached == nil or cached.modified_by == id then
                                obs.obs_data_set_int(data, "width", width)
                                obs.obs_data_set_int(data, "height", height)
                                obs.obs_source_update(source, data)
                                stuff[name] = {width=width, height=height, modified_by=id}
                        else
                                obs.obs_data_set_int(data, "width", cached.width)
                                obs.obs_data_set_int(data, "height", cached.height)
                                obs.obs_source_update(source, data)
                                info.bounds.x = cached.width
                                info.bounds.y = cached.height
                                stuff[name].modified_by = id
                                obs.obs_sceneitem_set_info(item, info)
                        end
                end
                
                obs.obs_data_release(data)
	end
end
