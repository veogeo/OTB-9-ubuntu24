
#ifndef OTBCurlAdapters_EXPORT_H
#define OTBCurlAdapters_EXPORT_H

#ifdef OTB_STATIC
#  define OTBCurlAdapters_EXPORT
#  define OTBCurlAdapters_HIDDEN
#  define OTBCurlAdapters_EXPORT_TEMPLATE
#  define OTBCurlAdapters_EXPORT_EXPLICIT_TEMPLATE
#else
#  ifndef OTBCurlAdapters_EXPORT
#    ifdef OTBCurlAdapters_EXPORTS
        /* We are building this library */
#      define OTBCurlAdapters_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define OTBCurlAdapters_EXPORT __attribute__((visibility("default")))
#    endif
#  endif
#  ifndef OTBCurlAdapters_EXPORT_TEMPLATE
        /* We are building this library */
#      define OTBCurlAdapters_EXPORT_TEMPLATE __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define OTBCurlAdapters_EXPORT_TEMPLATE __attribute__((visibility("default")))
#  endif
#  ifndef OTBCurlAdapters_EXPORT_EXPLICIT_TEMPLATE
        /* We are building this library */
#      define OTBCurlAdapters_EXPORT_EXPLICIT_TEMPLATE 
#    else
        /* We are using this library */
#      define OTBCurlAdapters_EXPORT_EXPLICIT_TEMPLATE 
#  endif
#  ifndef OTBCurlAdapters_HIDDEN
#    define OTBCurlAdapters_HIDDEN __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef OTBCurlAdapters_DEPRECATED
#  define OTBCurlAdapters_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef OTBCurlAdapters_DEPRECATED_EXPORT
#  define OTBCurlAdapters_DEPRECATED_EXPORT OTBCurlAdapters_EXPORT OTBCurlAdapters_DEPRECATED
#endif

#ifndef OTBCurlAdapters_DEPRECATED_NO_EXPORT
#  define OTBCurlAdapters_DEPRECATED_NO_EXPORT OTBCurlAdapters_HIDDEN OTBCurlAdapters_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef OTBCURLADAPTERS_NO_DEPRECATED
#    define OTBCURLADAPTERS_NO_DEPRECATED
#  endif
#endif

#endif /* OTBCurlAdapters_EXPORT_H */
