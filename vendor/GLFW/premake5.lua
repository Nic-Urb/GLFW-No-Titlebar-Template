project "GLFW"
    kind "StaticLib"
    language "C"
    staticruntime "on"

    targetdir ("%{wks.location}/bin/%{cfg.platform}_%{cfg.buildcfg}/%{prj.name}")
	objdir ("%{wks.location}/bin-int/%{cfg.platform}_%{cfg.buildcfg}/%{prj.name}")

    -- support only for MacOS

    files {
        "include/GLFW/glfw3.h",
		"include/GLFW/glfw3native.h",
		"src/glfw_config.h",
		"src/context.c",
		"src/init.c",
		"src/input.c",
		"src/monitor.c",
		"src/vulkan.c",
		"src/window.c",
		"src/platform.c",
		"src/null_init.c",
		"src/null_monitor.c",
		"src/null_window.c",
		"src/null_joystick.c"
    }

    defines {
        "_GLFW_COCOA"
    }

    filter "system:macosx"
        pic "On"
        systemversion "latest"

        externalincludedirs {"include"}
        files
        {
            "src/cocoa_init.m",
            "src/cocoa_joystick.m",
            "src/cocoa_monitor.m",
            "src/cocoa_window.m",
            "src/cocoa_time.c",
            "src/posix_thread.c",
	        "src/posix_module.c",
	        "src/posix_poll.c",
            "src/nsgl_context.m",
            "src/egl_context.c",
            "src/osmesa_context.c"
        }
        
        defines
        {
            defines "_GLFW_COCOA"
        }

        print ("Using MacOS settings")

    filter "files:**.m"
        compileas "Objective-C"

    filter "configurations:Debug"
        runtime "Debug"
        symbols "On"
    
    filter "configurations:Release"
        runtime "Release"
        optimize "On"