function(tinycnn_status text)
    message(STATUS ${text})
endfunction()

####
# Prints accumulated tiny-cnn configuration summary
# Usage:
#   tinycnn_print_configuration_summary()

function(tinycnn_print_configuration_summary)
    tinycnn_status("")
    tinycnn_status("******************* tiny-cnn Configuration Summary *******************")
    tinycnn_status("General:")
    tinycnn_status("  Version           :   ${PROJECT_VERSION}")
    tinycnn_status("  System            :   ${CMAKE_SYSTEM_NAME}")
    tinycnn_status("  C++ compiler      :   ${CMAKE_CXX_COMPILER}")
    tinycnn_status("  Release CXX flags :   ${CMAKE_CXX_FLAGS} ${CMAKE_CXX_FLAGS_RELEASE}")
    tinycnn_status("  Debug CXX flags   :   ${CMAKE_CXX_FLAGS} ${CMAKE_CXX_FLAGS_DEBUG}")
    tinycnn_status("  Build type        :   ${CMAKE_BUILD_TYPE}")
    tinycnn_status("")
    tinycnn_status("  BUILD_EXAMPLES    :   ${BUILD_EXAMPLES}")
    tinycnn_status("  BUILD_TESTS       :   ${BUILD_TESTS}")
    tinycnn_status("  BUILD_DOCS        :   ${BUILD_DOCS}")
    tinycnn_status("")
    tinycnn_status("Dependencies:")
    tinycnn_status("  SSE               :   ${USE_SSE}")
    tinycnn_status("  AVX               :   ${USE_AVX}")
    tinycnn_status("  AVX2              :   ${USE_AVX2}")
    tinycnn_status("  Threads           :   ${USE_THREADS}")
    tinycnn_status("  TBB               :   ${USE_TBB}")
    tinycnn_status("  OMP               :   ${USE_OMP}")
    tinycnn_status("  NNPACK            :   ${USE_NNPACK}")
    tinycnn_status("  OpenCV            :   ${USE_OPENCV}")
    tinycnn_status("")
    tinycnn_status("Install:")
    tinycnn_status("  Install path      :   ${CMAKE_INSTALL_PREFIX}")
    tinycnn_status("")
endfunction()