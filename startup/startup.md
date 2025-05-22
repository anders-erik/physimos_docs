
# Physimos startup


## Core Resource Access

When booting physimos there are certain core resources that need to be accessed, such as font, icons, shaders, etc. The following procedure should be performed by physimos during start to a) reliably locate the resources, b) avoid the current silent crashes, and c) enable interactive troubleshooting.

The procedure consists of three steps.

### 1. PHYSIMOS_ROOT_DIR

The first step is reading `PHYSIMOS_ROOT_DIR`. This environment variable should, if set, point to the root directory of the core resources. This is usually either the root of the physimos repository or the target directory of the physimos installation.

During development the variable is set by the IDE/Editor/Script to point to the repository root.

On installed (non-development) systems/environments the variable is usually set by the startup script. The startup script (e.g. `/usr/bin/physimos`) will be dynamically generated during installation and should point `PHYSIMOS_ROOT_DIR` to where the user specified physimos to be installed.

This method will thus fail when the main executable is run without the variable being set.

If `PHYSIMOS_ROOT_DIR` is not set, or the core resources can not be found at the place where it is pointing, we fall back on the `cwd` method.


### 2. cwd

The `cdw` method tries to locate core resources in the same directory as the user/parent tried to launch physimos from.

The startup script commonly set this by executing `cd ${INSTALL_DIR}` before main launch. 

If physimos fails to locate the core resources at the `cwd`, then the `troubleshoot-window` is shown.


### 3. troubleshoot-window

The `troubleshoot-window` will, when added, at least tell the user what went wrong. For instance, that the resources physimos depends on was not found, which resources are missing, and a possible way of resolving the problem.

In addition I'd like to be able to resolve the problem from the window itself by providing a working directory path, or try to reinstall. 



