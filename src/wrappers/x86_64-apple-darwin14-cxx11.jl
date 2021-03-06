# Autogenerated wrapper script for duneistl_julia_jll for x86_64-apple-darwin14-cxx11
export libduneistl

using CompilerSupportLibraries_jll
using libcxxwrap_julia_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "DYLD_FALLBACK_LIBRARY_PATH"
LIBPATH_default = "~/lib:/usr/local/lib:/lib:/usr/lib"

# Relative path to `libduneistl`
const libduneistl_splitpath = ["lib", "libduneistl-julia.dylib"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libduneistl_path = ""

# libduneistl-specific global declaration
# This will be filled out by __init__()
libduneistl_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libduneistl = "@rpath/libduneistl-julia.dylib"


# Inform that the wrapper is available for this platform
wrapper_available = true

"""
Open all libraries
"""
function __init__()
    # This either calls `@artifact_str()`, or returns a constant string if we're overridden.
    global artifact_dir = find_artifact_dir()

    global PATH_list, LIBPATH_list
    # Initialize PATH and LIBPATH environment variable listings
    # From the list of our dependencies, generate a tuple of all the PATH and LIBPATH lists,
    # then append them to our own.
    foreach(p -> append!(PATH_list, p), (CompilerSupportLibraries_jll.PATH_list, libcxxwrap_julia_jll.PATH_list,))
    foreach(p -> append!(LIBPATH_list, p), (CompilerSupportLibraries_jll.LIBPATH_list, libcxxwrap_julia_jll.LIBPATH_list,))

    global libduneistl_path = normpath(joinpath(artifact_dir, libduneistl_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libduneistl_handle = dlopen(libduneistl_path, RTLD_LAZY | RTLD_DEEPBIND)
    push!(LIBPATH_list, dirname(libduneistl_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(vcat(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)]), ':')

    
end  # __init__()
