
#ifndef OTBLearningBase_EXPORT_H
#define OTBLearningBase_EXPORT_H

#ifdef OTB_STATIC
#  define OTBLearningBase_EXPORT
#  define OTBLearningBase_HIDDEN
#  define OTBLearningBase_EXPORT_TEMPLATE
#  define OTBLearningBase_EXPORT_EXPLICIT_TEMPLATE
#else
#  ifndef OTBLearningBase_EXPORT
#    ifdef OTBLearningBase_EXPORTS
        /* We are building this library */
#      define OTBLearningBase_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define OTBLearningBase_EXPORT __attribute__((visibility("default")))
#    endif
#  endif
#  ifndef OTBLearningBase_EXPORT_TEMPLATE
        /* We are building this library */
#      define OTBLearningBase_EXPORT_TEMPLATE __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define OTBLearningBase_EXPORT_TEMPLATE __attribute__((visibility("default")))
#  endif
#  ifndef OTBLearningBase_EXPORT_EXPLICIT_TEMPLATE
        /* We are building this library */
#      define OTBLearningBase_EXPORT_EXPLICIT_TEMPLATE 
#    else
        /* We are using this library */
#      define OTBLearningBase_EXPORT_EXPLICIT_TEMPLATE 
#  endif
#  ifndef OTBLearningBase_HIDDEN
#    define OTBLearningBase_HIDDEN __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef OTBLearningBase_DEPRECATED
#  define OTBLearningBase_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef OTBLearningBase_DEPRECATED_EXPORT
#  define OTBLearningBase_DEPRECATED_EXPORT OTBLearningBase_EXPORT OTBLearningBase_DEPRECATED
#endif

#ifndef OTBLearningBase_DEPRECATED_NO_EXPORT
#  define OTBLearningBase_DEPRECATED_NO_EXPORT OTBLearningBase_HIDDEN OTBLearningBase_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef OTBLEARNINGBASE_NO_DEPRECATED
#    define OTBLEARNINGBASE_NO_DEPRECATED
#  endif
#endif

#endif /* OTBLearningBase_EXPORT_H */
