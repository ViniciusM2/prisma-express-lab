import Halson from "halson";
import HALSONResource from "halson";

/**
 *
 * @param {HALSONResource} resource A HAL Resource for adding the self link.
 * @returns {HALSONResource} If [resource] is not provided, a new HAL Resource will be generated
 */
const renderCollectionSelf = (resource) => {
  //
  if (typeof resource === "undefined") resource = Halson();
  resource.addLink("self", "/users");
  return resource;
};

const renderSpecificSelf = (resource) => {
  //
  resource = Halson(resource);
  resource.addLink("self", `/users/${resource.id}`);
  return resource;
};

export default { renderCollectionSelf, renderSpecificSelf };
