

SET QUOTED_IDENTIFIER OFF;
GO
USE [iWebSquare_DB_TC];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO



IF OBJECT_ID(N'[dbo].[FK_Book_Auther]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Book] DROP CONSTRAINT [FK_Book_Auther];
GO
IF OBJECT_ID(N'[dbo].[FK_Book_Tag]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Book] DROP CONSTRAINT [FK_Book_Tag];
GO



IF OBJECT_ID(N'[dbo].[Auther]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Auther];
GO
IF OBJECT_ID(N'[dbo].[Book]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Book];
GO
IF OBJECT_ID(N'[dbo].[Tag]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Tag];
GO



-- Creating table 'Authers'
CREATE TABLE [dbo].[Authers] (
    [AutherID] bigint IDENTITY(1,1) NOT NULL,
    [AutherName] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'Books'
CREATE TABLE [dbo].[Books] (
    [BookID] bigint IDENTITY(1,1) NOT NULL,
    [BookName] nvarchar(max)  NOT NULL,
    [Descrption] nvarchar(max)  NOT NULL,
    [Price] decimal(10,2)  NOT NULL,
    [AutherID] bigint  NOT NULL,
    [TagID] bigint  NOT NULL
);
GO

-- Creating table 'Tags'
CREATE TABLE [dbo].[Tags] (
    [TagID] bigint IDENTITY(1,1) NOT NULL,
    [TagName] nvarchar(50)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [AutherID] in table 'Authers'
ALTER TABLE [dbo].[Authers]
ADD CONSTRAINT [PK_Authers]
    PRIMARY KEY CLUSTERED ([AutherID] ASC);
GO

-- Creating primary key on [BookID] in table 'Books'
ALTER TABLE [dbo].[Books]
ADD CONSTRAINT [PK_Books]
    PRIMARY KEY CLUSTERED ([BookID] ASC);
GO

-- Creating primary key on [TagID] in table 'Tags'
ALTER TABLE [dbo].[Tags]
ADD CONSTRAINT [PK_Tags]
    PRIMARY KEY CLUSTERED ([TagID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [AutherID] in table 'Books'
ALTER TABLE [dbo].[Books]
ADD CONSTRAINT [FK_Book_Auther]
    FOREIGN KEY ([AutherID])
    REFERENCES [dbo].[Authers]
        ([AutherID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Book_Auther'
CREATE INDEX [IX_FK_Book_Auther]
ON [dbo].[Books]
    ([AutherID]);
GO

-- Creating foreign key on [TagID] in table 'Books'
ALTER TABLE [dbo].[Books]
ADD CONSTRAINT [FK_Book_Tag]
    FOREIGN KEY ([TagID])
    REFERENCES [dbo].[Tags]
        ([TagID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Book_Tag'
CREATE INDEX [IX_FK_Book_Tag]
ON [dbo].[Books]
    ([TagID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------