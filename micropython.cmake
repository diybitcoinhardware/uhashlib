# Create an INTERFACE library for our C module.
add_library(hashlib INTERFACE)

# Add our source files to the lib
target_sources(hashlib INTERFACE
    ${CMAKE_CURRENT_LIST_DIR}/crypto/ripemd160.c
    ${CMAKE_CURRENT_LIST_DIR}/crypto/sha2.c
    ${CMAKE_CURRENT_LIST_DIR}/crypto/hmac.c
    ${CMAKE_CURRENT_LIST_DIR}/crypto/pbkdf2.c
    ${CMAKE_CURRENT_LIST_DIR}/crypto/memzero.c
    ${CMAKE_CURRENT_LIST_DIR}/hashlib.c
    ${CMAKE_CURRENT_LIST_DIR}/uhmac.c
)

# Add the current directory as an include directory.
target_include_directories(hashlib INTERFACE
    ${CMAKE_CURRENT_LIST_DIR}/
    ${CMAKE_CURRENT_LIST_DIR}/crypto
)
# target_compile_options(hashlib INTERFACE
#     -DHAVE_CONFIG_H 
#     -Wno-unused-function
#     -Wno-error
# )

# Link our INTERFACE library to the usermod target.
target_link_libraries(usermod INTERFACE hashlib)
