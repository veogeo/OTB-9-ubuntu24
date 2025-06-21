
#ifndef OTBStreaming_EXPORT_H
#define OTBStreaming_EXPORT_H

#ifdef OTB_STATIC
#  define OTBStreaming_EXPORT
#  define OTBStreaming_HIDDEN
#  define OTBStreaming_EXPORT_TEMPLATE
#  define OTBStreaming_EXPORT_EXPLICIT_TEMPLATE
#else
#  ifndef OTBStreaming_EXPORT
#    ifdef OTBStreaming_EXPORTS
        /* We are building this library */
#      define OTBStreaming_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define OTBStreaming_EXPORT __attribute__((visibility("default")))
#    endif
#  endif
#  ifndef OTBStreaming_EXPORT_TEMPLATE
        /* We are building this library */
#      define OTBStreaming_EXPORT_TEMPLATE __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define OTBStreaming_EXPORT_TEMPLATE __attribute__((visibility("default")))
#  endif
#  ifndef OTBStreaming_EXPORT_EXPLICIT_TEMPLATE
        /* We are building this library */
#      define OTBStreaming_EXPORT_EXPLICIT_TEMPLATE 
#    else
        /* We are using this library */
#      define OTBStreaming_EXPORT_EXPLICIT_TEMPLATE 
#  endif
#  ifndef OTBStreaming_HIDDEN
#    define OTBStreaming_HIDDEN __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef OTBStreaming_DEPRECATED
#  define OTBStreaming_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef OTBStreaming_DEPRECATED_EXPORT
#  define OTBStreaming_DEPRECATED_EXPORT OTBStreaming_EXPORT OTBStreaming_DEPRECATED
#endif

#ifndef OTBStreaming_DEPRECATED_NO_EXPORT
#  define OTBStreaming_DEPRECATED_NO_EXPORT OTBStreaming_HIDDEN OTBStreaming_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef OTBSTREAMING_NO_DEPRECATED
#    define OTBSTREAMING_NO_DEPRECATED
#  endif
#endif

#endif /* OTBStreaming_EXPORT_H */
