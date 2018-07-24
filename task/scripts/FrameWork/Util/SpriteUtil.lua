--region *.lua
--Date
--此文件由[BabeLua]插件自动生成
local SpriteUtil = {}
g_tConfigTable.CREATE_NEW(SpriteUtil);

SpriteUtil.Create = function (imageName)
    return cc.Sprite:create(g_tConfigTable.sTaskpath.."bgimg/"..imageName);
end

return SpriteUtil;
--endregion
