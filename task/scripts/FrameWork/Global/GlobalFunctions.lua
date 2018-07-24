--region *.lua
--Date
--此文件由[BabeLua]插件自动生成
g_tConfigTable.IsOpenDebug = true;
g_tConfigTable.CREATE_NEW = function (classObj)
    classObj.new = function (...)
        -- 创建实例
        local instance = {};

        -- 创建基类的基类
        if classObj.__create then 
            instance = classObj.__create(...) 
        end

        -- 复制基类键值对
        for k,v in pairs(classObj) do 
            instance[k] = v;
        end

        instance.class = classObj;
        instance:ctor(...);
        return instance;
    end
end


__G__TRACKBACK__ = function(msg)
    local message = msg;
    local msg = debug.traceback(msg, 3)
    print(msg)

    --[[获取debug本地配置文件]]--
    local ferrConfig = io.open(g_tConfigTable.sTaskpath.."DebugConfig.txt", "r");
    local errStr = ferrConfig:read("*a");

    --[[ 创建错误屏幕提醒 ]]--
    if(errStr == "TRUE") then 
        local size = cc.Director:getInstance():getWinSize();
        local label = cc.Label:createWithSystemFont(msg, "Arial", 18);
        label:setPosition(size.width/2,size.height/2);
        label:setRotation(-90);
        cc.Director:getInstance():getRunningScene():addChild(label);
    end
    

    --[[ 创建错误写入本地 ]]--
    local f = io.open(g_tConfigTable.sTaskpath.."bugTraceBack.txt", "w");
    f:write(msg);
    f:close();

    return msg
end

--endregion
