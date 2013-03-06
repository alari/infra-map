###
Trick from CoffeeScript FAQ for emulating namespaces

Usage:
namespace 'namespaceName', (exports) ->
    exports.ClassToExport = ClassToExport
###
namespace = (target, name, block) ->
    [target, name, block] = [(if typeof exports isnt 'undefined' then exports else window), arguments...] if arguments.length < 3
    top = target
    target = target[item] or= {} for item in name.split '.'
    block target, top

DEFAILT_NAMESPACE = 'infra_map'

bound_namespace = (block) ->
    namespace DEFAILT_NAMESPACE, block

namespace DEFAILT_NAMESPACE, (exports) ->
    exports.namespace = bound_namespace
