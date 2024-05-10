workspace "GLFWWindowWorkspace"
    architecture "ARM64"

    configurations {
        "Debug",
        "Release"
    }

    IncludeDir = {}
    IncludeDir["glfw"] = "%{wks.location}/vendor/GLFW/include"

    group "Dependencies"
        include "vendor/GLFW"

    group "Core"
        project "GLFWWindow"
        kind "ConsoleApp"
        language "C++"
        cppdialect "C++20"

        targetdir ("%{wks.location}/bin/%{cfg.platform}_%{cfg.buildcfg}/%{prj.name}")
	    objdir ("%{wks.location}/bin-int/%{cfg.platform}_%{cfg.buildcfg}/%{prj.name}")

        files {
            "src/**.h",
            "src/**.hpp",
            "src/**.cpp"
        }

        includedirs {
            "%{IncludeDir.glfw}"
        }
      
        links {
            "OpenGL.framework",
            "Cocoa.framework",
            "IOKit.framework",
            "CoreFoundation.framework",
            "QuartzCore.framework",
            "GLFW"
        }

        filter "configurations:Debug"
            runtime "Debug"
            symbols "On"
    
        filter "configurations:Release"
            runtime "Release"
            optimize "On"

