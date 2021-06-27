import { PrismaClient } from "@prisma/client";
import linkRendererService from "./linkRenderer.service";

const prisma = new PrismaClient();

const render = async (id) => {
  const user = await prisma.user.findUnique({
    where: {
      id: id,
    },
  });

  const parsedUser = linkRendererService.renderSpecificSelf(user);

  return parsedUser;
};

const obliterate = async (id) => {
  const deleteUser = await prisma.user.delete({
    where: {
      id: id,
    },
  });
};

const edit = async (id, resource) => {
  if (resource.name) {
    const updateUser = await prisma.user.update({
      where: {
        id: id,
      },
      data: {
        name: resource.name,
      },
    });
  }
  if (resource.email) {
    const updateUser = await prisma.user.update({
      where: {
        id: id,
      },
      data: {
        email: resource.email,
      },
    });
  }
};

export default { render, obliterate, edit };
