import Halson from 'halson'
import HALSONResource from 'halson'

/**
 * 
 * @param {HALSONResource} resource A HAL Resource for adding the self link. 
 * @returns {HALSONResource} If [resource] is not provided, a new HAL Resource will be generated
 */
const renderSelf = (resource) => {
    // 
    if (typeof resource === 'undefined') resource = Halson()
    resource.addLink('self', '/')
    return resource
}

const renderReferenceToUsers = (resource) => {
    // 
    if (typeof resource === 'undefined') resource = Halson()
    resource.addLink('users', '/users')
    return resource
}

export default { renderSelf, renderReferenceToUsers }