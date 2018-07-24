
requirePack("scripts.FrameWork.Global.GlobalFunctions");
local GridManager = requirePack("scripts.FrameWork.AI.GridsAndAStar.GridManager")

local SceneBase = requirePack("scripts.FrameWork.Base.SceneBase");

local Scene = class("Scene", function(...)
    -- 创建sceneBase基类
    return SceneBase.new(...);
end )

--[[
    场景子类创建new 方法
]]--
g_tConfigTable.CREATE_NEW (Scene);

--[[
    场景子类初始化方法
]]--
function Scene:ctor(...)
    local size = cc.Director:getInstance():getWinSize();
    local rect = cc.rect(0,0,size.width,size.height);
    local gridSize = cc.size(10,70);
    self.gridManager_ = GridManager.Create(rect,gridSize);
    self.gridManager_:SetDebugPaintNodeParent(self);
    self.gridManager_:SetDebugIsOn(true);
    self.gridManager_:SetGridPassValue(cc.p(8,3),100);
    self.gridManager_:SetGridPassValue(cc.p(7,3),100);
    self.gridManager_:SetGridPassValue(cc.p(9,8),100);
    self.gridManager_:SetGridCouldPass(cc.p(1,7) ,false);
    self.gridManager_:SetGridCouldPass(cc.p(2,7) ,false);
    self.gridManager_:SetGridCouldPass(cc.p(3,7) ,false);
    self.gridManager_:SetGridCouldPass(cc.p(4,7) ,false);
    self.gridManager_:SetGridCouldPass(cc.p(5,7) ,false);
    self.gridManager_:SetGridCouldPass(cc.p(6,7) ,false);
    self.gridManager_:SetGridCouldPass(cc.p(7,7) ,false);
    --self.gridManager_:SetGridCouldPass(cc.p(8,7) ,false);
    self.gridManager_:SetGridCouldPass(cc.p(10,7),false);

    local path = self.gridManager_:FindWayByAStar(cc.p(8,1),cc.p(8,40));
    local listOfPaintPath = {};
    for k,v in ipairs(path) do 
        table.insert(listOfPaintPath,v:GetPos());
    end
    self.gridManager_:setPath(listOfPaintPath);
    self.gridManager_:refreshDebugPaint();
end



return Scene
