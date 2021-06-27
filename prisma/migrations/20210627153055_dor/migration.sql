/*
  Warnings:

  - You are about to drop the column `accessProfileId` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `educationalInstitutionId` on the `User` table. All the data in the column will be lost.
  - You are about to drop the `AccessProfile` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Conversation` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `EducationalInstitution` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Lead` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Message` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `MessageTemplate` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Permission` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_AccessProfileToPermission` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `Conversation` DROP FOREIGN KEY `Conversation_ibfk_1`;

-- DropForeignKey
ALTER TABLE `Lead` DROP FOREIGN KEY `Lead_ibfk_1`;

-- DropForeignKey
ALTER TABLE `Message` DROP FOREIGN KEY `Message_ibfk_1`;

-- DropForeignKey
ALTER TABLE `Message` DROP FOREIGN KEY `Message_ibfk_2`;

-- DropForeignKey
ALTER TABLE `MessageTemplate` DROP FOREIGN KEY `MessageTemplate_ibfk_1`;

-- DropForeignKey
ALTER TABLE `MessageTemplate` DROP FOREIGN KEY `MessageTemplate_ibfk_2`;

-- DropForeignKey
ALTER TABLE `User` DROP FOREIGN KEY `User_ibfk_2`;

-- DropForeignKey
ALTER TABLE `User` DROP FOREIGN KEY `User_ibfk_1`;

-- DropForeignKey
ALTER TABLE `_AccessProfileToPermission` DROP FOREIGN KEY `_AccessProfileToPermission_ibfk_1`;

-- DropForeignKey
ALTER TABLE `_AccessProfileToPermission` DROP FOREIGN KEY `_AccessProfileToPermission_ibfk_2`;

-- AlterTable
ALTER TABLE `User` DROP COLUMN `accessProfileId`,
    DROP COLUMN `educationalInstitutionId`;

-- DropTable
DROP TABLE `AccessProfile`;

-- DropTable
DROP TABLE `Conversation`;

-- DropTable
DROP TABLE `EducationalInstitution`;

-- DropTable
DROP TABLE `Lead`;

-- DropTable
DROP TABLE `Message`;

-- DropTable
DROP TABLE `MessageTemplate`;

-- DropTable
DROP TABLE `Permission`;

-- DropTable
DROP TABLE `_AccessProfileToPermission`;
