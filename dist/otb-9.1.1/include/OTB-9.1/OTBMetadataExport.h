
#ifndef OTBMetadata_EXPORT_H
#define OTBMetadata_EXPORT_H

#ifdef OTB_STATIC
#  define OTBMetadata_EXPORT
#  define OTBMetadata_HIDDEN
#  define OTBMetadata_EXPORT_TEMPLATE
#  define OTBMetadata_EXPORT_EXPLICIT_TEMPLATE
#else
#  ifndef OTBMetadata_EXPORT
#    ifdef OTBMetadata_EXPORTS
        /* We are building this library */
#      define OTBMetadata_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define OTBMetadata_EXPORT __attribute__((visibility("default")))
#    endif
#  endif
#  ifndef OTBMetadata_EXPORT_TEMPLATE
        /* We are building this library */
#      define OTBMetadata_EXPORT_TEMPLATE __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define OTBMetadata_EXPORT_TEMPLATE __attribute__((visibility("default")))
#  endif
#  ifndef OTBMetadata_EXPORT_EXPLICIT_TEMPLATE
        /* We are building this library */
#      define OTBMetadata_EXPORT_EXPLICIT_TEMPLATE 
#    else
        /* We are using this library */
#      define OTBMetadata_EXPORT_EXPLICIT_TEMPLATE 
#  endif
#  ifndef OTBMetadata_HIDDEN
#    define OTBMetadata_HIDDEN __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef OTBMetadata_DEPRECATED
#  define OTBMetadata_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef OTBMetadata_DEPRECATED_EXPORT
#  define OTBMetadata_DEPRECATED_EXPORT OTBMetadata_EXPORT OTBMetadata_DEPRECATED
#endif

#ifndef OTBMetadata_DEPRECATED_NO_EXPORT
#  define OTBMetadata_DEPRECATED_NO_EXPORT OTBMetadata_HIDDEN OTBMetadata_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef OTBMETADATA_NO_DEPRECATED
#    define OTBMETADATA_NO_DEPRECATED
#  endif
#endif

#endif /* OTBMetadata_EXPORT_H */
