import linkRendererService from '../service/linkRenderer.service'
/**
 * Provides main functions used on '/' route express.METHOD() definitions 
 */
export class RootController {
    /**
 * Provides main functions used on '/' route express.METHOD() definitions 
 */

    constructor() { }

    /**
 * Renders the root resource for the API
 * @param {*} req express' req object, representing an HTTP Request
 * @param {*} res express' res object, representing an HTTP Response
 * @param {*} next express' next function
 */
    renderRootResource(req, res) {
        // render the mandatory 'self' link relation
        let rootResource = linkRendererService.renderSelf()
        rootResource = linkRendererService.renderReferenceToUsers(rootResource)
        // send the resource as JSON
        res.json(rootResource)
    }
}
