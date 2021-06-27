import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

const append = async (body) => {
    console.info(body)
  const user = await prisma.user.create({
    data: {
      name: body.name,
      email: body.email,
    },
  });
  return user;
};

export default { append };
