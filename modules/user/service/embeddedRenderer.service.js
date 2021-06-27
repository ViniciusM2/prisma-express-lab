import Halson from "halson";
import HALSONResource from "halson";
import linkRendererService from "./linkRenderer.service"

import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

/**
 *
 * @param {HALSONResource} resource A HAL Resource for adding the self link.
 * @returns {HALSONResource} If [resource] is not provided, a new HAL Resource will be generated
 */
const renderUsersList = async (resource) => {
  const users = await prisma.user.findMany();
  const parsedUsers = users.map(linkRendererService.renderSpecificSelf)

  //
  if (typeof resource === "undefined") resource = Halson();
  resource.addEmbed("users", parsedUsers);
  return resource;
};

export default { renderUsersList };
