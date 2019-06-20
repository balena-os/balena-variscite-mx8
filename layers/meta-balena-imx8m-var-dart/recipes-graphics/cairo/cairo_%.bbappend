# This fixes plymouth build depencency
# issue caused by no provider for egl and libgles2
PACKAGECONFIG_remove_imxgpu3d = " egl glesv2"
