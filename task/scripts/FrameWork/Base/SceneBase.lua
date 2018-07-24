--region *.lua
--Date
--此文件由[BabeLua]插件自动生成
requirePack("scripts.FrameWork.Global.GlobalFunctions");
local SceneBase = class("SceneBase",function (...)
    local sTaskpath, sSource, eCallfrom, bIsMain, pStoryEngine, pParentNode = ...;
    local pStoryTmp = tolua.cast(pStoryEngine, "Ref")
    local pParentTmp = tolua.cast(pParentNode, "Ref")
    return PlayNodeBaseLua:createPlayBaseLua(sTaskpath, sSource, eCallfrom, bIsMain, pStoryTmp, pParentTmp)
end);

--[[
    创建New 方法
]]--
g_tConfigTable.CREATE_NEW(SceneBase);

function SceneBase:ctor(...)
    -- 复制全局变量
    local sTaskpath, sSource, eCallfrom, bIsMain, pStoryEngine, pParentNode = ...;
    g_tConfigTable.sTaskpath = sTaskpath;

    -- 注册系统方法
    self:setBaseCallBack( function(sType)
        if sType == "back" then
            self:onExit()
        elseif sType == "onExit" then
            self:onExit()
        elseif sType == "onEnter" then
            self:onEnter()
        end
    end )
end

function SceneBase:onEnter()

end

function SceneBase:onExit()

end

-- 结束的表现
function SceneBase:moduleEnd()
    self:moduleEndNormal(STORY4V_PLAY_SUCCESS)
end

--[[
    判断当前类型支持哪个模块,返回true是支持，返回false是不支持，
    sEnterType 的值为： engine 是主引擎， v4Scene 是V4Scene场景， group 是group玩法
]]--

function SceneBase.JudgeSuportEnterModule(sEnterType)
    -- if sEnterType == "engine" then
    -- 	return false
    -- end
    return true
end

return SceneBase;
--endregion
