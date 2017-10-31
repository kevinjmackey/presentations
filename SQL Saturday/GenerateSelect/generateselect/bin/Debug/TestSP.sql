
        USE [WideWorldImporters]
        GO 
        SET QUOTED_IDENTIFIER ON
        GO
        SET ANSI_NULLS ON
        GO

        IF EXISTS (
        SELECT * FROM dbo.sysobjects
        WHERE id = OBJECT_ID(N'People_Select_One')
        AND OBJECTPROPERTY(id, N'IsProcedure') = 1)

        DROP PROCEDURE People_Select_One
        GO

/*
========================================================================================================================
-- People_Select_One
-- Generated on: 2017-10-07
-- Generator Version: 1.0
-- Template Version : 1.0
-- ========================================================================================================================
*/
        CREATE PROCEDURE [dbo].[People_Select_One] 
        (@PeopleID INT = NULL) AS
        BEGIN --Procedure

            SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
            SET NOCOUNT ON;
            SET XACT_ABORT ON;
    
            SELECT 
                [T].[PersonID],
                [T].[FullName],
                [T].[PreferredName],
                [T].[SearchName],
                [T].[IsPermittedToLogon],
                [T].[LogonName],
                [T].[IsExternalLogonProvider],
                [T].[HashedPassword],
                [T].[IsSystemUser],
                [T].[IsEmployee],
                [T].[IsSalesperson],
                [T].[UserPreferences],
                [T].[PhoneNumber],
                [T].[FaxNumber],
                [T].[EmailAddress],
                [T].[Photo],
                [T].[CustomFields],
                [T].[OtherLanguages]
            FROM [Application].[People] AS [T]
            WHERE [T].[PersonID] = @PeopleID
    
        END --Procedure
    