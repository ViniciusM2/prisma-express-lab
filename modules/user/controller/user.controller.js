import linkRendererService from "../service/linkRenderer.service";
import embeddedRenderer from "../service/embeddedRenderer.service";
import collectionService from "../service/collection.service";
import singleResourceService from "../service/singleResource.service";

/**
 * Provides main functions used on '/' route express.METHOD() definitions
 */
export class UserController {
  /**
   * Provides main functions used on '/' route express.METHOD() definitions
   */

  constructor() {}

  /**
   * Renders the root resource for the API
   * @param {*} req express' req object, representing an HTTP Request
   * @param {*} res express' res object, representing an HTTP Response
   * @param {*} next express' next function
   */
  async renderListOfUsersResource(req, res) {
    // render the mandatory 'self' link relation
    let userResource = linkRendererService.renderCollectionSelf();
    userResource = await embeddedRenderer.renderUsersList(userResource);
    // send the resource as JSON
    res.json(userResource);
  }

  async renderSpecificUserResource(req, res) {
    return res.json(
      await singleResourceService.render(parseInt(req.params.id))
    );
  }

  async appendUserToListOfUsers(req, res) {
    return res.json(await collectionService.append(req.body));
  }

  async obliterateUser(req, res) {
    await singleResourceService.obliterate(parseInt(req.params.id));
    return res.status(204).send();
  }

  async editUser(req, res) {
    await singleResourceService.edit(parseInt(req.params.id),req.body);
    return res.status(204).send();
  }
}
