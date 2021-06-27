/*
  Warnings:

  - You are about to alter the column `action` on the `Permission` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Enum("Permission_action")`.

*/
-- AlterTable
ALTER TABLE `Permission` MODIFY `action` ENUM('GET', 'POST', 'PUT', 'PATCH', 'DELETE', 'SPECIAL') NOT NULL;

-- AlterTable
ALTER TABLE `User` ADD COLUMN `accessProfileId` INTEGER,
    ADD COLUMN `educationalInstitutionId` INTEGER;

-- CreateTable
CREATE TABLE `Lead` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191),
    `whatsAppNumber` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `avatarURI` VARCHAR(191) NOT NULL,
    `conversationId` INTEGER NOT NULL,

    UNIQUE INDEX `Lead_conversationId_unique`(`conversationId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Conversation` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `startedAt` DATETIME(3) NOT NULL,
    `educationalInstitutionId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Message` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `sentAt` DATETIME(3) NOT NULL,
    `body` VARCHAR(191) NOT NULL,
    `authorId` INTEGER NOT NULL,
    `conversationId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `MessageTemplate` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `body` VARCHAR(191) NOT NULL,
    `authorId` INTEGER NOT NULL,
    `educationalInstitutionId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_AccessProfileToPermission` (
    `A` INTEGER NOT NULL,
    `B` INTEGER NOT NULL,

    UNIQUE INDEX `_AccessProfileToPermission_AB_unique`(`A`, `B`),
    INDEX `_AccessProfileToPermission_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `User` ADD FOREIGN KEY (`educationalInstitutionId`) REFERENCES `EducationalInstitution`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `User` ADD FOREIGN KEY (`accessProfileId`) REFERENCES `AccessProfile`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Lead` ADD FOREIGN KEY (`conversationId`) REFERENCES `Conversation`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Conversation` ADD FOREIGN KEY (`educationalInstitutionId`) REFERENCES `EducationalInstitution`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Message` ADD FOREIGN KEY (`authorId`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Message` ADD FOREIGN KEY (`conversationId`) REFERENCES `Conversation`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `MessageTemplate` ADD FOREIGN KEY (`authorId`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `MessageTemplate` ADD FOREIGN KEY (`educationalInstitutionId`) REFERENCES `EducationalInstitution`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_AccessProfileToPermission` ADD FOREIGN KEY (`A`) REFERENCES `AccessProfile`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_AccessProfileToPermission` ADD FOREIGN KEY (`B`) REFERENCES `Permission`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
