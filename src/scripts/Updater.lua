-- Auto Updater
__PKGNAME__ = __PKGNAME__ or {}
__PKGNAME__.MupdateUser = "__PKGNAME__.AutoMupdate"
__PKGNAME__.MupdateFunction = "__PKGNAME__:AutoMupdate"

function __PKGNAME__:AutoMupdate(handle)
    debugc("AutoMupdate - Package Name: __PKGNAME__, Handle: " .. handle)
    if handle ~= self.MupdateUser then return end

    local timerName = "__PKGNAME__.AutoMupdate"
    local timers = getNamedTimers(self.MupdateUser)

    for _, timer in ipairs(timers) do
        if timer.name == timerName then return end
    end

    registerNamedTimer(self.MupdateUser, self.MupdateUser, 2, function()
        deleteAllNamedTimers(self.MupdateUser)

        local Mupdate = require("__PKGNAME__\\Mupdate")
        local updater = Mupdate:new({
            download_path = "https://github.com/gesslar/__PKGNAME__/releases/latest/download/",
            package_name = "__PKGNAME__",
            remote_version_file = "version.txt",
            debug_mode = true,
        })
        updater:Start(function()
            updater:Cleanup()
            updater = nil
        end)
    end)
end

-- Auto Updater
__PKGNAME__ = __PKGNAME__ or {}
__PKGNAME__.MupdateUser = "__PKGNAME__.AutoMupdate"
__PKGNAME__.MupdateFunction = "__PKGNAME__:AutoMupdate"

function __PKGNAME__:AutoMupdate(handle)
  debugc("AutoMupdate - Package Name: __PKGNAME__, Handle: " .. handle)
  if handle ~= self.MupdateUser then return end

    local timerName = "__PKGNAME__.AutoMupdate"
    local timers = getNamedTimers(self.MupdateUser)

    for _, timer in ipairs(timers) do
        if timer.name == timerName then return end
    end

    registerNamedTimer(self.MupdateUser, self.MupdateUser, 2, function()
        deleteAllNamedTimers(self.MupdateUser)

        local Mupdate = require("__PKGNAME__\\Mupdate")
        local updater = Mupdate:new({
            download_path = "https://github.com/gesslar/__PKGNAME__/releases/latest/download/",
            package_name = "__PKGNAME__",
            remote_version_file = "version.txt",
            debug_mode = true,
        })
        updater:Start(function()
            updater:Cleanup()
            updater = nil
        end)
    end)
end

-- Start it up
__PKGNAME__.MupdateLoadHandler = __PKGNAME__.MupdateLoadHandler or
    registerNamedEventHandler (
        __PKGNAME__.MupdateUser, -- username
        "__PKGNAME__.Load", -- handler name
        "sysLoadEvent", -- event name
        function(event)
            __PKGNAME__:AutoMupdate(__PKGNAME__.MupdateUser)
        end
    )
__PKGNAME__.MupdateInstallHandler = __PKGNAME__.MupdateInstallHandler or
    registerNamedEventHandler(
        __PKGNAME__.MupdateUser, -- username
        "__PKGNAME__.Install", -- handler name
        "sysInstallPackage", -- event name
        function(event, package, path)
            if package ~= "__PKGNAME__" then return end
            __PKGNAME__:AutoMupdate(__PKGNAME__.MupdateUser)
        end
    )